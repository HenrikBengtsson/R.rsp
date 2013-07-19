library("R.rsp")

cat("Tools supported by the package:\n")
print(capabilitiesOf(R.rsp))

# Check whether LaTeX is supported
print(isCapableOf(R.rsp, "latex"))
