#' @aliases dislike
#' @aliases superlike
#' @aliases reportPerson
#'
#' @rdname likes
#' @export
#'
#' @title
#' Likes
#'
#' @description
#' \code{like} Likes a user.
#' \code{superlike} Superlikes a user.
#' \code{dislike} Dislikes a user.
#' \code{reportPerson} Reports a user.
#'
#' @param personId string containing the desired person ID
#' @param cause string, there are three options for cause:
#' 0 : Other and requires an explanation
#' 1 : Feels like spam and no explanation
#' 4 : Inappropriate Photos and no explanation
#' @param explanation string with the reporting explanation.?
#'
#' @importFrom httr add_headers content POST
#'

like <- function(personId) {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/like/", personId)
  r <- GET(url, config = add_headers(unlist(headers)))
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)
  } else {
    print(paste(
      "Something went wrong. Could not like:",
      r$status_code
    ))
  }
  return(res)
}


#' @rdname likes
#' @export
#'

superlike <- function(personId) {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/like/", personId, "/super")
  r <- POST(url,
    config = add_headers(unlist(headers)),
    encode = "json"
  )
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)
  } else {
    print(paste(
      "Something went wrong. Could not superlike:",
      r$status_code
    ))
  }
  return(res)
}

#' @rdname likes
#' @export
#'

dislike <- function(personId) {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/pass/", personId)
  r <- GET(url, config = add_headers(unlist(headers)))
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)
  } else {
    print(paste(
      "Something went wrong. Could not dislike:",
      r$status_code
    ))
  }
  return(res)
}

#' @rdname likes
#' @export
#'

reportPerson <- function(personId, cause, explanation = "") {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/report/", personId)
  r <- POST(url,
    config = add_headers(unlist(headers)),
    body = list(cause = cause, text = explanation),
    encode = "json"
  )
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)
  } else {
    print(paste(
      "Something went wrong. Could not report:",
      r$status_code
    ))
  }
  return(res)
}
