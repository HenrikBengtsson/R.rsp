.rspBracketOpen  <- "<%"
.rspBracketClose <- "%>" 

.rspBracketOpenEscape <- paste(.rspBracketOpen, substring(.rspBracketOpen, nchar(.rspBracketOpen)), sep = "")
.rspBracketCloseEscape <- paste(substring(.rspBracketClose, 1L, 1L), .rspBracketClose, sep = "")

