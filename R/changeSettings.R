#' @rdname changeSettings
#' @export
#'
#' @title
#' Change user settings
#'
#' @description
#' \code{changeSettings} Change own user settings
#'
#' @param settings a named list - whose keys become separate keyword arguments
#' and the values become values of these arguments
#' ex: changeSettings(list(age_filter_min=30, gender=0))
#' age_filter_min: 18..46
#' age_filter_max: 22..55
#' age_filter_min <= age_filter_max - 4
#' gender: 0 == seeking males, 1 == seeking females
#' distance_filter: 1..100
#' discoverable: true | false
#' {"photo_optimizer_enabled":false}
#'
#' @importFrom httr add_headers content POST
#'

changeSettings <- function(settings) {
  headers <- .getHeaders()
  host <- .getHost()
  settings <- list(user = settings)
  url <- paste0(host, "/v2/profile")
  r <- POST(url,
    config = add_headers(unlist(headers)),
    body = settings,
    encode = "json"
  )
  res <- NULL
  if (r$status_code == 200) {
    res <- content(r)$data$user
  } else {
    print(paste(
      "Something went wrong. Could not change your preferences:",
      r$status_code
    ))
  }
  return(res)
}
