###########################################################################/**
# @RdocClass FileRspResponse
#
# @title "The FileRspResponse class"
#
# \description{
#  @classhierarchy
# }
#
# @synopsis
#
# \arguments{
#   \item{file}{A filename or a @connection to write responses to.}
#   \item{path}{An optional path to the file.}
#   \item{overwrite}{If @FALSE, an error is thrown if the output file already
#     exists, otherwise not.}
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
#
# @author
#
# @keyword internal
#*/###########################################################################
setConstructorS3("FileRspResponse", function(file=stdout(), path=NULL, overwrite=FALSE, ...) {
  # Argument 'file' and 'path':
  if (is.character(file)) {
    file <- Arguments$getWritablePathname(file=file, path=path, mustNotExist=!overwrite)
    # Empty the file
    cat(file=file, "")
  } else if (!inherits(file, "connection")) {
    throw("Argument 'file' must be a filename or a connection: ",
                                                          class(file)[1])
  }

  extend(RspResponse(), "FileRspResponse",
    file = file
  )
})



#########################################################################/**
# @RdocMethod getOutput
#
# @title "Gets the output for an RSP response"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @connection or a filename.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#
# @keyword IO
#*/#########################################################################
setMethodS3("getOutput", "FileRspResponse", function(this, ...) {
  this$file
})


setMethodS3("writeResponse", "FileRspResponse", function(this, ..., collapse="", sep="") {
  msg <- paste(..., collapse=collapse, sep=sep)
  msg <- as.character(GString(msg))
  out <- getOutput(this)
  cat(file=out, append=TRUE, msg)
})



setMethodS3("flush", "FileRspResponse", function(con) {
  # To please R CMD check.
  this <- con

  out <- getOutput(this)
  flush(out)
}, appendVarArgs=FALSE)



#########################################################################/**
# @RdocMethod getPath
#
# @title "Gets the path of the directory of the current RSP file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#
# @keyword IO
#*/#########################################################################
setMethodS3("getPath", "FileRspResponse", function(this, ...) {
  getParent(this$file)
}, createGeneric=FALSE)



#########################################################################/**
# @RdocMethod getName
#
# @title "Gets the (base)name of the current RSP file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#
# @keyword IO
#*/#########################################################################
setMethodS3("getName", "FileRspResponse", function(this, ...) {
  basename(this$file)
}, createGeneric=FALSE)



#########################################################################/**
# @RdocMethod getAbsolutePath
#
# @title "Gets the absolute pathname to the current RSP file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#
# @keyword IO
#*/#########################################################################
setMethodS3("getAbsolutePath", "FileRspResponse", function(this, ...) {
  getAbsolutePath(this$file)
}, createGeneric=FALSE)
