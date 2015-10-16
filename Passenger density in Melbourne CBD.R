# Importing data
pedestrians <- read.csv(url("https://data.melbourne.vic.gov.au/api/views/b2ak-trbp/rows.csv"))

# Map of locations: http://www.pedestrian.melbourne.vic.gov.au/#date=15-10-2015&time=17&sensor=Vic_T


# Screening data
head(pedestrians)
table(pedestrians$Sensor_Name)
summary(pedestrians$Hourly_Counts[pedestrians$Sensor_Name == "Bourke Street Mall (North)"])
pedestrians$Date_Time[pedestrians$Hourly_Counts == 5573]

# Converting date variable into actual date/time format
pedestrians$date <- as.POSIXct(as.character(pedestrians$Date_Time), format = "%d-%b-%Y %H:%M")
tapply(pedestrians$Hourly_Counts, pedestrians$Sensor_Name, function(x) sum(is.na(x)))

# Keep subset after 1st October 2013 (2 years of data)
p.subset <- subset(pedestrians, date >= "2013-10-01 00:00:00")

# Get rid of public holidays
    # Melbourne Cup Day	Tuesday 05 November 2013 x
    # Christmas Day	Wednesday 25 December 2013 x
    # Boxing Day	Thursday 26 December 2013 x
    # New Year's Day	Wed 1 Jan 2014 x
    # Australia Day	Mon 27 Jan 2014 x
    # Labour Day	Mon 10 Mar 2014 x
    # Good Friday	Fri 18 Apr 2014 x
    # Saturday before Easter Sunday	Sat 19 Apr 2014 x
    # Easter Sunday Sun 20 Apr 2014 x
    # Easter Monday	Mon 21 Apr 2014 x
    # ANZAC Day	Fri 25 Apr 2014 x
    # Queen's Birthday	Mon 9 Jun 2014 x
    # Melbourne Cup Tue 4 Nov 2014 x
    # Christmas Day	Thu 25 Dec 2014 x
    # Boxing Day	Fri 26 Dec 2014 x
    # New Year's Day	Thu 1 Jan 2015 x
    # Australia Day	Mon 26 Jan 2015 x
    # Labour Day	Mon 9 Mar 2015 x
    # Good Friday*	Fri 3 Apr 2015 x
    # Saturday before Easter Sunday	Sat 4 Apr 2015 x
    # Easter Sunday	Sun 5 Apr 2015 x
    # Easter Monday	Mon 6 Apr 2015 x
    # ANZAC Day*	Sat 25 Apr 2015 x
    # Queen's Birthday	Mon 8 Jun 2015
    # Friday before the AFL Grand Final	Fri 2 Oct 2015

# Also these events:
# White Night Melbourne 10.00pm, Saturday 21 February 2015
    # Saturday 22 February 2014
    # Saturday 23 February 2013
# Moomba Parade 11.00am, Monday 9 March 2015
    # Monday 10 March 2014
    # Monday 11 March 2013
# New Year's Eve 10.00pm, Wednesday 31 December 2014, 31st Dec 2013
# AFL Grand Final Parade 12.00pm, Friday 26 September 2014, 2nd October 2015, 27th September 2013

p.subset <- with(p.subset, p.subset[!(date >= "2013-11-05 00:00:00" & date <= "2013-11-05 23:00:00") & 
                                    !(date >= "2013-12-25 00:00:00" & date <= "2013-12-26 23:00:00") &
                                    !(date >= "2013-12-31 00:00:00" & date <= "2014-01-01 23:00:00") &
                                    !(date >= "2014-01-27 00:00:00" & date <= "2014-01-27 23:00:00") &
                                    !(date >= "2014-02-22 00:00:00" & date <= "2014-02-23 23:00:00") &
                                    !(date >= "2014-03-10 00:00:00" & date <= "2014-03-10 23:00:00") &
                                    !(date >= "2014-04-18 00:00:00" & date <= "2014-04-21 23:00:00") &
                                    !(date >= "2014-04-25 00:00:00" & date <= "2014-04-25 23:00:00") &
                                    !(date >= "2014-06-09 00:00:00" & date <= "2014-06-09 23:00:00") &
                                    !(date >= "2014-09-26 00:00:00" & date <= "2014-09-26 23:00:00") &
                                    !(date >= "2014-11-04 00:00:00" & date <= "2014-11-04 23:00:00") &
                                    !(date >= "2014-12-25 00:00:00" & date <= "2014-12-26 23:00:00") &
                                    !(date >= "2014-12-31 00:00:00" & date <= "2015-01-01 23:00:00") &
                                    !(date >= "2015-01-26 00:00:00" & date <= "2015-01-26 23:00:00") &
                                    !(date >= "2015-02-21 00:00:00" & date <= "2015-02-22 23:00:00") &
                                    !(date >= "2015-03-09 00:00:00" & date <= "2015-03-09 23:00:00") &
                                    !(date >= "2015-04-03 00:00:00" & date <= "2015-04-06 23:00:00") & 
                                    !(date >= "2015-04-25 00:00:00" & date <= "2015-04-25 23:00:00") &
                                    !(date >= "2015-06-08 00:00:00" & date <= "2015-06-08 23:00:00") &
                                    !(date >= "2015-10-02 00:00:00" & date <= "2015-10-02 23:00:00"), ])

# Extract days
p.subset$day <- weekdays(p.subset$date, abbreviate = FALSE)
p.subset$weekend <- ifelse((p.subset$day == "Saturday" | p.subset$day == "Sunday"), 
                           "Weekend", "Weekday")
p.subset$weekend <- as.factor(p.subset$weekend)

# Extract time
p.subset$time=format(as.POSIXct(p.subset$date, format="%Y-%m-%d %H:%M"), format="%H:%M")

# Collapse down to total, average and sd per sensor
av_peds <- ddply(p.subset, c("Sensor_Name", "time"), summarise,
                 n_peds = sum(Hourly_Counts),
                 mean_peds = mean(Hourly_Counts), 
                 sd_peds = sd(Hourly_Counts)
)

# Graph
library(ggplot2)
ggplot(data=av_peds, aes(x=time, y=mean_peds, group=Sensor_Name, colour=Sensor_Name)) +
    geom_line() +
    geom_point()

# Too many categories! Solutions:
    # Separate the train station traffic from city traffic
    # Collapse the sensors down

# Station related:
    # Southern Cross Station, Spencer Street-Collins Street (North) and (South)
    # Flagstaff Station
    # Melbourne Central, State Library
    # Flinders Street-Elizabeth Street, Flinders Street Station Underpass, Flinders Street-Swanston Street

# In the CBD:
    # Bourke Street Mall (North) and (South)

# Get rid of:
    # Victoria Point
    # Webb Bridge
    # New Quay
    # Waterfront City
    # Convention/Exhibition Centre
    # Sandridge Bridge
    # Vic Arts Centre
    # St. Kilda-Alexandra Gardens
    # Birrung Marr
    # Tin-Alley-Swanson Street
    # Monash Rd-Swanston Street
    # Grattan Street-Swanson Street
    # Lygon Street (West) and (East)
    # Australia on Collins (inoperable)

levels(av_peds$Sensor_Name)
p.subset <- p.subset[ ! p.subset$Sensor_Name %in% c("Australia on Collins", "Birrarung Marr", 
                                                    "Lygon St (East)", "Lygon Street (West)",
                                                    "Grattan St-Swanston St (West)",
                                                    "Melbourne Convention Exhibition Centre",
                                                    "Monash Rd-Swanston St (West)", "New Quay",
                                                    "Sandridge Bridge", "St Kilda-Alexandra Gardens",
                                                    "The Arts Centre", "Tin Alley-Swanston St (West)",
                                                    "Victoria Point", "Waterfront City", "Webb Bridge"), ]

p.subset$Sensor_Name <- as.character(p.subset$Sensor_Name)
p.subset$collapsed_sensors <- p.subset$Sensor_Name

p.subset$collapsed_sensors[p.subset$Sensor_Name == "Bourke Street Mall (North)" |
                           p.subset$Sensor_Name == "Bourke Street Mall (South)"] <- "Bourke Street Mall"
p.subset$collapsed_sensors[p.subset$Sensor_Name == "City Square" |
                           p.subset$Sensor_Name == "Town Hall"] <- "Swanston Street South"
p.subset$collapsed_sensors[p.subset$Sensor_Name == "Collins Place (North)" |
                           p.subset$Sensor_Name == "Collins Place (South)"] <- "Collins Place"
p.subset$collapsed_sensors[p.subset$Sensor_Name == "Flinders St-Spark La" |
                           p.subset$Sensor_Name == "Flinders St-Spring St (West)"] <- "Flinders St-Spring Street"
p.subset$collapsed_sensors[p.subset$Sensor_Name == "Flinders St-Elizabeth St (East)" |
                           p.subset$Sensor_Name == "Flinders St-Swanston St (West)" |
                           p.subset$Sensor_Name == "Flinders Street Station Underpass"] <- "Flinders Street Station"
p.subset$collapsed_sensors[p.subset$Sensor_Name == "Southern Cross Station" |
                           p.subset$Sensor_Name == "Spencer St-Collins St (North)" |
                           p.subset$Sensor_Name == "Spencer St-Collins St (South)"] <- "Southern Cross Station"
p.subset$collapsed_sensors[p.subset$Sensor_Name == "Melbourne Central" |
                           p.subset$Sensor_Name == "State Library"] <- "Melbourne Central"

library(plyr)
# Collapse down to total, average and sd per sensor for reduced categories
av_peds <- ddply(p.subset, c("date", "collapsed_sensors"), summarise,
                 n_peds = sum(Hourly_Counts)
)

sort(tapply(av_peds$n_peds, av_peds$collapsed_sensors, mean))
# 5 busiest places in the CBD
# Stations by volume
# Swanston/Elizabeth Streets

# Extract days
av_peds$day <- weekdays(av_peds$date, abbreviate = FALSE)
av_peds$weekend <- ifelse((av_peds$day == "Saturday" | av_peds$day == "Sunday"), 
                           "Weekend", "Weekday")
av_peds$weekend <- as.factor(av_peds$weekend)

# Extract time
av_peds$time=format(as.POSIXct(av_peds$date, format="%Y-%m-%d %H:%M"), format="%H:%M")

av_peds <- ddply(av_peds, c("collapsed_sensors", "time"), summarise,
                 mean_peds = mean(n_peds), 
                 sd_peds = sd(n_peds)
)

# Graph
library(ggplot2)
ggplot(data=av_peds, aes(x=time, y=mean_peds, group=collapsed_sensors, colour=collapsed_sensors)) +
    geom_line() +
    geom_point()

facet_grid(. ~ weekend)

# Just the stations
station <- av_peds[av_peds$collapsed_sensors %in% c("Flinders Street Station", "Flagstaff Station", 
                                                    "Melbourne Central", "Southern Cross Station"), ]

# Graph
ggplot(data=station, aes(x=time, y=mean_peds, group=collapsed_sensors, colour=collapsed_sensors)) +
    geom_line() +
    geom_point()

tapply(p.subset$Hourly_Counts[p.subset$time == "08:00"], p.subset$Sensor_Name[p.subset$time == "08:00"], 
       function(x) sum(is.na(x)))
tapply(p.subset$Hourly_Counts[p.subset$time == "08:00"], p.subset$Sensor_Name[p.subset$time == "08:00"], 
       mean)
tapply(p.subset$Hourly_Counts[p.subset$time == "08:00"], p.subset$Sensor_Name[p.subset$time == "08:00"], 
       length)
tapply(p.subset$Hourly_Counts[p.subset$time == "08:00"], p.subset$Sensor_Name[p.subset$time == "08:00"], 
       sum)

# Flagstaff: 2460172 / 699 = 3519.559
# Melbourne Central: (333478 + 526488) / (603 + 699) = 660.4962

# Without the stations
cbd <- av_peds[! av_peds$collapsed_sensors %in% c("Flinders Street Station", "Flagstaff Station", 
                                                  "Melbourne Central", "Southern Cross Station"), ]

sorted.cbd <- cbd[order(-cbd$mean_peds),]
sorted.cbd[1:5,]

sorted.cbd <- cbd[order(cbd$collapsed_sensors, cbd$time),]
newdata <- mtcars[order(mpg, -cyl),]

# Graph
library(ggplot2)
ggplot(data=cbd, aes(x=time, y=mean_peds, group=collapsed_sensors, colour=collapsed_sensors)) +
    geom_line() +
    geom_point()



# Idea:
    # Motivation - areas of congestion in the city
    # Get rid of public holidays from data (special dates)
    # Extract DAY (and then weekend/weekday) and TIME as special separate variables 
    # Consider grouping time into early-morning/late morning/lunchtime/early afternoon/late afternoon/evening
    # /night
    # Then rank each area on level of pedestrian traffic - may want to limit to CBD proper.
    # pedestrians stations separate?
    # Need to put in Parliament (find sensors near entrances)
# Separate post on congestion on NYE - hour by hour