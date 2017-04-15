library(ggplot2)

Turkey <- read.csv("http://pages.iu.edu/~cdesante/turkey.csv")
ggplot(data = Turkey) + geom_tile(aes(x = Happy, y = Thanksgiving, fill=Turkey.Colors 
)) + scale_fill_identity() + theme_bw() + labs(title = "Happy Thanksgiving 2016 from is.R()!\n",
                                               x = "", y = "") + scale_x_continuous(breaks = NULL)+ scale_y_continuous(breaks = NULL)

ChristmasTree <- read.csv("/Users/jodieburchell/Documents/Blog-posts/Christmas tree base data.csv")
#Christmas$Bauble.Colour <- factor(Christmas$Bauble.Colour, 
#                                  labels = c("1", "2", "3"))


ChristmasTree <- read.csv("https://raw.githubusercontent.com/t-redactyl/Blog-posts/master/Christmas%20tree%20base%20data.csv")

# Generate randomly placed Christmas lights
Desired.Lights <- 50
Total.Lights <- sum(round(Desired.Lights * 0.35) + round(Desired.Lights * 0.20) + 
                      round(Desired.Lights * 0.17) + round(Desired.Lights * 0.13) +
                      round(Desired.Lights * 0.10) + round(Desired.Lights * 0.05))

Lights <- data.frame(Lights.X = c(round(runif(round(Desired.Lights * 0.35), 4, 18), 0),
                                       round(runif(round(Desired.Lights * 0.20), 5, 17), 0),
                                       round(runif(round(Desired.Lights * 0.17), 6, 16), 0),
                                       round(runif(round(Desired.Lights * 0.13), 7, 15), 0),
                                       round(runif(round(Desired.Lights * 0.10), 8, 14), 0),
                                       round(runif(round(Desired.Lights * 0.05), 10, 12), 0)))
Lights$Lights.Y <- c(round(runif(round(Desired.Lights * 0.35), 4, 6), 0),
                          round(runif(round(Desired.Lights * 0.20), 7, 8), 0),
                          round(runif(round(Desired.Lights * 0.17), 9, 10), 0),
                          round(runif(round(Desired.Lights * 0.13), 11, 12), 0),
                          round(runif(round(Desired.Lights * 0.10), 13, 14), 0),
                          round(runif(round(Desired.Lights * 0.05), 15, 17), 0))
Lights$Lights.Colour <- c(round(runif(Total.Lights, 1, 4), 0))

# Generate baubles
Baubles <- data.frame(Bauble.X = c(6, 9, 15, 17, 5, 13, 16, 7, 10, 14, 7, 9, 11, 
                                   14, 8, 14, 9, 12, 11, 12, 14, 11, 17, 10))
Baubles$Bauble.Y <- c(4, 5, 4, 4, 5, 5, 5, 6, 6, 6, 8, 8, 8, 8, 10,
                      10, 11, 11, 12, 13, 10, 16, 7, 14)
Baubles$Bauble.Colour <- factor(c(1, 2, 2, 3, 2, 3, 1, 3, 1, 1, 1, 2, 1, 2,
                                  3, 3, 2, 1, 3, 2, 1, 3, 3, 1))
Baubles$Bauble.Size <- c(1, 3, 1, 1, 2, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3,
                         2, 3, 1, 1, 2, 2, 3, 3, 2)


ggplot() + 
  geom_tile(data = ChristmasTree, aes(x = Tree.X, y = Tree.Y, fill = Tree.Colour)) +
  scale_fill_identity() + 
  geom_point(data = Lights, aes(x = Lights.X, y = Lights.Y, alpha = Lights.Colour),
             colour = "lightgoldenrodyellow", shape = 16) +
  geom_point(data = Baubles, aes(x = Bauble.X, y = Bauble.Y, colour = Bauble.Colour, size = Bauble.Size),
             shape = 16) +
  scale_colour_manual(values = c("firebrick2", "gold", "dodgerblue3")) +
  scale_size_area(max_size = 12) +
  theme_bw() +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  geom_segment(aes(x = 2.5, xend = 4.5, y = 1.5, yend = 1.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 5.5, xend = 8.5, y = 1.5, yend = 1.5), colour = "dodgerblue3", size = 2) +
  geom_segment(aes(x = 13.5, xend = 16.5, y = 1.5, yend = 1.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 17.5, xend = 19.5, y = 1.5, yend = 1.5), colour = "dodgerblue3", size = 2) +
  geom_segment(aes(x = 3.5, xend = 3.5, y = 0.5, yend = 2.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 7.0, xend = 7.0, y = 0.5, yend = 2.5), colour = "dodgerblue3", size = 2) +
  geom_segment(aes(x = 15.0, xend = 15.0, y = 0.5, yend = 2.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 18.5, xend = 18.5, y = 0.5, yend = 2.5), colour = "dodgerblue3", size = 2) +
  annotate("text", x = 11, y = 20, label = "Merry Christmas!", family = "Luminari",
           size = 12) +
  labs(x = "", y = "") +
  theme(legend.position = "none")

library(extrafont)
font_import()

