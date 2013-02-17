cat("Parsed and cleaned up set of command line arguments:\n")
args <- rargs("*")
str(args)


cat("Command line arguments with defaults:\n")
args <- rargs(list("*"), defaults=list(n=4, verbose=FALSE))
str(args)


cat("Command line arguments with defaults and custom arguments:\n")
args <- rargs(list("*", A=3), defaults=list(n=4, verbose=FALSE))
str(args)
