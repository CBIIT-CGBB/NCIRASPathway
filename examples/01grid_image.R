rm(list=ls());

library(NCIRASPathway);

file.p  <- "ras-pathway-v2.png";
outf    <- "ras-pathway-v2.png.pdf";
cols    <- rainbow(10, alpha=0.2);

pdf(outf, 12.8, 7.2)
grid_image(image.file=file.p, grid.s=10, col=cols[7], xy.lab=T);
dev.off();
