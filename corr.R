dir <- "specdata/"
extension <- ".csv"

idtopath <- function(id) {
  padded <- sprintf("%03d", id)
  paste(dir, padded, extension, sep = "")
}

corr <- function(dir, threshold = 0) {
  id <- 1:332
  cors <- numeric()
  for (i in id) {
    data <- read.csv(idtopath(i))
    total_records <- dim(data)[1]
    keep <- !is.na(data["sulfate"]) & !is.na(data["nitrate"])
    nobs <- sum(keep)
    # ratio <- nobs / total_records
    if (nobs >= threshold) {
      data <- data[keep, ]
      cors <- c(cors, cor(x = data["sulfate"], y = data["nitrate"]))
    }
  }
  cors
}


cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
