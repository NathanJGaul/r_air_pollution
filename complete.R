dir <- "specdata/"
extension <- ".csv"

idtopath <- function(id) {
  padded <- sprintf("%03d", id)
  paste(dir, padded, extension, sep = "")
}

complete <- function(directory, id = 1:332) {
  df <- data.frame(
    id = numeric(),
    nobs = numeric()
  )
  for (i in id) {
    data <- read.csv(idtopath(i))
    nobs <- sum(!is.na(data["sulfate"]) & !is.na(data["nitrate"]))
    df <- rbind(df, data.frame(id = i, nobs = nobs))
  }
  df
}

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
