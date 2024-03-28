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
