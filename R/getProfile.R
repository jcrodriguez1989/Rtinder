#' @rdname getOwnProfile
#' @export
#'
#' @title
#' Get profile data
#'
#' @description
#' \code{getOwnProfile} Gets a user's profile via their id
#'
#' @param id string containing desired user id
#'
#' @author
#' Juan Cruz Rodriguez \email{jcrodriguez@@bdmg.com.ar}
#'
#' @importFrom httr add_headers content GET
#'

getProfile <- function(id) {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/user/', id);
    r <- GET(url, config=add_headers(unlist(headers)));
    res <- NULL;
    if (r$status_code == 200) {
        res <- content(r)$results;
    } else {
        print(paste("Something went wrong. Could not get that person:",
                    r$status_code));
    }
    return(res);
}
