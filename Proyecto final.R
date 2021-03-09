#PROYECTO DE FRECUENCIAS DE CLIENTES Y PRODUCTOS

# instalar paquetes que se usarán

#install.packages("readr")
#install.packages("dplyr")


# cargar paquete que se usarán

library(readr)
library(dplyr)



#Ver directorio
getwd()


#Abrir el archivo desde consola

file.choose()


#se crea la variable que contiene el archivo csv

ruta_csv <- "C:\\Users\\estef\\Documents\\ShellCOR.csv"

ruta_csv <- "C:\\Users\\estef\\Documents\\Continental COR.csv"


#Crear data frame con con tenido de csv

dbCustomer <- data.frame(read.csv(ruta_csv))



#Sacamos resumen del data frame

summary

#Miramos la dimension

dim(dbCustomer)

#Mirar datos

View(dbCustomer)


#Mostrar la frecuencia de las entidades del cliente


customerN <- data.frame(dbCustomer$HPCustomerNumber)

freqCust <-table(customerN)



#Gráfico de barras

barplot(freqCust,
        col = 'blue',
        main = 'Products numbers')




#Haciendo un histograma de cuál es la entidad del cliente quem más pide

hist(freqCust)

#Editando histograma

hist(freqCust,
     main = "SHELL",
     xlab = "Entidades del cliente"
)


#Usando ggplot

library(ggplot2)


#Hacer una gráfica de barras con ggplot

ggplot(data = dbCustomer,
       mapping = aes(x = factor(HPCustomerNumber))) + 
  geom_bar(fill="darkorchid4")


 

#Confirmar la clase de las columnas con las que voy a trabajar el precio (No Conti)

class(dbCustomer$NetLineDollarPrice)



#Cambiar todos los precios + 2 para ocultar los precios originales

Vnetprice <-c(2+dbCustomer$NetLineDollarPrice)


#Ver la columna con los cambios
Vnetprice

#Saber cuál es el precio mínimo y el máximo

range(Vnetprice)



#Saber cuál es el mínimo
min(Vnetprice)


#Saber cuál es el máximo
max(Vnetprice)


#Calcular el promedio

mean(Vnetprice)

#Calcular la mediana

median(Vnetprice)



#Obtener moda

#Instalar modeest
#install.packages("modeest")

#Cargar paquete modeest
library(modeest)

mfv(Vnetprice)


#Varianza
var(Vnetprice)



#Desviación estandar
sd(Vnetprice)



#Mirar Vnetprice
View(Vnetprice)


#Total de ventas de Julio 2020 a febrero 2021

apply (dbCustomer[ , 16:17], 1, prod)

prodVentas = apply (dbCustomer[ , 14:15], 1, prod)

View(prodVentas)

totalVentas = sum(1:1180, prodVentas)


View(totalVentas)


#Trabajar con columna de número de producto
#Verificar la clase de product number
class(dbCustomer$ProductNumber)



#Creando data frame de productos

productos <- data.frame(dbCustomer$ProductNumber)


#Ver el data frame de prodcutos

head(productos)


View(productos)


#creando una variable con una tabla de frecuencias de productos

freqprod <- table(productos)


View(freqprod)


max(freqprod)




#Creando un histograma


hist(freqprod,
     main = "SHELL",
     xlab = "Product numbers"
)



#Creación de gráficos

#Gráfica de barras

ggplot(freqprod, aes(Freq))+ geom_histogram()

class(freqprod)


#barplot(freqprod,
#        col = 'green',
#        main = 'Products numbers')



#Exportar frecuenta de productos a Excel

#install.packages("openxlsx")

library(openxlsx)

write.xlsx(freqprod, "Frecuencia de productos.xlsx")

write.xlsx(freqCust,"Frecuencia de venta por cliente.xlsx")



theme(axis.text.x = element_text(angle = 45, hjust = 1))

