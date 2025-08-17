dir <- "specdata/"
extension <- ".csv"

idtopath <- function(id) {
  padded <- sprintf("%03d", id)
  paste(dir, padded, extension, sep = "")
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_data <- vector()
  for (i in id) {
    data <- read.csv(idtopath(i))
    data <- data[pollutant]
    data <- data[!is.na(data)]
    all_data <- c(all_data, data)
  }
  mean(all_data)
}

pollutantmean("specdata", "nitrate")
