cities <- read.csv("/home/ger/admin/freelance/nomads/data/cities.csv")
print(cities)
nomadcities <- read.csv("/home/ger/admin/freelance/nomads/data/nomadcities.csv")
print(nomadcities)

library(jsonlite)
library(httr)

cities <- fromJSON("https://nomadlist.com/api/v2/list/cities", flatten = TRUE)
#nomadcities <- cities[['result']][['info']]
nomadcitiesAll <- cities$result
nomadcities <- nomadcitiesAll[, c("info.city.name", "info.country.name","info.region.name", "info.city.url", "info.location.latitude", "info.location.longitude", 
                                  "scores.nomadScore", "scores.free_wifi_available", "scores.nightlife", "scores.places_to_work", "scores.safety",
                                  "info.internet.speed.download", "info.weather.temperature.celsius", "people.checkins")]
colnames(nomadcities) <- c("city", "country","region", "url", "lat", "lon", "score", "scorewifi", "scorenight", "scoreplaces2work", "scoresafety",
                           "dlspeed", "tempcls", "checkins")

write.table(nomadcities, 'data/nomadcities.csv', row.names=F, na="NA", append=F, quote= FALSE, sep=",", col.names=T)