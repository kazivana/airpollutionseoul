
library(ggplot2)
library(gganimate)
library(data.table)

item_info <- readRDS('./data/item_info.rds')
summary <- readRDS('./data/summary.rds')
mean_summary <- readRDS('./data/mean_summary.rds')

head(item_info)
head(summary)

summary_short <- summary[, (3:5) := NULL]
summary_short[, year := year(as.Date(`Measurement date`, "%Y-%m-%d"))]
summary_short[, (1:2) := NULL]
summary_short

summary_tidy <- melt(summary_short, id.vars = 'year')
summary_tidy
summary_pm <- summary_short[5:7]
summary_pm_tidy <- melt(summary_pm, id.vars = 'year')
summary_pm_tidy

mean_summary_tidy <- melt(mean_summary, id.vars = 'year')
mean_summary_tidy

colset_4 <-  c("#D35C37", "#BF9A77", "#D6C6B9", "#97B8C2")

ggplot(mean_summary_tidy, aes(x = year, y = value, fill = year)) +
  geom_bar(stat='identity') +
  facet_wrap(~variable, scales = 'free') + 
  theme_bw()

