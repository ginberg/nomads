\name{nomadlist}
\alias{nomadlist}
\title{Interface to the Nomad List API}
\usage{
getnomadcities()
}
\description{
Retrieves all nomad cities avaiable.
}
\examples{
nomadCities <- getnomadcities()
if (nomadCities$ok == TRUE) {
  nomadCities <- nomadCities$result
  citiesCountries <- nomadCities[, c("info.city.name", "info.country.name")]
  citiesCountries
}
}
