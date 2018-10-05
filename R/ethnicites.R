#--- Get name ethnicities function ---#
#'@title Classifies names based on 6 U.S. ethnicities
#'@description Returns an object that classifies any inputted name(s) according to 6 different U.S. ethnicities.
#'@author Charles Crabtree \email{ccrabtr@umich.edu} and Christian Chacua \email{christian-mauricio.chacua-delgado@u-bordeaux.fr}
#'@param x A vector of names,  in the form "First_name Last_name". If there are multiple segments separated by white spaces, only the first and the last segments are taken into account.
#'@param t A string with the API access token. The default value is NULL, although you must set your own token. A Name-Prism API token can be obtained for research purposes to overcome the limit of anonymous API use. Please visit \url{http://www.name-prism.com/api} for more details.
#'@return A data frame of dimensions length(x)*9, with the probability of belonging to each of the 6 different U.S. ethnicities. Errors (e.g. connection is interrupted, invalid tokens) are handled as NA.
#'@examples
#' # Vector of names.
#' x <- c("Charles Crabtree", "Volha Chykina", "Christian Chacua", "Christian Mauricio Chacua")
#' # Using the API token a1a2a34aa56789aa (you should get your own token)
#' y <- get_ethnicities(x, t="a1a2a34aa56789aa")
#' y
#' "Christian Chacua" and "Christian Mauricio Chacua" have the same probabilities as "Mauricio" is not taken into account.
#'@importFrom utils setTxtProgressBar txtProgressBar
#'@export

get_ethnicities <- function(x, t=NULL) {
  if(is.null(t)){
  print("Please set a valid API token")
  }else{
  t<-as.character(t)
  }
  pb <- txtProgressBar(min = 0, max = length(x), style = 3)
  ethnicities <- data.frame(matrix(NA, nrow = length(x), ncol = 9))
  colnames(ethnicities) <- c("input", "encoded_name", "url",
                             "2PRACE", "Hispanic", "API",
                             "Black", "AIAN", "White")
  for(i in 1:length(x)) {
    encoded_name <- RCurl::curlEscape(x[i])
    address <- paste0("http://www.name-prism.com/api_token/eth/json/",t,"/", encoded_name)
    r <- tryCatch(as.data.frame(jsonlite::fromJSON(address)),
                  error=function(e){
                    data.frame(matrix(NA, nrow = 1, ncol = 6))
                  })
    ethnicities[i, ] <- c(x[i], encoded_name, address, r[1,])
    setTxtProgressBar(pb, i)
  }
  return(ethnicities)
}
