\name{nomadlist}
\alias{nomadlist}
\title{Interface to the Nomad List API}
\usage{
getnomadcities()
}
\description{
Retrieves all nomad regions, countries and cities avaiable. Specific information about a region, country or city can be retrieved by calling the corresponding function.
}
\examples{
#get top 10 cities by score
df <- getnomadcities()
if (!is.null(df)) {
  df <- df[, c("info.city.name", "info.country.name", "scores.nomadScore")]
  head(df[order(-df$scores.nomadScore),], 10)
}
}
