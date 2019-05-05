#' @rdname getOwnProfile
#' @export
#'
#' @title
#' Get own profile data
#'
#' @description
#' \code{getOwnProfile} Returns your own profile data
#'
#' @importFrom httr add_headers content GET
#'

getOwnProfile <- function() {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/profile")
  r <- GET(url, config = add_headers(unlist(headers)))
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)
  } else {
    print(paste(
      "Something went wrong. Could not get your data:",
      r$status_code
    ))
  }
  return(res)
}
