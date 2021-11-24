#packages
packages<-c("tidyverse","glue","datapasta","stringr","stringi","haven","readxl",
            "stargazer")
#sapply(packages,install.packages,character.only=T)
sapply(packages,library,character.only=T)

#read  table
df<-read_excel("table.xlsx",sheet = "Sheet2")

ntype<-table(factor(df$type))
level_ntpe<-levels(factor(df$type))
sectors<-levels(factor(df$field))

df <- df %>% slice(1:10)
