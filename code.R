#packages
packages<-c("tidyverse","glue","datapasta","stringr","stringi","haven","readxl",
            "stargazer","flextable","huxtable")
#sapply(packages,install.packages,character.only=T)
sapply(packages,library,character.only=T)

#read  table
df<-read_excel("table.xlsx",sheet = "Sheet2")
df$institute<-str_to_title(df$institute)
df$institute[-c(1,5,8:9,11,14:15,17,22:23,27,30)]<-c("NIIST Thiruvananthapuram",
                "National Centre for Earth Science Studies",
                "Public Policy Research Institute",
                "Department Of Chemical Sciences, IISER Thiruvananthapuram",
                "Biomedical Technology Wing, Sree Chitra Thirunal Institute Of Medical Science and Technology",
                "Indian Institute of Spices Research Calicut",
                "Central Institute of Fisheries Technology",
                "National Ayurveda Research Institute for Panchakarma",
                "National Institute for Research & Development in Defence Shipbuilding",
                "ICAR Sugarcane Research Institute Kannur",
                "CDAC Trivandrum",
                "IIT Palakkad",
                "CCRI Kayamkulam",
                "Institute of Advanced Virology",
                "Centre for Development Studies Thiruvananthapuram",
                "Centre for Fisheries Studies Kerala",
                "National Coir Research and Management Institute",
                "RRI, Kottayam",
                "Trivandrum Engineering Science and Technology Research Park",
                "IRTC Palakkad",
                "RCC Thiruvananthapuram",
                "CIPET Thiruvananthapuram",
                "NISH Thiruvananthapuram",
                "Cashew and Coco Development Board"
                )
df<-df %>% mutate(field=case_when(is.na(field)~"No Information",
                                  TRUE~field),
                  type=case_when(is.na(type)~"No Information",
                                 TRUE~type)) 

levels<-c("Agriculture","Horticulture","Plantation Crops","Fisheries",
          "Small Scale Industry","Infrastructure development","Development Institution",
          "Public Policy","Education","Interdisciplinary","Medical",
          "Science","Information Technology","No Information")
df$field<-factor(df$field,levels = levels)
df<-arrange(df,df$field)
df<-df %>% mutate(new_ins=case_when(is.na(acro)~institute,
                                    !is.na(acro)~paste0(acro,
                                                       " (",
                                                       Abr,") ",
                                                       place)))
field_table<-fct_count(df$field) %>% select(Field=f,
                                            Number=n)
df<-df %>% mutate(type=as_factor(type)) 
df$type<-fct_relevel(df$type,"No Information",after = 2)

type_table<-fct_count(df$type)%>% select(Field=f,
                                         Number=n)


#df <- df %>% slice(1:10)

ntype<-table(factor(df$type))
level_ntpe<-levels(factor(df$type))
sectors<-levels(factor(df$field))
no_info<-length(df %>% filter(type=="No Information") %>% select(institute))

