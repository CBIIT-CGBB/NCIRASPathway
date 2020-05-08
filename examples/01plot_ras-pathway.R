rm(list=ls());

library(NCIRASPathway);

col2 <- rainbow(10, alpha=0.8);
pdf("01plot_ras-pathway.pdf", 12.8, 7.2);
par(mar=c(2, 2, 2, 2));
plot_pathway(data=NULL, bg.neg=col2[9], bg.pos="blue");
dev.off();