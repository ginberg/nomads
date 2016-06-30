# This package provides an interface for the Nomad List API. See https://nomadlist.com/faq#api
# Currently the next calls are supported
# * list/cities

BASE_URL <- "https://nomadlist.com/api"
VERSION <- "v2"
LIST_CITIES <- "list/cities"
CITIES_URL <- paste(BASE_URL, VERSION, LIST_CITIES, sep="/")

#' Returns a dataframe based on the list cities request.
#'#'
#' @return a dataframe with all nomad cities.
#'
#' @examples
#' getnomadcities()
#'
#' @export
getnomadcities <- function() {
  #message("getNomadCities start")
  cities <- jsonlite::fromJSON(CITIES_URL, flatten = TRUE)
  #message("getNomadCities end")
  return(cities)
}
