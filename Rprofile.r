#file.exists('.Rprofile')
#file.edit('.Rprofile')

# A fun welcome message
message("Hi Hyun Chul Yang, Welcome")

if(interactive()) 
  try(fortunes::fortune(), silent = TRUE)

# `local` creates a new, empty environment
# This avoids polluting .GlobalEnv with the object r
local({
  r = getOption("repos")             
  r["CRAN"] = "https://cran.rstudio.com/"
  options(repos = r)
})


nice_par = function(mar = c(3, 3, 2, 1), mgp = c(2, 0.4, 0), tck = -0.01, 
                    cex.axis = 0.9, las = 1, mfrow = c(1, 1), ...) {
  par(mar = mar, mgp = mgp, tck = tck, cex.axis = cex.axis, las = las, 
      mfrow = mfrow, ...)
}

.env = new.env()
.env$ht = function(d, n = 5) rbind(head(d, n), tail(d, n))
attach(.env)

.Last = function() {
  cond = suppressWarnings(!require(fortunes, quietly = TRUE))
  if(cond) 
    try(install.packages("fortunes"), silent = TRUE)
  message("Goodbye at ", date(), "\n")
}
