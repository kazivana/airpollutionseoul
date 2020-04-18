
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

mean_summary_pol <- summary[, .(mean_sO2 = mean(SO2),
                                mean_no2 = mean(NO2),
                                mean_o3 = mean(O3),
                                mean_co = mean(CO)),
                            by = year(as.Date(summary$`Measurement date`, "%Y-%m-%d"))]

mean_summary_pol

mean_summary_pm <- summary[, .(mean_pm10 = mean(PM10),
                               mean_pm25 = mean(PM2.5)),
                           by = year(as.Date(summary$`Measurement date`, "%Y-%m-%d"))]

mean_summary_pm

saveRDS(mean_summary, './data/mean_summary.rds')
saveRDS(mean_summary_pol, './data/mean_summary_pol.rds')
saveRDS(mean_summary_pm, './data/mean_summary_pm.rds')
