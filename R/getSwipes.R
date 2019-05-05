#' @rdname getSwipes
#' @export
#'
#' @title
#' Get swipes
#'
#' @description
#' \code{getSwipes} Returns a list of users that you can swipe on.
#'
#' @importFrom httr add_headers content GET
#'

getSwipes <- function() {
  headers <- .getHeaders()
  host <- .getHost()
  url <- paste0(host, "/v2/recs/core?locale=en-US")
  r <- GET(url, config = add_headers(unlist(headers)))
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)$data$results
  } else {
    print(paste(
      "Something went wrong with getting recomendations:",
      r$status_code
    ))
  }
  return(res)
}

# getSwipes <- function() {
#     headers <- .getHeaders();
#     host <- .getHost();
#     url <- paste0(host, '/user/recs');
#     r <- GET(url,
#              config=add_headers(unlist(headers))
#     );
#     res <- NULL;
#     if (r$status_code == 200) {
#         res <- content(r)$results;
#     } else {
#         print(paste("Something went wrong with getting recomendations:",
#                     r$status_code));
#     }
#     return(res);
# }
