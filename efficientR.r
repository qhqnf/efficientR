library("microbenchmark")
df = data.frame(v = 1:4, name = letters[1:4])
microbenchmark(df[3, 2], df[3, "name"], df$name[3])

x = 1:100 # initiate vector to cumulatively sum

# Method 1: with a for loop (10 lines)
cs_for = function(x){
  for(i in x){
    if(i == 1){
      xc = x[i]
    } else {
      xc = c(xc, sum(x[1:i]))
    }
  }
  xc
}

# Method 2: with apply (3 lines)
cs_apply = function(x){
  sapply(x, function(x) sum(1:x))
}

# Method 3: cumsum (1 line, not shown)
microbenchmark(cs_for(x), cs_apply(x), cumsum(x))

# Test how long it takes to subset the data frame 50,000 times:
system.time(
  for(i in 1:50000){
    df[3, 2]
  }
)

profvis(expr = {
  library(ggplot2)
  library(plyr)
  library(dplyr)
  library(data.table)
  
  setwd("C:/Users/LG/Desktop/eda/data")
  
  subloc <- read.csv('subway_latlong2.csv')
  sub <- read.csv('subway.csv', stringsAsFactors = FALSE)
  dust <- read.csv('chungmuro.csv', stringsAsFactors = FALSE)
  
  #subway data cleansing and merging
  index <- grep(")", sub$stat_name)
  for (i in index){
    sub$stat_name[i] = substr(sub$stat_name[i], 1, nchar(sub$stat_name[i])-3)
  }
  
  total <- sub[,c(2,3,4)]
})

devtools::install_github("csgillespie/efficient", build_vignettes = TRUE)
browseVignettes(package="efficient")

Sys.info()
#see your OS and its version etc.

# Note: uses 2+ GB RAM and several seconds or more depending on hardware
# 1: Create large dataset
X = as.data.frame(matrix(rnorm(1e8), nrow = 1e7))
# 2: Find the median of each column using a single core
r1 = lapply(X, median)
# 3: Find the median of each column using many cores
r2 = parallel::mclapply(X, median)
#mclapply only work in parallel on Mac or Linux. we must use parLapply() on Windows.

install.packages('installr')
installr::updateR()
#if R return FALSE, your Rversion is uptodate.

pkgs = c('raster', 'leaflet', 'rgeos')
install.packages(pkgs)
inst = lapply(pkgs, library, characher.only = TRUE)
#to shorten code, install packages in only two line of code and use lapply
#to make library(pkgs[i]).
#we use library instead of require because the former returns error when pkg is not installed.

update.packages()
#default of ask parameter is TRUE, change it to FASLE if you want.
#if you want this code run automatically when starting R
#you can add update.packages(ask = FALSE) in .Rprofile startup file

Sys.getenv('home')

#autocompletion