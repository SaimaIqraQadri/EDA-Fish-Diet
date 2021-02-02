library(tidyverse)
library(UsingR)
fish_diet <- read.csv("fish-diet.csv", 
                      stringsAsFactors = FALSE)
View(fish_diet)
names(fish_diet)

#fish_in_diet
unique(fish_diet$fish_in_diet)

table(fish_diet$fish_in_diet)

ggplot(fish_diet, aes(x = fish_in_diet)) +
  geom_bar()


#cancer
unique(fish_diet$cancer)

table(fish_diet$cancer)

ggplot(fish_diet, aes(x = cancer)) +
  geom_bar()


#fish_in_diet vs cancer
ggplot(fish_diet, aes(x = fish_in_diet)) +
  geom_bar() +
  facet_wrap( ~ cancer)
## Bar plot shows that;
# The ratio of cancer (who have fish in their diet) is lower 
#than the healthy people (who have fish in their diet)


# check if CANCER is independent or dependent on the fish in diet
## Contingency table
table(fish_diet$fish_in_diet, fish_diet$cancer)

#Null hypothesis: variables are independent (No association b/w 
#                                                 cancer and fish_iN_diet)
#Alternative hypotheis:variables are dependent  
#                                   (Cancer is dependent on fish in diet) 

#perform chi-square test
chisq.test(fish_diet$fish_in_diet, fish_diet$cancer)
## p-value is 0.29, greater than the significance level 0.05 
#   Fail to reject null hypothesis 

chisq <- chisq.test(fish_diet$fish_in_diet, fish_diet$cancer)

chisq$observed

round(chisq$expected, 2)

round(chisq$residuals, 2)


#CONCLUSON;
#From given data, there is NO asssociation between the amount of fish
#    in diet and prostrate cancer