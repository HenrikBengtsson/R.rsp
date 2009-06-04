#########################################################################/**
# @set "class=HttpDaemon"
# @RdocMethod processRsp
#
# @title "Processes an RSP page"
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
#  Returns (invisibly) the translated RSP document as a single 
#  @character string.
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
setMethodS3("processRsp", "HttpDaemon", function(static, ...) {
  if (missing(static))
    static <- getStaticInstance(HttpDaemon);

  # Get the request information
  request <- getHttpRequest(static);

  pathname <- as.character(tcltk::tclvalue("mypath"));


  # The connection where to write RSP response output to.
  response <- HttpDaemonRspResponse(httpDaemon=static);

  # Process the RSP
  path <- getParent(pathname);
  filename <- basename(pathname);
  tryCatch({
    opwd <- getwd();

    # Validate the filename
    if (!isFile(pathname))
      stop("File not found: ", pathname);

    HttpDaemon$pwd <- opwd;
    setwd(path);

    tryCatch({
      sourceRsp(file=filename, path=getwd(), request=request, 
                                                          response=response);
    }, error = function(ex) {
      print("ERROR0:");
      write(response, as.character(ex));
      if (!is.null(ex$code))
        write(response, ex$code, collapse="\n");
    }) 
  }, error = function(ex) {
    print("ERROR:");
    print(ex);
    write(response, as.character(ex));
  }, finally = {
    # print("Flushing buffered response.");
    flush(response);
    setwd(opwd);
  })
}, static=TRUE, protected=TRUE)



###############################################################################
# HISTORY:
# 2007-06-10
# o Now all methods of 'tcltk' are called explicitly with prefix 'tcltk::'.
# 2006-01-21
# o Moved processRsp() to its own file.  The purpose is to one day get a
#   HttpDaemon class which does not know of RSP pages.
# 2005-11-30
# o Now processRsp() uses new HttpDaemonResponse class which outputs written
#   response directly to the Tcl HTTP Daemon output stream.  This is one step
#   closer to a immediate output to the browser.
# 2005-09-22
# o Added RSP preprocessor. It really works! Sweet.
# For more history, see HttpDaemon.R.
###############################################################################
