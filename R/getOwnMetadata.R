#' @rdname getOwnMetadata
#' @export
#'
#' @title
#' Get own user metadata
#'
#' @description
#' \code{getOwnMetadata} Returns metadata on yourself. Including the following keys:
#' ['globals', 'client_resources', 'versions', 'purchases',
#'  'status', 'groups', 'products', 'rating', 'tutorials',
#'   'travel', 'notifications', 'user']
#'
#' @author
#' Juan Cruz Rodriguez \email{jcrodriguez@@bdmg.com.ar}
#'
#' @importFrom httr add_headers content GET
#'

getOwnMetadata <- function() {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/meta');
    r <- GET(url, config=add_headers(unlist(headers)));
    res <- NULL;
    if (r$status_code == 200) {
        res <- content(r);
    } else {
        print(paste("Something went wrong. Could not get your metadata:",
                    r$status_code));
    }
    return(res);
}
