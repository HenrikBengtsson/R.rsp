# The RSP file
rspPath <- system.file("rsp/rsp/docs", package="R.rsp")
rspFile <- file.path(rspPath, "helloWorld.rsp")
file.show(rspFile)

# The HTML (output) file
outPath <- tempdir()
response <- FileRspResponse(file="helloWorld.html", path=outPath)

# Process RSP file
sourceRsp(file=rspFile, response=response)

# View generated document
file.show(getOutput(response))

