# Lecture 20: Spatial Data in R
# Answers
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Exercise 1: Basic leaflet map
# Create a basic leaflet map with default tiles and set the view to a location of your choice
# Remember to use lat/long coordinates
# Suggestion: get the lat/long pair of the city where you were born

leaflet() %>%
  addTiles() %>%
  setView(lng = -74.0060, lat = 40.7128, zoom = 10)  # New York City coordinates

## Exercise 2: Add a marker to your map
# To the map created in Exercise 1, add a marker at the same location you chose.
# Include a popup with the name of the location.

leaflet() %>%
  addTiles() %>%
  setView(lng = -74.0060, lat = 40.7128, zoom = 10) %>%
  addMarkers(lng = -74.0060, lat = 40.7128, popup = "New York City")

## Exercise 3: Use a different tile layer
# Modify the map from Exercise 1 by using a different tile layer.
# Choose one from the set of available tiles in the leaflet package (e.g., Stamen Watercolor).

leaflet() %>%
  addProviderTiles(providers$Stamen.Watercolor) %>%
  setView(lng = -74.0060, lat = 40.7128, zoom = 10)

## Exercise 4: Add circle markers for multiple locations
# Create a map that includes circle markers for at least three different locations of your choice.
# Customize the color and radius of the circles. Include popups with information about each location.

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = -74.0060, lat = 40.7128, radius = 20, color = "red", popup = "New York City") %>%
  addCircleMarkers(lng = -0.1276, lat = 51.5074, radius = 20, color = "blue", popup = "London") %>%
  addCircleMarkers(lng = 139.6503, lat = 35.6762, radius = 20, color = "green", popup = "Tokyo")
