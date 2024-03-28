file <- 'turn_freq.csv'
TurnFreqDF <- read.csv(file, stringsAsFactors = FALSE)

names(TurnFreqDF)[1] <- "Heading"
names(TurnFreqDF)[2] <- "Freq"
names(TurnFreqDF)[3] <- "Err"

library(ggplot2)
ggplot(TurnFreqDF, aes(x = Heading, y = Freq)) +
  geom_ribbon(aes(ymin = Freq - Err, ymax  = Freq + Err), alpha = 0.2) +
  geom_line()
