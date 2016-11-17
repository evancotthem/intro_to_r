library(ggplot2)
library(dplyr)
library(data.table)

load("suicides.rdata")
all.suicides <- copy(suicides)

suicides <- suicides %>% 
  group_by(year, state, means) %>% 
  mutate(deaths = sum(deaths))

#the basics
bare <- ggplot(suicides)

#adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x = year, y = deaths))

#adding points
scatter <- ggplot(suicides, aes(x = year, y = deaths)) + 
              geom_point()

#split "means" by color
color_by_means <- ggplot(suicides, aes(x = year, y = deaths, color = means)) + 
                    geom_point()

#facet by state
state_facet <- ggplot(suicides, aes(x = year, y = deaths, color = means)) + 
                  geom_point() + 
                  facet_wrap(~state, scales = "free")

#line plot
line_by_state <- ggplot(suicides, aes(x = year, y = deaths, color = means)) + 
                  geom_line(size = 1) + 
                  facet_wrap(~state, scales = "free")

#bar plot
bar_by_idenity <- ggplot(suicides, aes(x = year, y = deaths)) + 
                  geom_bar(aes(fill = means), stat = "identity") + 
                  facet_wrap(~state, scales = "free")
