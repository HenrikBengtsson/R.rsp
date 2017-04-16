# Copy the complete directory tree contain RSP files
rspPath <- system.file("rsp", package="R.rsp")
cat("RSP directory: ", rspPath, "\n")

# Create an output path to contain HTML files
outputPath <- tempdir()
cat("HTML directory: ", outputPath, "\n")

# Process all RSP files (not recursively)
files <- sourceAllRsp(path=rspPath, outputPath=outputPath, extension="html")

cat("Processed the following RSP files:\n")
print(files)

# View generated documents
if (interactive()) {
  library(tools)
  indexFile <- filePath(outputPath, "index.html")
  cat("Trying to open '", indexFile, "' in default browser...\n", sep="")
  browseURL(getAbsolutePath(indexFile))
}
