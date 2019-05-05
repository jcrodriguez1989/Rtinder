#' Rtinder package
#'
#' Access to Tinder API in R.
#' Are you a geek and want to meet people? Then Rtinder is for you!
#' Provides an interface to the tinder API. Allows swiping, getting
#' matches, sending messages, etc.
#' Since the tinder API is not publicly open. Without the github repository
#' https://github.com/fbessez/Tinder , Rtinder would not have been possible.
#'
#' @docType package
#' @name rtinderPackage
#'
#' @keywords tinder API
#'
#' @examples
#' \dontrun{
#' # When first using Rtinder, we should configure our account.
#' # It will save (by default) the config file in ~/.tinderAccount.R .
#' configAccount("MY_FB_REGISTERED_MAIL", "MY_FB_PASSWORD")
#' # Now we can check if it can connect to tinder.
#' # login() must be executed each time we load Rtinder library.
#' login()
#' # And finally we can start swiping!
#' mySwipes <- getSwipes()
#' }
#'
NULL
