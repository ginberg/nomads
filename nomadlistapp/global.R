library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)
library(httr)
#library(nomadlist)

minLon <- 0
maxLon <- 0
minLat <- 0
maxLat <- 0

#df <- getnomadcities()
#if (!is.null(df)) {
cities <- fromJSON("https://nomadlist.com/api/v2/list/cities", flatten = TRUE)
df <- cities$result
df <- df[, c("info.city.name", "info.country.name","info.region.name", "info.city.url", "info.location.latitude", "info.location.longitude",
                         "scores.nomadScore", "scores.free_wifi_available", "scores.nightlife", "scores.places_to_work", "scores.safety",
                         "info.internet.speed.download", "info.weather.temperature.celsius", "people.checkins")]
# NA -> 0
df[is.na(df)] <- 0
colnames(df) <- c("city", "country","region", "url", "Lat", "Long", "score", "scorewifi", "scorenight", "scoreplaces2work", "scoresafety",
                  "dlspeed", "tempcls", "checkins")
regions <- unique(df$region)
minLon <- min(df$Long)
maxLon <- max(df$Long)
minLat <- min(df$Lat)
maxLat <- max(df$Lat)
#}
