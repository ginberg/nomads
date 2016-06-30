#
# This is the user-interface definition of the nomadlist app.
#

source("global.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "style.css",
  h3("Digital nomad cities in the world"),
  br(),
  h5("Digital nomads are people that use technology in order to work remotely and live an independent and nomadic lifestyle.
    Nomad List finds the best cities in the world for digital nomads. Based on their data, I have plotted the cities on a map.
    Clicking on a city shows the name of the city and some properties like safety, WiFi connection, weather,etc. The sliders can be used to filter on overall score."),
  fluidRow(
    column(2, offset = 1, sliderInput("range", "Overall score", min(df$score), max(df$score), value = range(df$score), step = 0.01)),
    column(2, offset = 1, sliderInput("range2", "Wifi score", min(df$scorewifi), max(df$scorewifi), value = range(df$scorewifi), step = 0.01)),
    column(2, offset = 1, sliderInput("range3", "Number of people", min(df$checkins), max(df$checkins), value = range(df$checkins), step = 1))
  ),
  leafletOutput("map", height = 800)
))
