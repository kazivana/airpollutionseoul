
library(data.table)

summary <- readRDS('./data/summary.rds')
head(summary)

mean_summary <- summary[, .(mean_s02 = mean(SO2),
                            mean_no2 = mean(NO2),
                            mean_o3 = mean(O3),
                            mean_co = mean(CO),
                            mean_pm10 = mean(PM10),
                            mean_pm25 = mean(PM2.5)),
                        by = year(as.Date(summary$`Measurement date`, "%Y-%m-%d"))]
mean_summary

