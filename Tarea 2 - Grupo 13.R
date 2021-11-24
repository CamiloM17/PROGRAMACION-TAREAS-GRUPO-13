#1. ¿Qué cantidad de dinero sobra al repartir 10000$ entre 3 personas?
10000%%3

#2. ¿Es el número 4560 divisible por 3?
4560%%3==0

#3. Construya un vector con los números enteros del 2 al 87. ¿Cuáles de esos números son divisibles por 7?
c(2:87)
v3<-c(2:87)
v3[v3%%7==0]

#4. Construya dos vectores, el primero con los números enteros desde 7 hasta 3, el segundo vector con los primeros cinco números positivos divisibles por 5.
#a. Sea A la condición de ser par en el primer vector.
#b. Sea B la condición de ser mayor que 10 en el segundo vector.
#c. ¿En cuál de las 5 posiciones se cumple A y B simultáneamente?
v4a=c(7:3)
v4b=c(seq(5,25,5))
which((v4a%%2==0)&(v4b>10))

#5. Consulte este link en el cual hay una anécdota de Gauss niño. Use R para obtener el resultado de la suma solicitada por el profesor del niño Gauss. 
seq(1:100)
sum(seq(1:100))

#6. Construya un vector con los siguientes elementos: 1, -4, 5, 9, -4. Escriba un procedimiento para extraer las posiciones donde está el valor mínimo en el vector.
V <- c(1,-4,5,9,-4)
which(V==min(V),)
#7. Calcular 8!
  factorial(8) 

#8. Evaluar la siguiente sumatoria
argumentosum<-function(x){
  exp(x)
}
sum(argumentosum(3:7))

#9. Evaluar la siguiente productoria
argumentoprod<-function(x){
  log10(sqrt(x))
}
prod(argumentoprod(1:10))

#10. Realizar una función que permita calcular el área de una corona circular.
areacorona<-function(R,s,c,d){
  0.5*(R*s-c*d)
}
areacorona (8,4,3,1)
#11. Construya un vector cualquiera e inviértalo, es decir, que el primer elemento quede de último, el segundo de penúltimo y así sucesivamente. Compare su resultado con el de la función rev.
v<-c("a","b","c","d")  
rev(v)

#12. Calcular lo siguiente
argumentosum2<-function(x){
  x^(3)+4*x^(2)
}
sum(argumentosum2(10:100))

#13. Calcular lo siguiente
argumentosum3<-function(x){
  (2^(x)/x)+(3^(x)/x^(2))
}
sum(argumentosum3(1:25))

#14. Lea el siguiente archivo 
paises<-read.table("https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt",header=TRUE)
#a. Calcular el número de variables del dataset
length(paises)
#b. ¿Cuántos países hay en el dataset?
length(paises$Pais)
#c. ¿Cuál es el país con mayor población?
paises$Pais[paises$poblacion==max(paises$poblacion)]
#d. ¿Cuál es el país con alfabetización más baja?
paises$Pais[paises$alfabetizacion==min(paises$alfabetizacion)]

#15. En R hay unas bases de datos incluidas, una de ellas es la base de datos llamada mtcars. Para conocer las variables que están en mtcars usted puede escribir en la consola ?mtcars o también help(mtcars). De la base mtcars obtenga bases de datos que cumplan las siguientes condiciones.
#a. Autos que tengan un rendimiento menor a 18 millas por galón de combustible.
#b. Autos que tengan 4 cilindros.
#c. Autos que pesen más de 2500 libras y tengan transmisión manual

# 16. La ecuación de tiempo es la diferencia entre el tiempo solar medio y el tiempo solar aparente (Referencia). Si bien esta varía, la forma analítica de esta ecuación se muestra a continuación (Usar x como un rango de 0 a 365). Replicar el gráfico: http://pbarbier.com/eqtime/eqtime.html

x=c(0:365)

y=c(2*pi*(x-81)/365)

fy=c(9.87*sin(2*y)-7.53*cos(y)-1.5*sin(y))

plot(fy, type="l",lty="33",lwd="2", axes=TRUE, las=1, pch=20, yaxp=c(-12,18,5),xaxp = c(0, 365, 12),xaxt="n", xlab="", ylab="Minutos", col="red", font=2)


title(main="Ecuacion del tiempo
Mathematical Astronomy Morsels, Jean Meeus. 1997", adj=0, line=0.5, cex.main=1)
title(sub="Realizado por GRUPO 13", adj=1, line = 2.5, cex.sub=0.8)

axis(1, at = seq(0, 365, by=30.4),
     labels = c("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre","Enero"), cex.axis=0.47)


