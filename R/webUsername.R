#' @aliases resetWebUsername
#'
#' @rdname webUsername
#' @export
#'
#' @title
#' Modify owns username for the webprofile
#'
#' @description
#' \code{setWebUsername} sets the username for the webprofile: https://www.gotinder.com/@YOURUSERNAME
#' \code{resetWebUsername} resets the username for the webprofile: https://www.gotinder.com/@YOURUSERNAME
#'
#' @param username string with the desired username
#'
#' @author
#' Juan Cruz Rodriguez \email{jcrodriguez@@bdmg.com.ar}
#'
#' @importFrom httr add_headers content PUT DELETE
#'

setWebUsername <- function(username) {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/profile/username');
    r <- PUT(url,
             config=add_headers(unlist(headers)),
             body=list(username=username),
             encode='json'
    );
    res <- NULL;
    if (r$status_code == 204) {
        res <- r;
    } else {
        print(paste("Something went wrong. Could not set webprofile username:",
                    r$status_code));
    }
    return(res);
}

# Resets the username for the webprofile
resetWebUsername <- function(username) {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/profile/username');
    r <- DELETE(url, config=add_headers(unlist(headers)));
    res <- NULL;
    if (r$status_code == 204) {
        res <- r;
    } else {
        print(paste("Something went wrong. Could not delete webprofile username:",
                    r$status_code));
    }
    return(res);
}
