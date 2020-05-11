station_info <- readRDS('./data/station_info.rds')
station_info_coords <- station_info[4:5]
station_info_coords


library(mapview)
library(sf)
library(leaflet)

station_coords <- st_as_sf(station_info_coords,
                           coords = c('Latitude', 'Longitude'),
                           crs = 5181)
                           
mapview(station_coords, map.types = 'OpenTopoMap')

sessionInfo()

themap <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=station_info_coords$Longitude, lat = station_info_coords$Latitude)
themap
