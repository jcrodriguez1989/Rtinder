#' @rdname sendMessage
#' @export
#'
#' @title
#' Send message
#'
#' @description
#' \code{sendMessage} Sends a message to a match.
#'
#' @param matchId string with the ID of the match
#' @param message string with the message to send
#'
#' @author
#' Juan Cruz Rodriguez \email{jcrodriguez@@bdmg.com.ar}
#'
#' @importFrom httr add_headers content POST
#'

sendMessage <- function(matchId, message) {
    headers <- .getHeaders();
    host <- .getHost();
    url <- paste0(host, '/user/matches/', matchId);
    r <- POST(url,
              config=add_headers(unlist(headers)),
              body=list(message=message),
              encode='json'
    );
    res <- NULL;
    if (r$status_code == 200) {
        res <- content(r);
    } else {
        print(paste("Something went wrong. Could not send your message:",
                    r$status_code));
    }
    return(res);
}
