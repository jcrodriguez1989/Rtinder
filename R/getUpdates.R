#' @rdname getUpdates
#' @export
#'
#' @title
#' Get updates
#'
#' @description
#' \code{getUpdates} Returns all updates since the given activity date.
#'
#' @param lastActivityDate The last activity date is defaulted at the beginning of time.
#' Format for lastActivityDate: "2017-07-09T10:28:13.392Z"
#'
#' @importFrom httr add_headers content POST
#'

getUpdates <- function(lastActivityDate = "") {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/updates")
  r <- POST(url,
    config = add_headers(unlist(headers)),
    body = list(last_activity_date = lastActivityDate),
    encode = "json"
  )
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)
  } else {
    print(paste(
      "Something went wrong with getting updates:",
      r$status_code
    ))
  }
  return(res)
}
