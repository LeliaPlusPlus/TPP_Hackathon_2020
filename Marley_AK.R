library(tidyverse)

library(haven)

ak <- read.csv("ak.csv")
pa <- read.csv("pa.csv")

View(ak)

ak$X # code for the record/day

ak_new_1 <- ak %>%
  mutate(death_rate =  Resident.Deaths/(Residents.Confirmed + Staff.Confirmed))

ak_new_2 <- ak_new_1 %>%
  mutate(positivity_rate = (Residents.Confirmed + Staff.Confirmed)/(Residents.Tested + Staff.Tested))

View(ak_new_2)           

is.na(ak_new_2$Residents.Tested) <- 0


ak_new_3 <- ak_new_2 %>%
  replace_na(list(x = 0, y = "unknown"))%>%
  mutate(tests_rate = (Residents.Tested + Staff.Tested + Staff.Pending + Residents.Pending)/Population_HIFLD)
  
view(ak_new_3)



