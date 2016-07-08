# This is the server logic of the nomadlist app.
# Main structure:
# * Data is obtained in global.R
# * Data points are plotted on a leaflet based on Lat, Long coordinates in the dataframe.
# * With reactive inputs, the dataframe can be filtered and the map is updated accordingly.

source("global.R")

# Define server logic
shinyServer(function(input, output, session) {

  filteredData <- reactive({
    df[df$score >= input$range[1] & df$score <= input$range[2] &
       df$scorewifi >= input$rangeW[1] & df$scorewifi <= input$rangeW[2] &
       df$scoresafety >= input$rangeS[1] & df$scoresafety <= input$rangeS[2]  &
       df$checkins >= input$rangeP[1] & df$checkins <= input$rangeP[2] &
       df$tempcls >= input$rangeT[1] & df$tempcls <= input$rangeT[2] &
       df$dlspeed >= input$rangeD[1] & df$dlspeed <= input$rangeD[2] &
       df$scorenight >= input$rangeN[1] & df$scorenight <= input$rangeN[2] &
       df$region  %in% input$regions, ]
  })

  output$map <- renderLeaflet({
    initial_lat = 35.912222
    initial_lng = 14.504167
    initial_zoom = 2

    leaflet(filteredData()) %>%
      addProviderTiles("Stamen.TonerLite", options = providerTileOptions(noWrap = TRUE)) %>%
      addCircleMarkers(radius = 3, color = "#FF4742") %>%
      fitBounds(minLon, minLat, maxLon, maxLat) %>%
      setView(lat = initial_lat, lng = initial_lng, zoom = initial_zoom)
  })

  # Show a popup at the given location
  showCityPopup <- function(id, lat, lng) {
    city <- df[df$Lat == lat & df$Long == lng,]
    content <- paste(
      "City:", city$city,"(", city$country, ")", "<br>",
      "Overall score:", city$score, "<br>",
      "Wifi score:", city$scorewifi, "<br>",
      "Safety score:", city$scoresafety, "<br>",
      "Nightlife score:", city$scorenight, "<br>",
      "Temperature (C):", city$tempcls, "<br>",
      "Download (Mbps):", city$dlspeed, "<br>",
      "Number of people:", city$checkins, "<br>",
      paste0("<a href='https://nomadlist.com", city$url, "' target='_blank'>", "Link to nomadlist", "</a>"))
    leafletProxy("map") %>% addPopups(lng, lat, content, layerId = id)
  }

  # When map is clicked, show a popup with city info
  observe({
    leafletProxy("map") %>% clearPopups()
    event <- input$map_marker_click
    if (is.null(event))
      return()

    isolate({
      showCityPopup(event$id, event$lat, event$lng)
    })
  })

})
