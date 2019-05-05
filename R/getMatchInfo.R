#' @rdname getMatchInfo
#' @export
#'
#' @title
#' Match info
#'
#' @description
#' \code{getMatchInfo} Get match information
#'
#' @param matchId string containing the match id
#'
#' @importFrom httr add_headers content GET
#'

getMatchInfo <- function(matchId) {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/matches/", matchId)
  r <- GET(url, config = add_headers(unlist(headers)))
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)$results
  } else {
    print(paste(
      "Something went wrong. Could not get your match info:",
      r$status_code
    ))
  }
  return(res)
}
