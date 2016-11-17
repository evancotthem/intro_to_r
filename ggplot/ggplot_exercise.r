library(ggplot2)
library(data.table)
library(reshape2)
library(dplyr)


load("suicides.rdata")

suicides$age <- as.factor(suicides$age)

all_suicides <- copy(suicides)
suicides <- suicides %>% 
  group_by(year, age, sex) %>% 
  mutate(deaths = sum(deaths))

#  Make a line plot of suicides by age
# (year on the x axis, deaths on the y axis, different line for each age).
# facet by sex.

line_plot <- ggplot(suicides, aes(x = year, y = deaths, color = age)) +
                geom_line(size = 1.5) +
                facet_wrap(~sex, scales = "free")

##extra credit####

one_state <- all_suicides[all_suicides$state=="Uttar Pradesh"] %>% 
  group_by(year, state, sex, age, means) %>% 
  mutate(deaths = sum(deaths))

# Make a set of density plots faceted by sex and means of suicide,
# showing distributions of suicides by age, for the state of Uttar Pradesh.
# Label appropriately.

density_plot <- ggplot(one_state, aes(x = age, color = age)) +
                  geom_density() +
                  facet_wrap(~sex + means)


