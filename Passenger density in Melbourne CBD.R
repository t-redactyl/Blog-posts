train <- read.csv(url("https://data.melbourne.vic.gov.au/api/views/b2ak-trbp/rows.csv"))
head(train)
table(train$Sensor_Name)
summary(train$Hourly_Counts[train$Sensor_Name == "Bourke Street Mall (North)"])
train$Date_Time[train$Hourly_Counts == 5573]

# Converting date variable into actual date/time format
train$date <- as.POSIXct(as.character(train$Date_Time), format = "%d-%B-%Y %H:%M")

require(ggplot2); require(knitr); require(magrittr)
opts_chunk$set(fig.path='/figure/',echo=FALSE, warning=FALSE, message=FALSE)

qplot(days, page.views, data = views, geom = "line") %>%
    add(geom_line(colour = "#4271AE")) %>%
    add(ggtitle('Website Page Views in 2014')) %>%
    add(xlab('')) %>%
    add(ylab('Daily page views')) %>%
    add(geom_hline(yintercept=220, linetype="dashed")) %>%
    add(theme_bw())