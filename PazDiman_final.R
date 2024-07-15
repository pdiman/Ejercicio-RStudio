rm(list = ls())
getwd()
library("readr")
provincias_nuevo <- read_csv("./provincias_nuevo.csv")
library(tidyverse)
View(provincias_nuevo)
library(tidyverse)
provincias_nuevo <- provincias_nuevo %>%
  rename(situacion_calle = Personas.en.situación.de.calle.vía.pública.2022)
media_situacion_calle <- provincias_nuevo %>%
  group_by(Nombre.de.provincia) %>% 
  summarise(media_situacion_calle = mean(situacion_calle, na.rm = TRUE)) 
ggplot(provincias_nuevo, aes(x = reorder(Nombre.de.provincia, Viviendas.particulares.2022), y = Viviendas.particulares.2022)) + 
  geom_bar(stat = "identity", na.rm = TRUE) + 
  coord_flip() +  
  labs(title = "Viviendas particulares por provincias argentinas en 2022", 
       x = "Provincias",
       y = "Cantidad de viviendas particulares") +
  theme_minimal () 
ggplot(provincias_nuevo, aes(x = Nombre.de.provincia, y = Población.2022, fill = Viviendas.particulares.2022)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  scale_fill_viridis_c() +  
  labs(title = "Comparación de población 2022 y viviendas particulares por provincia",
       x = "Provincia",
       y = "Población 2022",
       fill = "Viviendas particulares") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  
