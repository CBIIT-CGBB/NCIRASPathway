
grid_image <- function (image.file=file.p, grid.s=10, col=col[7], xy.lab=T){

  Image   <- EBImage::readImage(file.p);
  max.x  <- dim(Image)[1];
  max.y  <- dim(Image)[2];
  
  plot(0:max.x, seq(0, max.y, length.out = (max.x+1)), type='n', axes=F, xlab="", ylab="");
  rasterImage(Image, 0, 0, max.x, max.y);
  
  x.n <- max.x/grid.s;
  y.n <- max.y/grid.s;
  n   <- 0;
  for (x in 1:x.n){
    x1 <- x*grid.s;
    segments(x1, 0, x1, max.y, col=col);
    if (xy.lab){
      if (n == 0){
        n <- 1;
        text(x1, max.y+grid.s, x1, cex=0.3);
        text(x1, -1, x1, cex=0.3);
      } else {
        n <- 0;
        text(x1, max.y+grid.s+grid.s, x1, cex=0.3);
        text(x1, -10, x1, cex=0.3);
      }
    }
  }
  
  for (y in 1:y.n){
    y1 <- y*grid.s;
    segments(0, y1, max.x, y1, col=cols[7]);
    if (xy.lab){
      if (n == 0){
        n <- 1;
        text(max.x+grid.s+grid.s, y1, y1, cex=0.3);
        text(-20, y1, y1, cex=0.3);
      } else {
        n <- 0;
        text(max.x+grid.s, y1, y1, cex=0.3);
        text(-10, y1, y1, cex=0.3);
      }
    }
  }
}

