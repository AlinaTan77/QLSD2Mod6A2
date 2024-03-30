setwd("~/Desktop/QLS_600/Mod6/A2")

##### Heading vs Turn Frequency
file <- 'turn_freq.csv'
TurnFreqDF <- read.csv(file, stringsAsFactors = FALSE)

names(TurnFreqDF)[1] <- "Heading"
names(TurnFreqDF)[2] <- "Freq"
names(TurnFreqDF)[3] <- "Err"

library(ggplot2)
ggplot(TurnFreqDF, aes(x = Heading, y = Freq)) +
  geom_ribbon(aes(ymin = Freq - Err, ymax  = Freq + Err), alpha = 0.2) +
  geom_line()

##### Position vs Turn Frequency
file <- 'pos_turn_freq.csv'
TurnFreqDF <- read.csv(file, stringsAsFactors = FALSE)

names(TurnFreqDF)[1] <- "Position"
names(TurnFreqDF)[2] <- "Freq"
names(TurnFreqDF)[3] <- "Err"

library(ggplot2)
ggplot(TurnFreqDF, aes(x = Position, y = Freq)) +
  geom_ribbon(aes(ymin = Freq - Err, ymax  = Freq + Err), alpha = 0.2) +
  geom_line()

##### Heading vs Change in Direction
file <- 'head_change.csv'
TurnFreqDF <- read.csv(file, stringsAsFactors = FALSE)

names(TurnFreqDF)[1] <- "Heading"
names(TurnFreqDF)[2] <- "Head_Change"
names(TurnFreqDF)[3] <- "Err"

library(ggplot2)
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

hist(after_turn1_t, main = "Histogram of Head Direction After Turn (-45,45)", 
     xlab = "Degree", ylab = "Frequency")
hist(after_turn2_t, main = "Histogram of Head Direction After Turn (45,135)", 
     xlab = "Degree", ylab = "Frequency")
hist(after_turn3_t, main = "Histogram of Head Direction After Turn (-135, -45)", 
     xlab = "Degree", ylab = "Frequency")
hist(after_turn4_t, main = "Histogram of Head Direction After Turn (-135, 135)", 
     xlab = "Degree", ylab = "Frequency")

par(mfrow = c(1, 1))
