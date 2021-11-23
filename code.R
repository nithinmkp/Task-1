#packages
packages<-c("tidyverse","glue","datapasta","stringr","stringi","haven","readxl",
            "stargazer")
#sapply(packages,install.packages,character.only=T)
sapply(packages,library,character.only=T)


#Read names of institute
names<-c("Indian Tuber crops research institute", "NIIST Thiruvananthapuram", "National Centre for Earth science studies", "Rajiv Gandhi Centre for biotechnology", "Public policy research institute", "Department of chemical sciences IISER Thiruvananthapuram", "Biomedical technology wing Sree Chitra thirunal institute of medical science and technology", "Central coir research institute", "Indian cardamom research institute Idukki", "Indian institute of spices research Calicut", "Central Marine fisheries research institute Kochi", "Central institute of fisheries technology", "National Ayurveda research institute for panchakarma", "Fluid control research institute", "Central plantation crops research institute Kasaragod", "Central plantation crops research institute", "National institute for r and d in defence shipbuilding", "Vikram Sarabhai space Centre", "ICAR sugarcane research institute Kannur", "CDAC Trivandrum", "IIT Palakkad", "CCRI Kayamkulam", "Kerala agricultural research institute", "Kerala Highway research institute", "Institute of advanced virology", "Centre for development studies Thiruvananthapuram", "Centre for fisheries studies Kerala", "Coconut research station Kerala", "National coir research and management institute", "RRI, Kottayam", "Kerala engineering research institute Peechi", "Trivandrum engineering science and technology research park", "IRTC Palakkad", "RCC Thiruvananthapuram", "Indian cardamom research institute", "CIPET Thiruvananthapuram", "NISH Thiruvananthapuram")
tuber_crops<-c("1. Cassava Manihot esculenta Crantz", "Euphorbiaceae", "2. Sweet potato Ipomoea batatas (L.) Lam. Convolvulaceae; 3. Greater yam Dioscorea alata L. Dioscoreaceae; 4. White yam Dioscorea rotundata Poir", "Dioscoreaceae; 5. Lesser yam Dioscorea esculenta (Lour.) Burls. Dioscoreaceae; 6. Taro Colocasia esculenta (L.) Schott. Araceae; 7. Tannia Xanthosoma sagittifolium (L.) Schott. Araceae; 8. Elephant foot yam Amorphophallus paeoniifolius (Dennst.) Nicolson Araceae; 9. Giant taro Alocasia macrorrhiza (L.) Schott. Araceae; 10. Swamp taro Cyrtosperma chamissonis (Schott) Merr. Araceae; 11. Chinese potato Solenostemon rotundifolius (Poir) J.K. Morton Labiatae; 12. Yam bean Pachyrrhizus erosus (L.) Urban Leguminaceae; 13. Arrowroot Maranta arundinacea L. Marantaceae; 14. Canna Canna edulis (Ker-Gawler) Cannaceae.")



data<-tibble(
  institute=names,
  type=NA,
  field=NA,
  focus=NA
  
)

