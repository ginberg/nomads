#
# This is the user-interface definition of the nomadlist app.
#
source("global.R")

dbHeader <- dashboardHeader(title = "Filter cities")

shinyUI(dashboardPage(
  dbHeader,
  dashboardSidebar(
    sliderInput("range", "Overall score", min(df$score), max(df$score), value = range(df$score), step = 0.01),
    sliderInput("rangeW", "Wifi score", min(df$scorewifi), max(df$scorewifi), value = range(df$scorewifi), step = 0.01),
    sliderInput("rangeS", "Safety score", min(df$scoresafety), max(df$scoresafety), value = range(df$scoresafety), step = 0.01),
    sliderInput("rangeP", "Number of people", min(df$checkins), max(df$checkins), value = range(df$checkins), step = 1),
    sliderInput("rangeT", "Temperature (C)", min(df$tempcls), max(df$tempcls), value = range(df$tempcls), step = 1),
    sliderInput("rangeD", "Download speed (Mbps)", min(df$dlspeed), max(df$dlspeed), value = range(df$dlspeed), step = 1),
    checkboxGroupInput("regions","regions", regions, selected = regions)
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    h3("Digital nomad cities in the world"),
    br(),
    h5("Digital nomads are people that use technology in order to work remotely and live an independent and nomadic lifestyle.
      Nomad List finds the best cities in the world for digital nomads. Based on their data, I have plotted the cities on a map.
      Clicking on a city shows the name of the city and some properties like safety, WiFi connection, weather,etc. The items in the left menu can be used to filter cities."),
    leafletOutput("map", height = 800)
  )
))
