# ggplot2 package

# all require ment fulfill 

# ggpie 

# r base 

# Introduction ggplot2 package 

## Univarate grapgh

### Categorical : Bargraph(plot), pie chart : Tree map : waffle chart 

### Quantitative: histogram : kernel density curve

## Bivariate

## Categorical vs. Categorical  : Barchart (stacked, grouped)
## Quantitative vs quantitative : Scatter plot, line plot
## Categorical vs. quantitative : Barchart , kernel density , box plots

## Multivariate 

### grouping
### facetting

## ggplot package

# 1. Data : you have to define the data where you are working.

# 2. Mapping : aes()

# 3. plot_type :eg_ geom_bar, geom_hist, geom_boxplot, geom_line

dat <- read.csv("E:/broadwaylearning/R-Training/tips.csv")

# install.packages("ggplot2")
# install.package("scales")
library(ggplot2)
library(scales)
# Create structure
ggplot(data = dat,
       mapping = aes(x = total_bill, y = tip))

# create a plot inside by geom function

ggplot(data = dat,
       mapping = aes(x = total_bill, y = tip)) +
  geom_point(color = 'red',
             size = 3,
             alpha = 0.5) # alpha(trasparancy)

## Grouping

ggplot(data = dat,
       mapping = aes(x = total_bill, y = tip)) +
  geom_point(color = 'red',
             size = 3,
             alpha = 0.5) +
  geom_smooth(method = "lm", color = 'blue', se = TRUE)


## Grouping

ggplot(data = dat,
       mapping = aes(x = total_bill, y = tip, color = sex)) +
  geom_point(size = 3,
             alpha = 0.5) +
  geom_smooth(method = "lm", color = 'blue', se = TRUE)

## Scaling :: Scales

ggplot(data = dat,
       mapping = aes(x = total_bill,
                     y = tip,
                     color = sex)) +
  geom_point(alpha = 0.5,
             size = 3) +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 2) +
  scale_x_continuous(breaks = seq(0,60,5),
                     label  = scales ::dollar)+
  scale_y_continuous(breaks = seq(0,10,2),
                     label = scales :: dollar) +
  scale_color_manual(values = c("red", "blue"))

## Facetting

ggplot(data = dat,
       mapping = aes(x = total_bill,
                     y = tip,
                     color = sex)) +
  geom_point(alpha = 0.5,
             size = 3) +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 2) +
  scale_x_continuous(breaks = seq(0,60,5),
                     label  = scales ::dollar)+
  scale_y_continuous(breaks = seq(0,10,2),
                     label = scales :: dollar) +
  scale_color_manual(values = c("red", "blue")) +
  facet_wrap(~day)


## Label

ggplot(data = dat,
       mapping = aes(x = total_bill,
                     y = tip,
                     color = sex)) +
  geom_point(alpha = 0.5,
             size = 3) +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 2) +
  scale_x_continuous(breaks = seq(0,60,5),
                     label  = scales ::dollar)+
  scale_y_continuous(breaks = seq(0,10,2),
                     label = scales :: dollar) +
  scale_color_manual(values = c("red", "blue")) +
  labs(x = "Total bill payment",
       y = "Amount of tips",
       title = "Relationship of expense within male and female",
       subtitle = "According to the everest resturant",
       caption = "Source : Kaggle.com",
       color = "Gender")

# Themes

ggplot(data = dat,
       mapping = aes(x = total_bill,
                     y = tip,
                     color = sex)) +
  geom_point(alpha = 0.5,
             size = 3) +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 2) +
  scale_x_continuous(breaks = seq(0,60,5),
                     label  = scales ::dollar)+
  scale_y_continuous(breaks = seq(0,10,2),
                     label = scales :: dollar) +
  scale_color_manual(values = c("red", "blue")) +
  labs(x = "Total bill payment",
       y = "Amount of tips",
       title = "Relationship of expense within male and female",
       subtitle = "According to the everest resturant",
       caption = "Source : Kaggle.com",
       color = "Gender") +
  theme_minimal()

## Graph  

print_plot <- ggplot(data = dat,
                     mapping = aes(x = total_bill,
                                   y = tip,
                                   color = sex)) +
  geom_point(alpha = 0.5,
             size = 3) +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 2) +
  scale_x_continuous(breaks = seq(0,60,5),
                     label  = scales ::dollar)+
  scale_y_continuous(breaks = seq(0,10,2),
                     label = scales :: dollar) +
  scale_color_manual(values = c("red", "blue")) +
  labs(x = "Total bill payment",
       y = "Amount of tips",
       title = "Relationship of expense within male and female",
       subtitle = "According to the everest resturant",
       caption = "Source : Kaggle.com",
       color = "Gender") +
  theme_minimal()


# Univiariate data visualization 
# Categorical
# Barplot 
# Pie chart

# Extra ( Tree map and Waffle chart)

# Barplot 
# install.packages("mosaicData")

library(mosaicData)

names(Marriage)

str(Marriage)

barplot(table(Marriage$race),
        xlab = "Race",
        ylab = "Number of marriage",
        main = "Barplot for race")

# Now onwards we will use ggplot2 package for visualization
library(ggplot2)
ggplot(data = Marriage,
       mapping = aes(x = race, y = after_stat(count)))+
  geom_bar(fill = "lightblue",
           color = "red") +
  labs(x = "Race",
       y = "Number of marriage",
       title = "Barplot Using Ggplot2",
       subtitle = "Using Marriage Data",
       caption = "from MosaicData Library")

ggplot(data = Marriage,
       mapping = aes(x = race, y = after_stat(count/sum(count))))+
  geom_bar(fill = "red",
           color ="black")+
  labs(x = "Race",
       y = "Number of marriage",
       title = "Barplot Using Ggplot2",
       subtitle = "Using Marriage Data",
       caption = "from MosaicData Library")+
  scale_y_continuous(labels = scales::percent)


library(dplyr)

dat_plot <- Marriage %>%
  count(race)
dat_plot

ggplot(data = dat_plot,
       mapping = aes(x = reorder(race,-n), y = n))+
  geom_bar(stat = "identity") +
  geom_text(aes(label = n),vjust = -0.35)+
  labs(x = "Race",
       y = "Number of marriage",
       title = "Barplot Using Ggplot2",
       subtitle = "Using Marriage Data",
       caption = "from MosaicData Library")


ggplot(Marriage,
       aes(x = officialTitle, y = after_stat(count))) +
  geom_bar() +
  coord_flip()

ggplot(Marriage,
       aes(x = race, y = after_stat(count))) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 45,
                                   hjust = 1))


# Univariate categorical

## Pie chart 

library(ggpie)
library(ggplot2)

ggpie(data = diamonds,
      group_key = "cut",
      count_type = "full",
      label_info = "all",
      label_type = 'horizon',
      label_size = 3,
      label_pos = "out")

if (!requireNamespace("treemapify", quietly = TRUE)) {
  install.packages("treemapify")
}
library(dplyr)
library(mosaicData)
library(treemapify)
library(ggplot2)

# create a treemap of marriage officials

plot_data <- Marriage %>%
  count(officialTitle)

ggplot(plot_data,
       aes(fill = officialTitle,
           area = n)) +
  geom_treemap() +
  labs(title = "Marriage by officiate")


# create a treemap with tile labels
ggplot(plot_data, 
       aes(fill = officialTitle, 
           area = n, 
           label = paste(officialTitle,n))) +
  geom_treemap() + 
  geom_treemap_text(colour = "white", 
                    place = "centre") +
  labs(title = "Marriages by officiate") +
  theme(legend.position = "none")

# create a basic waffle chart
if (!requireNamespace("waffle", quietly = TRUE)) {
  install.packages("waffle")
}
library(waffle)
ggplot(plot_data, aes(fill = officialTitle, values=n)) +
  geom_waffle(na.rm=TRUE)


## Quantitative/numerical variable

# Histogram 

ggplot(data = Marriage,
       mapping = aes(x = age,
                     y = after_stat(count/sum(count)))) +
  geom_histogram(fill = 'red',
                 color = 'black',
                 binwidth = 3)+
  scale_y_continuous(labels = scales::percent)

# Desnity 

ggplot(data = Marriage,
       mapping = aes(x = age)) +
  geom_density(fill = 'red',
               bw = 2)

# Dot chart

ggplot(data = Marriage,
       mapping = aes(x = age,
                     y = after_stat(count))) +
  geom_dotplot(fill = 'blue',
               color = 'red',
               alpha = 0.3) +
  scale_x_continuous(breaks = seq(15,80,5))+
  scale_y_continuous(breaks = seq(0,0.5,0.1))+
  theme_minimal()


## Bivariate 

# Categorical # Numerical

# Categorical vs categorical
# Quantitative vs quantitative
# Categorical vs quantitative

# Categorical vs categorical(Bar chart)

library(dplyr)
library(ggplot2)
library(carData)
library(mosaicData)

# Stack bar chart
ggplot(data = mpg,
       mapping = aes(x = class, fill = drv))+
  geom_bar(position = "stack")

# Group barchart
ggplot(data = mpg,
       mapping = aes(x = class, fill = drv))+
  geom_bar(position = "dodge")

# Improved Group barchart
ggplot(data = mpg,
       mapping = aes(x = class, fill = drv))+
  geom_bar(position = position_dodge(preserve = 'single'))

# Percentage stack bar
ggplot(data = mpg,
       mapping = aes(x = class, fill = drv))+
  geom_bar(position = "fill") +
  labs(y = "Proportion") +
  scale_y_continuous(breaks = seq(0,1,0.1),
                     label = scales ::percent)

# Quantitative vs quantitative 

## Scatter plot

library(ggplot2)
library(carData)

ggplot(data = Salaries,
       mapping = aes(x = yrs.since.phd, y = salary)) +
  geom_point()

# Grouping
## Coloring techniques
ggplot(data = Salaries,
       mapping = aes(x = yrs.since.phd, y = salary, color = rank))+
  geom_point()

## Smoothing
ggplot(data = Salaries,
       mapping = aes(x = yrs.since.phd, y = salary))+
  geom_point(color = 'red') +
  stat_smooth(method = "lm", formula = y~x, se = TRUE)


## ggplot(data = Salaries,
ggplot(data = Salaries,
       mapping = aes(x = yrs.since.phd, y = salary))+
  geom_point(color = 'red') +
  stat_smooth(method = "lm", formula = y~poly(x,3), se = TRUE)

###
ggplot(data = Salaries,
       mapping = aes(x = yrs.since.phd, y = salary))+
  geom_point(color = 'red') +
  stat_smooth(method = "lm", formula = y~poly(x,3), se = TRUE)

### 
ggplot(data = Salaries,
       mapping = aes(x = yrs.since.phd, y = salary))+
  geom_point(color = 'red') +
  stat_smooth(method = 'loess', formula = y~x)

### Facetting

ggplot(data = Salaries,
       mapping = aes(x = yrs.since.phd, y = salary))+
  geom_point(color = 'red') +
  stat_smooth(method = 'loess', formula = y~x, se = TRUE) +
  facet_wrap(~rank, scales = 'free')

### Line Plot 

library(gapminder)

plot_data <- gapminder %>%
  filter(country == "Afghanistan")

ggplot(data = plot_data,
       mapping = aes(x = year, y = lifeExp)) +
  geom_line(color = 'red',
            size = 1,
            alpha = 0.8) +
  geom_point(color = 'black',
             size = 3,
             alpha = 0.5)

### Categorical vs Quantitative

plot_data <- gapminder %>%
  group_by(continent) %>%
  summarise(mean_gdpPercap = mean(gdpPercap))

ggplot(data = plot_data,
       mapping = aes(x = continent,
                     y = mean_gdpPercap)) +
  geom_bar(stat = "identity")

## Better visualization
plot_data <- Salaries %>%
  group_by(rank) %>%
  summarise(mean_salary = mean(salary))

ggplot(data = plot_data,
       aes(x = factor(rank,
                      labels = c("Assistant\nProfessor",
                                 "Associate\nProfessor",
                                 "Full\nProfessor")),
           y = mean_salary)) +
  geom_bar(stat = 'identity',
           fill = 'red',
           color = 'black')+
  geom_text(aes(label = dollar(mean_salary)),
            vjust = -0.35) +
  scale_y_continuous(breaks = seq(0,130000,20000),
                     labels = scales::dollar)+
  labs(title = "Average Salary by Position",
       subtitle = "Texas University",
       caption = "Source:library(carData)",
       x = "",
       y = "")

ggplot(data = plot_data,
       aes(x = factor(rank,
                      labels = c("Assistant\nProfessor",
                                 "Associate\nProfessor",
                                 "Full\nProfessor")),
           y = mean_salary)) +
  geom_bar(stat = 'identity',
           fill = 'red',
           color = 'black')+
  geom_text(aes(label = dollar(mean_salary)),
            vjust = -0.35) +
  scale_y_continuous(breaks = seq(0,130000,20000),
                     labels = scales::dollar)+
  labs(caption = "Source:library(carData)",
       x = "Position",
       y = "Average Salary")

# Grouped kernel density 

ggplot(Salaries,
       aes(x = salary, fill = rank))+
  geom_density(alpha = 0.4)+
  labs(title = "Mean Salary by Rank", 
       subtitle = "9-month academic salary for 2008-2009",
       x = "Rank (Position)",
       y = "Salary Amount",
       fill = "Legend")

# plot the distribution of salaries by rank using boxplots
ggplot(data = Salaries, 
       mapping = aes(x = rank, y = salary)) +
  geom_boxplot(notch = TRUE,
               fill = 'blue',
               alpha = 0.5) +
  labs(title = "Mean Salary by Rank", 
       subtitle = "9-month academic salary for 2008-2009",
       x = "Rank (Position)",
       y = "Salary Amount in Dollar")


library(ggplot2)

ggplot(data = Salaries, 
       mapping = aes(x = rank, y = salary)) +
  geom_boxplot(notch = TRUE,
               fill = 'blue',
               alpha = 0.5) +
  stat_summary(fun.y = median, geom = "point", 
               shape = 23, size = 3, color = "red") +
  labs(title = "Mean Salary by Rank", 
       subtitle = "9-month academic salary for 2008-2009",
       x = "Rank (Position)",
       y = "Salary Amount in Dollar")


library(ggplot2)

ggplot(data = Salaries, 
       mapping = aes(x = rank, y = salary)) +
  geom_boxplot(notch = TRUE,
               fill = 'blue',
               alpha = 0.5) +
  stat_summary(fun.data = "median_hilow", 
               geom = "text", 
               vjust = -1, 
               size = 3, 
               color = "black",
               aes(label = round(..y.., 2)))+
  labs(title = "Mean Salary by Rank", 
       subtitle = "9-month academic salary for 2008-2009",
       x = "Rank (Position)",
       y = "Salary Amount in Dollar")

