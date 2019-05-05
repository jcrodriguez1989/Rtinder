#' @rdname configAccount
#' @export
#'
#' @title
#' Configure tinder account
#'
#' @description
#' \code{configAccount} Authorizes in Facebook to use tinder App.
#' Saves corresponding Facebook ID and access token to file.
#' Has to be done once. After, \code{login} will continue using this info.
#'
#' @param mail mail to login in Facebook.
#' @param password password to login in Facebook.
#' @param saveAccountFile string with the file where to save account info.
#'
#' @seealso {login}
#'
#' @importFrom httr user_agent
#' @importFrom rvest html_session html_node html_form set_values submit_form
#' @importFrom getPass getPass
#'
#' @examples
#' \dontrun{
#' # When first using Rtinder, we should configure our account.
#' # It will save (by default) the config file in ~/.tinderAccount.R .
#' # It wont save any information about the mail and password.
#' # Nor send it to any server besides Facebook.
#' configAccount("MY_FB_REGISTERED_MAIL", "MY_FB_PASSWORD")
#' }
#'
configAccount <- function(mail, password = getPass("Facebook password:"),
                          saveAccountFile =
                            paste0(Sys.getenv("HOME"), "/.tinderAccount.R")) {
  mobileUserAgent <- "Tinder/7.5.3 (iPhone; iOS 10.3.2; Scale/2.00)"
  fbAuth <- "https://www.facebook.com/v2.6/dialog/oauth?redirect_uri=fb464891386855067%3A%2F%2Fauthorize%2F&display=touch&state=%7B%22challenge%22%3A%22IUUkEUqIGud332lfu%252BMJhxL4Wlc%253D%22%2C%220_auth_logger_id%22%3A%2230F06532-A1B9-4B10-BB28-B29956C71AB1%22%2C%22com.facebook.sdk_client_state%22%3Atrue%2C%223_method%22%3A%22sfvc_auth%22%7D&scope=user_birthday%2Cuser_photos%2Cuser_education_history%2Cemail%2Cuser_relationship_details%2Cuser_friends%2Cuser_work_history%2Cuser_likes&response_type=token%2Csigned_request&default_audience=friends&return_scopes=true&auth_type=rerequest&client_id=464891386855067&ret=login&sdk=ios&logger_id=30F06532-A1B9-4B10-BB28-B29956C71AB1&ext=1470840777&hash=AeZqkIcf-NEW6vBd"

  session <- html_session(fbAuth, user_agent(mobileUserAgent))

  form <- html_form(html_node(session, "form"))
  form <- set_values(form, "email" = mail, "pass" = password)

  session <- submit_form(session, form, "login") # try to login
  if (!grepl("__CONFIRM__", session$response)) {
    stop("Could not authenticate to facebook.")
  }

  form <- html_form(html_node(session, "form"))
  session <- submit_form(session, form, "__CONFIRM__")

  sessResp <- session$response
  userId <- sessResp$cookies[sessResp$cookies$name == "c_user", "value"]
  sessRespString <- as.character(sessResp)
  accesstoken <- sub(
    "&data_access_expiration_time.*", "",
    sub(".*&access_token=", "", sessRespString)
  )

  sink(saveAccountFile)
  cat(paste0("userId <- '", userId, "';\n"))
  cat(paste0("accesstoken <- '", accesstoken, "';\n"))
  sink()
}
