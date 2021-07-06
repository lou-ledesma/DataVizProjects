library(ggplot2)
library(dplyr)

df <- read.csv("C:/Users/loudr/Desktop/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Data Visualization Project/Economist_Assignment_Data.csv")
print(head(df))
print(summary(df))



pl <- ggplot(df, aes(x=CPI, y=HDI))
pl2 <- pl + geom_point(shape=21, size=5, stroke =2, aes(color=factor(Region)))
pl3 <- pl2 + ggtitle("Corruption and human development") + xlab("Corruptions Perception Index, 2011 (10=least corrupt)")+ ylab("Human Development Index, 2011 (1=best)")
pl4 <- pl3 + theme_economist_white() + theme(legend.position = 'top') + theme(legend.title = element_blank())
pl5 <- pl4 + geom_smooth(method ='lm', formula = y ~ log(x), se = FALSE, color ='red', aes(group=1))
pl6 <- pl5 + scale_y_continuous(breaks= c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0)) + scale_x_continuous(breaks = 0:10)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl7 <- pl6 + geom_text(aes(label = Country), color = "black", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

print(pl7)