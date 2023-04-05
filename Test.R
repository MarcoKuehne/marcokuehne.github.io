# load package
library(haven)
# read dta file from github
soep <- read_dta("/data/SOEP/practice_en/practice_data_eng.dta")

soep <- read_dta("C:/Users/Marco2020/Dropbox/Becoming_Fluent_in_Data/data/SOEP/practice_en")

soep <- read_dta("practice_dataset_eng.dta")


soep %>% 
  filter(erwerb %in% c(1,2)) %>% 
  group_by(sex, erwerb) %>% 
  summarise(across(satisf_org, mean, na.rm = TRUE),
            n = n()) %>% 
  ggplot(aes(x = education, y = satisf_org, col = as.factor(sex))) +
  geom_point() +
  labs(title = "Mean Satisfaction per Education Level by Gender",
       x = "Education", y = "Mean Satisfaction", color = "Gender")