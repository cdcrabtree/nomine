#--- Get name leaf nationalities function ---#
#'@title Classifies names based on 39 leaf nationalities
#'@description Returns an object that classifies inputted names according to 39 different leaf nationalities.
#'@author Charles Crabtree \email{ccrabtr@umich.edu}
#'@param x A vector of names.
#'@return An object that classifies inputted names according inputted name belongs to 39 different leaf nationalities.
#'@examples
#' x <- c("Charles Crabtree", "Volha Chykina")
#' get_nationalities(x)
#'@importFrom utils setTxtProgressBar txtProgressBar
#'@export

get_nationalities <- function(x) {
  pb <- txtProgressBar(min = 0, max = length(x), style = 3)
  nationalities <- data.frame(matrix(NA, nrow = length(x), ncol = 42))
  colnames(nationalities) <- c("input", "encoded_name", "url",
                             "European-SouthSlavs", "Muslim-Pakistanis-Bangladesh",
                             "European-Italian-Italy", "European-Baltics",
                             "African-SouthAfrican", "European-Italian-Romania",
                             "Muslim-Nubian", "European-French",
                             "EastAsian-Indochina-Thailand", "EastAsian-Indochina-Vietnam",
                             "Jewish", "Muslim-Turkic-CentralAsian",
                             "EastAsian-Indochina-Cambodia", "Nordic-Scandavian-Denmark",
                             "EastAsian-Indochina-Myanmar", "Nordic-Finland",
                             "Muslim-Persian", "Nordic-Scandinavian-Sweden",
                             "Muslim-Maghreb", "Greek", "Muslim-Pakistanis-Pakistan",
                             "Hispanic-Portguguese", "European-Russian",
                             "Muslim-ArabianPeninsula", "African-WestAfrican",
                             "EastAsian-Japan", "European-German",
                             "EastAsian-Chinese", "SouthAsian", "Hispanic-Spanish",
                             "Nordic-Scandinavian-Norway", "Muslim-Turkic-Turkey",
                             "Hispanic-Philippines", "CelticEnglish",
                             "EastAsian-Malay-Malaysia", "EastAsian-South Korea",
                             "African-EastAfrican", "European-EastEuropean",
                             "EastAsian-Malay-Indonesia")
  for(i in 1:length(x)) {
    encoded_name <- RCurl::curlEscape(x[i])
    address <- paste0("http://www.name-prism.com/api/", encoded_name)
    r <- httr::GET(address)
    r <- strsplit(unlist(strsplit(httr::content(r, "text"), "\n")), ",")
    nationalities[i, ] <- c(x[i], encoded_name, address,
                          r[[1]][2], r[[2]][2], r[[3]][2],
                          r[[4]][2], r[[5]][2], r[[6]][2],
                          r[[7]][2], r[[8]][2], r[[9]][2],
                          r[[10]][2], r[[11]][2], r[[12]][2],
                          r[[13]][2], r[[14]][2], r[[15]][2],
                          r[[16]][2], r[[17]][2], r[[18]][2],
                          r[[19]][2], r[[20]][2], r[[21]][2],
                          r[[22]][2], r[[23]][2], r[[24]][2],
                          r[[25]][2], r[[26]][2], r[[27]][2],
                          r[[28]][2], r[[29]][2], r[[30]][2],
                          r[[31]][2], r[[32]][2], r[[33]][2],
                          r[[34]][2], r[[35]][2], r[[36]][2],
                          r[[37]][2], r[[38]][2], r[[39]][2])
    setTxtProgressBar(pb, i)
  }
}
