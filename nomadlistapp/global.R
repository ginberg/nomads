library(shiny)
library(leaflet)
library(jsonlite)
library(httr)

cities <- fromJSON("https://nomadlist.com/api/v2/list/cities", flatten = TRUE)
nomadcitiesAll <- cities$result
df <- nomadcitiesAll[, c("info.city.name", "info.country.name","info.region.name", "info.city.url", "info.location.latitude", "info.location.longitude",
                         "scores.nomadScore", "scores.free_wifi_available", "scores.nightlife", "scores.places_to_work", "scores.safety",
                         "info.internet.speed.download", "info.weather.temperature.celsius", "people.checkins")]
df[is.na(df)] <- 0
colnames(df) <- c("city", "country","region", "url", "Lat", "Long", "score", "scorewifi", "scorenight", "scoreplaces2work", "scoresafety",
                  "dlspeed", "tempcls", "checkins")