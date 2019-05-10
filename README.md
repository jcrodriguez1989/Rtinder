Rtinder: Unofficial API Tinder for R
================

R client for accessing Tinder’s API.

I could not find any scientific project for which to use Tinder data,
**I would love to be informed about the idea that comes to you**.

Since the tinder API is not publicly open. Without the github repository
<https://github.com/fbessez/Tinder> , Rtinder would not have been
possible.

## Features

  - Provides an interface to the tinder API.

  - Allows swiping, getting matches, sending messages, among other
    functions.

## Installation

Rtinder is only available as a GitHub package. To install it run the
following from an R console:

``` r
if (!require("remotes")) {
  install.packages("remotes")
}
remotes::install_github("jcrodriguez1989/Rtinder")
```

## Usage

From an R console type:

``` r
library("Rtinder")
```

``` r
# When first using Rtinder, we should configure the account.
# It will save (by default) the config file in ~/.tinderAccount.R
# It will save just the access token, not the mail nor the password.
# Wont send info to any server besides Facebook.
# You can see configAccount, it is open source ;)
configAccount("MY_FB_REGISTERED_MAIL", "MY_FB_PASSWORD")

# or by SMS with
configAccountSms(MY_PHONE_NUM) # configAccountSms(543516881918)
```

``` r
# Now we can check if it can connect to tinder.
# login() must be executed each time we load Rtinder library.
invisible(login())
```

    ## [1] "You have been successfully authorized!"

``` r
# And finally we can start swiping!
mySwipes <- getSwipes()
# mySwipes is a list
fstSwipe <- mySwipes[[1]]
# fstSwipe is a list
names(fstSwipe)
```

    ##  [1] "type"         "user"         "instagram"    "facebook"    
    ##  [5] "spotify"      "distance_mi"  "content_hash" "s_number"    
    ##  [9] "teaser"       "teasers"

``` r
names(fstSwipe$user)
```

    ## [1] "_id"        "bio"        "birth_date" "name"       "photos"    
    ## [6] "gender"     "jobs"       "schools"
