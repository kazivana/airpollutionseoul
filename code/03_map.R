station_info <- readRDS('./data/station_info.rds')
station_info

library(mapview)
library(sf)

station_coords <- st_as_sf(station_info,
                           coords = c('Latitude', 'Longitude'))
                           
mapview(station_coords, map.types = 'Stamen.TerrainBackground')

