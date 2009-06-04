# Added '...' to some base functions. These will later be
# turned into default functions by setMethodS3().

flush <- appendVarArgs(flush);
restart <- appendVarArgs(restart);
write <- appendVarArgs(write);


############################################################################
# HISTORY:
# 2005-08-01
# o Created to please R CMD check.
############################################################################
