library(data.table)

info <- fread('./data/raw/Measurement_info.csv')
info
str(info)
info$`Instrument status`
info$`Station code`

item_info <- fread('./data/raw/Measurement_item_info.csv')
item_info$`Item name`
item_info$`Good(Blue)`
item_info

station_info <- fread('./data/raw/Measurement_station_info.csv')
station_info

summary <- fread('./data/raw/Measurement_summary.csv')
summary


saveRDS(info, './data/info.rds')
saveRDS(item_info, './data/item_info.rds')
saveRDS(station_info, './data/station_info.rds')
saveRDS(summary, './data/summary.rds')
