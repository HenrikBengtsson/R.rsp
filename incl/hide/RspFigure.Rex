figure <- RspFigure(label="figA");
setCaption(figure, "Left: A scatter plot. Right: A histogram.");
setLayout(figure, matrix(1:2, ncol=2));
setImages(figure, sprintf("image001-%02d.png", 1:2));
cat(asHtml(figure, 2));
