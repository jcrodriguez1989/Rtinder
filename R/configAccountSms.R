#' @rdname configAccountSms
#' @export
#'
#' @title
#' Configure tinder account
#'
#' @description
#' \code{configAccountSms} Authorizes with SMS code to use tinder App.
#' Saves corresponding SMS ID and access token to file.
#' Has to be done once. After, \code{login} will continue using this info.
#'
#' @param number phonr number to login, must have are code.
#' @param saveAccountFile string with the file where to save account info.
#'
#' @seealso {login}
#'
#' @examples
#' \dontrun{
#' # When first using Rtinder, we should configure our account.
#' # It will save (by default) the config file in ~/.tinderAccount.R .
#' # It wont save any information about the phone and code.
#' # Nor send it to any server besides Tinder.
#' configAccountSms("MY_PHONE_NUMBER")
#' }
#'
configAccountSms <- function(number, saveAccountFile =
                              paste0(Sys.getenv("HOME"), "/.tinderAccount.R")) {

  smsReqCodeUrl <- "https://graph.accountkit.com/v1.2/start_login?access_token=AA%7C464891386855067%7Cd1891abb4b0bcdfa0580d9b839f4a522&credentials_type=phone_number&fb_app_events_enabled=1&fields=privacy_policy%2Cterms_of_service&locale=en_US&phone_number=#placeholder&response_type=token&sdk=ios"
  url <- gsub("#placeholder", number, smsReqCodeUrl)
  r <- POST(url)
  if (r$status_code != 200) {
    print(paste(
      "Something went wrong, maybe wrong number:",
      r$status_code
    ))
    return(NULL)
  }
  reqCode <- content(r)$login_request_code
  code <- readline(prompt = "Please enter the code you have received by SMS: ")

  smsValidateCodeUrl <- "https://graph.accountkit.com/v1.2/confirm_login?access_token=AA%7C464891386855067%7Cd1891abb4b0bcdfa0580d9b839f4a522&confirmation_code=#confirmation_code&credentials_type=phone_number&fb_app_events_enabled=1&fields=privacy_policy%2Cterms_of_service&locale=en_US&login_request_code=#request_code&phone_number=#phone_number&response_type=token&sdk=ios"
  smsValidateCodeUrl <- gsub("#confirmation_code", code, smsValidateCodeUrl)
  smsValidateCodeUrl <- gsub("#phone_number", number, smsValidateCodeUrl)
  smsValidateCodeUrl <- gsub("#request_code", reqCode, smsValidateCodeUrl)
  rValidate <- POST(smsValidateCodeUrl)

  if (rValidate$status_code != 200) {
    print(paste(
      "Something went wrong, maybe wrong confirmation code:",
      rValidate$status_code
    ))
    return(NULL)
  }

  validateResponse <- content(rValidate)
  accesstoken <- validateResponse[["access_token"]]
  userId <- validateResponse[["id"]]

  sink(saveAccountFile)
  cat(paste0("userId <- '", userId, "';\n"))
  cat(paste0("smsAccesstoken <- '", accesstoken, "';\n"))
  sink()
}
