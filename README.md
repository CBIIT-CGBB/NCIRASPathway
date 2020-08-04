# NCIRASPathway: an R package that converts image pathway to degital pathway 
#### intall the package
```r
library(devtools)
install_github("CBIIT-CGBB/NCIRASPathway")
``` 
 
# Introduction
#### raw pathway image -> coordinators of image -> generation of digital tables -> digital pathway plot 
<img src="examples/01_1ras-pathway-v2.png" width="200" height="100"> <img src="examples/00.png" width="40" height="40"> 
<img src="examples/01_2ras-pathway-v2.png" width="200" height="100"> <img src="examples/00.png" width="40" height="40">
<img src="examples/01_3ras-pathway-v2.png" width="80" height="100"> <img src="examples/00.png" width="40" height="40"> 
<img src="examples/01_4ras-pathway-v2.png" width="200" height="100">

[R codes for grid](examples/01grid_image.R)  
[R codes for digital pathway plot](examples/01plot_ras-pathway.R)

# Examples
#### Map gene information on the pathway
<img src="examples/02_1ras-pathway-v2.png" width="500" height="280">
 
[R codes](examples/02_1NCIRASPathway.R) 

#### Map gene mutations on the pathway
<img src="examples/02_2ras-pathway-v2.png" width="500" height="280">
 
[R codes](examples/02_2NCIRASPathway.R)

#### Map gene associations on the pathway
<img src="examples/02_3ras-pathway-v2.png" width="500" height="280">
 
[R codes](examples/02_3NCIRASPathway.R)

#### Map gene associations and mutations on the pathway
<img src="examples/02_4ras-pathway-v2.png" width="500" height="280">
 
[R codes](examples/02_4ras-pathway-v2.R)

#### The networks by some genes in the pathway
<img src="examples/02_5ras-pathway-v2.png" width="330" height="280">
 
[R codes](examples/02_5ras-pathway-v2.R)
