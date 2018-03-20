#' @aliases resetLocation
#' @aliases changeLocationPlus
#'
#' @rdname location
#' @export
#'
#' @title
#' Modify user location
#'
#' @description
#' \code{changeLocation} Updates your location to the given float inputs
#' Note: Careful!
#' \code{resetLocation} Resets your location (to GPS)
#' \code{changeLocationPlus} Updates your location to the given float inputs
#' Note: Requires a passport / Tinder Plus
#'
#' @param lat string with the latitude
#' @param lon string with the longitude
#'
#' @author
#' Juan Cruz Rodriguez \email{jcrodriguez@@bdmg.com.ar}
#'
#' @importFrom httr add_headers content GET
#'

changeLocation <- function(lat, lon) {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/user/ping');
    r <- POST(url,
              config=add_headers(unlist(headers)),
              body=list(lat=lat, lon=lon),
              encode='json'
    );
    res <- NULL;
    if (r$status_code == 200) {
        res <- content(r);
    } else {
        print(paste("Something went wrong. Could not update your location:",
                    r$status_code));
    }
    return(res);
}

resetLocation <- function() {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/passport/user/reset');
    r <- POST(url,
              config=add_headers(unlist(headers)),
              encode='json'
    );
    res <- NULL;
    if (r$status_code == 200) {
        res <- content(r);
    } else {
        print(paste("Something went wrong. Could not update your location:",
                    r$status_code));
    }
    return(res);
}

changeLocationPlus <- function(lat, lon) {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/passport/user/travel');
    r <- POST(url,
              config=add_headers(unlist(headers)),
              body=list(lat=lat, lon=lon),
              encode='json'
    );
    res <- NULL;
    if (r$status_code == 200) {
        res <- content(r);
    } else {
        print(paste("Something went wrong. Could not update your location:",
                    r$status_code));
    }
    return(res);
}
