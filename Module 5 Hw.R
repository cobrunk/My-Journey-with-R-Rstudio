rm(list=ls())
install.packages('tidyverse')
library(tidyverse)
library(gtrendsR)

#5.1
walmart=gtrends("Walmart")
schnucks=gtrends("Schnucks")

data=data.frame(Company = c(rep('walmart', nrow(walmart$interest_over_time)), rep('schnucks', nrow(schnucks$interest_over_time))),
                Interest = c(walmart$interest_over_time$hits, schnucks$interest_over_time$hits))
#box plot
box_trends <- ggplot(data, aes(x = Company, y = Interest)) +
  geom_boxplot() +
  labs(title = "Google Trends Comparison - Walmart vs. Schnucks (Boxplot)",
       y = "Interest Over Time") +
  theme_minimal()
print(box_trends)

#line plot
line_trends <- ggplot(data, aes(x = Company, y = Interest)) +
  geom_line() +
  labs(title = "Google Trends Comparison - Walmart vs. Schnucks (Line)",
       y = "Interest Over Time") +
  theme_minimal()
print(line_trends)

#histogram
histogram_walmart <- ggplot(data[data$Company == "walmart", ], aes(x = Interest)) + geom_histogram()
print(histogram_walmart)

histogram_schnucks = ggplot(data[data$Company == "schnucks", ], aes(x = Interest)) + geom_histogram()
print(histogram_schnucks)

#density plot (violin)
dense_walmart = ggplot(data[data$Company == "walmart", ], aes(x = Company, y=Interest)) + geom_violin()
print(dense_walmart)

dense_schnucks = ggplot(data[data$Company == "schnucks", ], aes(x = Company, y=Interest)) + geom_violin()
print(dense_schnucks)


#5.2
covid_data=read.csv(file.choose())

#filtering and grouping data to find case/death sum
MO_FL_TX_data= filter(covid_data, state=="Missouri" | state=="Florida" | state=="Texas")
head(MO_FL_TX_data)
by_selected_states= data.frame(
  MO_FL_TX_data %>% group_by(state) %>%
    summarise(total_deaths=sum(deaths),
              total_cases=sum(cases)))
head(by_selected_states)
by_selected_states


#box Plots
case_box = ggplot(MO_FL_TX_data, aes(x = state, y = cases)) +
geom_boxplot() +
  labs(title = "COVID-19 Cases Comparison for Three States (Boxplot)",
       y = "Cases") +
  theme_minimal()
print(case_box)

deaths_box = ggplot(MO_FL_TX_data, aes(x = state, y = deaths)) +
  geom_boxplot() +
  labs(title = "COVID-19 Deaths Comparison for Three States (Boxplot)",
       y = "Deaths") +
  theme_minimal()
print(deaths_box)

#line for each on cases and deaths over time
line_plot <- ggplot(MO_FL_TX_data, aes(x = as.Date(date), y = cases, color = state)) +
  geom_line() +
  geom_line(aes(y = deaths), color = "lavender") +
  labs(title = "COVID-19 Cases and Deaths Over Time for Each State (Line Plot)",
       x = "Date",
       y = "Counts") +
  theme_minimal()
print(line_plot)

#histogram
#Missouri
MO_histogram_cases <- ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Missouri", ], aes(x = cases, colour = state)) + geom_histogram()
print(MO_histogram_cases)

MO_histogram_deaths <- ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Missouri", ], aes(x = deaths, colour = state)) + geom_histogram()
print(MO_histogram_deaths)

#Florida
FL_histogram_cases <- ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Florida", ], aes(x = cases, colour = state)) + geom_histogram()
print(FL_histogram_cases)

FL_histogram_deaths <- ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Florida", ], aes(x = deaths, colour = state)) + geom_histogram()
print(FL_histogram_deaths)

#Texas
TX_histogram_cases <- ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Texas", ], aes(x = cases, colour = state)) + geom_histogram()
print(TX_histogram_cases)

TX_histogram_deaths <- ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Texas", ], aes(x = deaths, colour = state)) + geom_histogram()
print(TX_histogram_deaths)

#violin(density)
#Missouri
MO_dense_cases = ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Missouri", ], aes(x = state, y=cases)) + geom_violin()
print(MO_dense_cases)

MO_dense_deaths = ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Missouri", ], aes(x = state, y=deaths)) + geom_violin()
print(MO_dense_deaths)

#Florida
FL_dense_cases = ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Florida", ], aes(x = state, y=cases)) + geom_violin()
print(FL_dense_cases)

FL_dense_deaths = ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Florida", ], aes(x = state, y=deaths)) + geom_violin()
print(FL_dense_deaths)

#Texas
TX_dense_cases = ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Texas", ], aes(x = state, y=cases)) + geom_violin()
print(TX_dense_cases)

TX_dense_deaths = ggplot(MO_FL_TX_data[MO_FL_TX_data$state == "Texas", ], aes(x = state, y=deaths)) + geom_violin()
print(TX_dense_deaths)

