# This package provides an interface for the Nomad List API. See https://nomadlist.com/faq#api
# Currently the next calls are supported
# * list/regions
# * list/regions/<region>
# * list/countries
# * list/countries/<country>
# * list/cities
# * list/cities/<city>

#Constants
SEP <- "/"
BASE_URL <- "https://nomadlist.com/api"
VERSION <- "v2"
LIST_REGIONS <- "list/regions"
LIST_COUNTRIES <- "list/countries"
LIST_CITIES <- "list/cities"

REGIONS_URL <- paste(BASE_URL, VERSION, LIST_REGIONS, sep=SEP)
COUNTRIES_URL <- paste(BASE_URL, VERSION, LIST_COUNTRIES, sep=SEP)
CITIES_URL <- paste(BASE_URL, VERSION, LIST_CITIES, sep=SEP)

#' Returns a dataframe based on the list regions request.
#'#'
#' @return a dataframe with all nomad regions
#'
#' @examples
#' getnomadregions()
#'
#' @export
getnomadregions <- function() {
  response <- jsonlite::fromJSON(REGIONS_URL, flatten = TRUE)
  return(handleResponse(response))
}

#' Returns a dataframe based on the list regions(region) request.
#'#'
#' @return a dataframe with all nomad regions
#' @param region the region specified
#'
#' @examples
#' getnomadregion("Europe")
#'
#' @export
getnomadregion <- function(region) {
  regionURL <- paste(REGIONS_URL, region, sep = SEP)
  response <- jsonlite::fromJSON(regionURL, flatten = TRUE)
  return(handleResponse(response))
}

#' Returns a dataframe based on the list countries request.
#'#'
#' @return a dataframe with all nomad countries
#'
#' @examples
#' getnomadcountries()
#'
#' @export
getnomadcountries <- function() {
  response <- jsonlite::fromJSON(COUNTRIES_URL, flatten = TRUE)
  return(handleResponse(response))
}

#' Returns a dataframe based on the list countries request.
#'#'
#' @return a dataframe with all nomad countries
#' @param country the country specified
#'
#' @examples
#' getnomadcountry("netherlands")
#'
#' @export
getnomadcountry <- function(country) {
  countryURL <- paste(COUNTRIES_URL, country, sep = SEP)
  response <- jsonlite::fromJSON(countryURL, flatten = TRUE)
  return(handleResponse(response))
}

#' Returns a dataframe based on the list cities request.
#'#'
#' @return a dataframe with all nomad cities.
#'
#' @examples
#' getnomadcities()
#'
#' @export
getnomadcities <- function() {
  response <- jsonlite::fromJSON(CITIES_URL, flatten = TRUE)
  return(handleResponse(response))
}

#' Returns a dataframe based on the list cities request.
#'#'
#' @return a dataframe with all nomad cities.
#' @param city the city specified
#'
#' @examples
#' getnomadcity("amsterdam-netherlands")
#'
#' @export
getnomadcity <- function(city) {
  cityURL <- paste(CITIES_URL, city, sep = SEP)
  response <- jsonlite::fromJSON(cityURL, flatten = TRUE)
  return(handleResponse(response))
}

#' Returns a resulting df if response is ok, otherwise NULL
#'
#' @return a dataframe with results
#' @param response the response
#'
handleResponse <- function(response){
  if(response$ok == TRUE){
    return(response$result)
  } else{return(NULL)}
}
