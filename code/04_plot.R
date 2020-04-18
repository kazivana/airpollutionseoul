
library(ggplot2)
library(gganimate)
library(data.table)

mean_summary_pm <- readRDS('./data/mean_summary_pm.rds')
mean_summary_pol <- readRDS('./data/mean_summary_pol.rds')
mean_summary_pm
mean_summary_pol



mean_summary_pm_tidy <- melt(mean_summary_pm, id.vars = 'year')
mean_summary_pm_tidy

mean_summary_pol_tidy <- melt(mean_summary_pol, id.vars = 'year')
mean_summary_pol_tidy

ggplot(mean_summary_pm_tidy, aes(x = variable, y = value, fill = variable)) +
  geom_bar(stat='identity') +
  theme_bw() +
  transition_states(
    year,
    transition_length = 2,
    state_length = 1
  ) +
  ease_aes('sine-in-out')

ggplot(mean_summary_pol_tidy, aes(x = variable, y = value, fill = variable)) +
  geom_bar(stat='identity') +
  theme_bw() +
  transition_states(
    year,
    transition_length = 2,
    state_length = 1
  ) +
  ease_aes('sine-in-out')

