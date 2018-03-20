.pkgGlobalEnv <- new.env(parent=emptyenv());

.getHost <- function() .pkgGlobalEnv$host;
.getHeaders <- function() .pkgGlobalEnv$headers;
