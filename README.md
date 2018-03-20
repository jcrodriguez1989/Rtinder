# Rtinder: Unofficial API Tinder for R

### Access to Tinder API in R.
Are you a geek and want to meet people? Then **Rtinder** is for you!
Provides an interface to the tinder API. Allows swiping, getting
matches, sending messages, etc.
Since the tinder API is not publicly open. Without the github repository
https://github.com/fbessez/Tinder , Rtinder would not have been possible.

### Installation
In R console type:

    R > install.packages('devtools');
    R > library('devtools');
    R > install_github('jcrodriguez1989/Rtinder');

### Usage
    R > library('Rtinder');
    R > 
    R > # When first using Rtinder, we should configure our account.
    R > # It will save (by default) the config file in ~/.tinderAccount.R .
    R > # It wont save any information about the mail and password.
    R > # Nor send it to any server besides Facebook.
    R > configAccount('MY_FB_REGISTERED_MAIL', 'MY_FB_PASSWORD');
    R > 
    R > # Now we can check if it can connect to tinder.
    R > # login() must be executed each time we load Rtinder library.
    R > login();
    R > 
    R > # And finally we can start swiping!
    R > mySwipes <- getSwipes();
