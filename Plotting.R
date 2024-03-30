library(gridExtra)
library(circular)
library(ggplot2)

##### Heading vs Turn Frequency
file <- 'turn_freq.csv'
TurnFreqDF <- read.csv(file, stringsAsFactors = FALSE)

names(TurnFreqDF)[1] <- "Heading"
names(TurnFreqDF)[2] <- "Freq"
names(TurnFreqDF)[3] <- "Err"

ggplot(TurnFreqDF, aes(x = Heading, y = Freq)) +
  geom_ribbon(aes(ymin = Freq - Err, ymax  = Freq + Err), alpha = 0.2) +
  geom_line()

##### Position vs Turn Frequency
file <- 'pos_turn_freq.csv'
TurnFreqDF <- read.csv(file, stringsAsFactors = FALSE)

names(TurnFreqDF)[1] <- "Position"
names(TurnFreqDF)[2] <- "Freq"
names(TurnFreqDF)[3] <- "Err"

ggplot(TurnFreqDF, aes(x = Position, y = Freq)) +
  geom_ribbon(aes(ymin = Freq - Err, ymax  = Freq + Err), alpha = 0.2) +
  geom_line()

##### Heading vs Change in Direction
file <- 'head_change.csv'
TurnFreqDF <- read.csv(file, stringsAsFactors = FALSE)

names(TurnFreqDF)[1] <- "Heading"
names(TurnFreqDF)[2] <- "Head_Change"
names(TurnFreqDF)[3] <- "Err"

ggplot(TurnFreqDF, aes(x = Heading, y = Head_Change)) +
  geom_ribbon(aes(ymin = Head_Change - Err, ymax  = Head_Change + Err), alpha = 0.2) +
  geom_line()

#### Plot Histogram: Head direction after turn
after_turn1<- read.csv("post_degree1.csv",header = FALSE)
after_turn2<- read.csv("post_degree2.csv",header = FALSE)
after_turn3<- read.csv("post_degree3.csv",header = FALSE)
after_turn4<- read.csv("post_degree4.csv",header = FALSE)

after_turn1_t <-t(after_turn1)
after_turn2_t <-t(after_turn2)
after_turn3_t <-t(after_turn3)
after_turn4_t <-t(after_turn4)

### Plot the histogram
par(mfrow = c(2, 2))
hist(after_turn1_t, breaks = 20,main = "Histogram of Head Direction After Turn (-45,45)", 
     xlab = "Degree", ylab = "Frequency")
hist(after_turn2_t, breaks = 20, main = "Histogram of Head Direction After Turn (45,135)", 
     xlab = "Degree", ylab = "Frequency")
hist(after_turn3_t,breaks = 20, main = "Histogram of Head Direction After Turn (-135, -45)", 
     xlab = "Degree", ylab = "Frequency")
hist(after_turn4_t,breaks = 20, main = "Histogram of Head Direction After Turn (-135, 135)", 
     xlab = "Degree", ylab = "Frequency")
par(mfrow = c(1, 1))

### Plot the histogram in circular
data1 <- data.frame(angle = after_turn1_t)
data2 <- data.frame(angle = after_turn2_t)
data3 <- data.frame(angle = after_turn3_t)
data4 <- data.frame(angle = after_turn4_t)

# Create individual plots
plot1 <- ggplot(data1, aes(x = angle)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  coord_polar(start = 0) +
  labs(title = "Circular Histogram of Head Direction\n After Turn (-45,45)",
       x = "Degree", y = "Frequency") +
  theme_minimal() +
  geom_vline(xintercept = c(45, 135, -135, -45), color = "red") +
  annotate("text", x = c(45, -45), y = Inf, 
           label = c("45", "-45"), color = "red", 
           hjust = -0.3, vjust = 0.5)


plot2 <- ggplot(data2, aes(x = angle)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  coord_polar(start = 0) +
  labs(title = "Circular Histogram of Head Direction\n After Turn (45,135)",
       x = "Degree", y = "Frequency") +
  theme_minimal() +
  geom_vline(xintercept = c(45, 135, -135, -45), color = "red")+
  annotate("text", x = c(45, 135), y = Inf, 
           label = c("45", "135"), color = "red", 
           hjust = 0.9, vjust = 0.1)

plot3 <- ggplot(data3, aes(x = angle)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  coord_polar(start = 0) +
  labs(title = "Circular Histogram of Head Direction\n After Turn (-135, -45)",
       x = "Degree", y = "Frequency") +
  theme_minimal() +
  geom_vline(xintercept = c(45, 135, -135, -45), color = "red")+
  annotate("text", x = c(-135, -45), y = Inf, 
           label = c("-135", "-45"), color = "red", 
           hjust = -0.3, vjust = -0.1)

plot4 <- ggplot(data4, aes(x = angle)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  coord_polar(start = 0) +
  labs(title = "Circular Histogram of Head Direction\n After Turn (-135, 135)",
       x = "Degree", y = "Frequency") +
  theme_minimal() +
  geom_vline(xintercept = c(45, 135, -135, -45), color ="red")+
  annotate("text", x = c(135, -135), y = Inf, 
           label = c("135", "-135"), color = "red", 
           hjust = 0.3, vjust = -0.4)

# Arrange plots in a grid
grid.arrange(plot1, plot2, plot3, plot4, ncol = 2)

