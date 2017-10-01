#--- Get name ethnicities function ---#
#'@title Classifies names based on 6 U.S. ethnicities
#'@description Returns an object that classifies any inputted name(s) according to 6 different U.S. ethnicities.
#'@author Charles Crabtree \email{ccrabtr@umich.edu}
#'@param x A vector of names.
#'@return An object that contains that classifies any inputted names(s) accoridng to 6 different U.S. ethnicities.
#'@examples
#' x <- c("Charles Crabtree", "Volha Chykina")
#' get_ethnicities(x)
#'@export

get_ethnicities <- function(x) {
  pb <- txtProgressBar(min = 0, max = length(x), style = 3)
  ethnicities <- data.frame(matrix(NA, nrow = length(x), ncol = 9))
  colnames(ethnicities) <- c("input", "encoded_name", "url",
                             "2PRACE", "Hispanic", "API",
                             "Black", "AIAN", "White")
    for(i in 1:length(x)) {
      encoded_name <- RCurl::curlEscape(x[i])
      address <- paste0("http://www.name-prism.com/api_eth/", encoded_name)
      r <- httr::GET(address)
      r <- strsplit(unlist(strsplit(httr::content(r, "text"), "\n")), ",")
      ethnicities[i, ] <- c(x[i], encoded_name, address,
                            r[[1]][2], r[[2]][2], r[[3]][2],
                            r[[4]][2], r[[5]][2], r[[6]][2])
      setTxtProgressBar(pb, i)
    }
}
