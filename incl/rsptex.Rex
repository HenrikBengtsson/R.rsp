library("R.rsp")
path <- system.file(package="R.rsp")
path <- file.path(path, "rsp_LoremIpsum")
rsptex("LoremIpsum.tex.rsp", path=path)
