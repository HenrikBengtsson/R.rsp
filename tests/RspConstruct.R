library("R.rsp")
library("R.oo")

d <- RspConstruct()
print(d)

classes <- getKnownSubclasses(RspConstruct)
print(classes)
for (class in classes) {
  clazz <- Class$forName(class)
  object <- newInstance(clazz)
  print(object)
}

d <- RspConstruct()
print(d)

d <- RspComment()
print(d)

d <- RspText()
print(d)

d <- RspVoid()
print(d)

d <- RspDirective()
print(d)

d <- RspCopyDirective()
print(d)

d <- RspEndcopyDirective()
print(d)

d <- RspCutDirective()
print(d)

d <- RspEndcutDirective()
print(d)

d <- RspPasteDirective()
print(d)

d <- RspExpression()
print(d)

d <- RspCode()
print(d)

d <- RspCodeChunk()
print(d)


