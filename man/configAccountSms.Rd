% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/configAccountSms.R
\name{configAccountSms}
\alias{configAccountSms}
\title{Configure tinder account}
\usage{
configAccountSms(number, saveAccountFile = paste0(Sys.getenv("HOME"),
  "/.tinderAccount.R"))
}
\arguments{
\item{number}{phonr number to login, must have are code.}

\item{saveAccountFile}{string with the file where to save account info.}
}
\description{
\code{configAccountSms} Authorizes with SMS code to use tinder App.
Saves corresponding SMS ID and access token to file.
Has to be done once. After, \code{login} will continue using this info.
}
\examples{
\dontrun{
# When first using Rtinder, we should configure our account.
# It will save (by default) the config file in ~/.tinderAccount.R .
# It wont save any information about the phone and code.
# Nor send it to any server besides Tinder.
configAccountSms("MY_PHONE_NUMBER")
}

}
\seealso{
{login}
}
