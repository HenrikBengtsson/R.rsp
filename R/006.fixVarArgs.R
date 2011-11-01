# Added '...' to some base functions. These will later be
# turned into default functions by setMethodS3().

flush <- appendVarArgs(flush);
write <- appendVarArgs(write);
if (exists("restart", mode="function")) {
  restart <- NULL; rm("restart"); # To please R CMD check on R (>= 2.15.0)
  restart <- appendVarArgs(restart);
}


############################################################################
# HISTORY:
# 2005-08-01
# o Created to please R CMD check.
############################################################################
