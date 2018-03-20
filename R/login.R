#' @rdname login
#' @export
#'
#' @title
#' Login to tinder account
#'
#' @description
#' \code{login} Loads tinder's facebook access id and token. And checks if can
#' connect.
#'
#' @details
#' Sources the selected R file, which must have 'userId' and 'accesstoken'
#' variables. And tests if it can connect to tinder's API.
#'
#' @author
#' Juan Cruz Rodriguez \email{jcrodriguez@@bdmg.com.ar}
#'
#' @param accountFile R file to be sourced, with 'userId' and 'fbAuthtoken'
#' variables.
#'
#' @seealso {configAccount}
#'
#' @importFrom httr add_headers content POST
#'
#' @examples \dontrun{
#' # Check if can connect to tinder.
#' # login() must be executed each time we load Rtinder library.
#' login();
#' }
#'

login <- function(accountFile=paste0(Sys.getenv('HOME'), '/.tinderAccount.R')) {
    # try to get headers from github file (updated)
    apiCfg <- try({
        e <- new.env();
        source('https://raw.githubusercontent.com/jcrodriguez1989/Rtinder/master/R/apiCfg.R', e);
        as.list(e);
    });

    if (!inherits(apiCfg, 'try-error')) {
        assign('headers', e$.headers, envir=.pkgGlobalEnv);
        assign('host', e$.host, envir=.pkgGlobalEnv);
    } else {
        assign('headers', .headers, envir=.pkgGlobalEnv);
        assign('host', .host, envir=.pkgGlobalEnv);
    }
    rm(apiCfg); rm(e);
    headers <- .getHeaders();
    host <- .getHost();

    # load tinder account data
    if (!file.access(accountFile[[1]], 4) == 0)
        stop('Can not read accountFile file')
    e <- new.env();
    source(accountFile, e);
    fbUserId <- e$userId;
    fbAuthtoken <- e$accesstoken;
    rm(e);

    # try to login
    url <- paste0(host, '/auth');
    req <- POST(
        url,
        config=add_headers(unlist(headers)),
        body=list(facebook_token=fbAuthtoken, facebook_id=fbUserId),
        encode='json'
    );
    res <- NULL;
    if (req$status_code == 200 || 'token' %in% names(content(req))) {
        tinder_auth_token = content(req)$token;
        headers[["X-Auth-Token"]] <- tinder_auth_token;
        print("You have been successfully authorized!");
        assign('headers', headers, envir=.pkgGlobalEnv);
        res <- tinder_auth_token;
    } else {
        warning(paste('Could not authorize account, error code:',
                    req$status_code));
    }
    return(!is.null(res));
}
