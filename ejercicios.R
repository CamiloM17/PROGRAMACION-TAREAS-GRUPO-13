
#1.Calcula los valores numéricos aproximados de
#a.
(0.3 * 0.15) / (0.3 * 0.15 + 0.2 * 0.8 + 0.5 * 0.12)
#b. 
((5 ^ 6 )/(factorial(6)) ) *exp(-5)
#c.
(factorial(20)/(factorial(13)*factorial(7)))*0.4^7*0.6^13

#2. Realizar la siguiente suma
#a.1+2+3+...+1000
sum(seq(1:1000))
#b.1+2+4+8+16+...+1024
1+sum(2^seq(1:10))

#3. El vector grupo representa el grupo al que pertenece una serie de alumnos
#a. ¿Cuántos elementos tiene?
length(grupo) 
#b. En qué posiciones del vector está la letra “A''?
which(grupo=="A")
#4. El vector nota representa la nota de un examen de los alumnos que están en los grupos del vector grupo.
nota
#a.¿Cuánto suman todas las notas?
sum(nota)
#b.¿Cuál es la media aritmética de todas las notas?
mean(nota)
#c.¿En qué posiciones están las notas mayores de 7.0?
which(nota>7)
#d. Visualiza las notas ordenadas de mayor a menor
notasordenadas<-order(nota,na.last=TRUE,decreasing=TRUE)
notasordenadas
nota[notasordenadas]
rev(sort(nota))
#e.¿En qué posición está la nota máxima?
match(max(nota),nota)
head(notasordenadas,1)

#5. A partir de los vectores grupo y nota definidos.
c(grupo)
c(nota)
v1=data.frame(grupo=c(grupo),nota=c(nota))

#a. Suma de notas 10 primeros alumnos
sum(nota[1:10])

#b. ¿Cuántos alumnos hay en el grupo C?
length(nota[grupo=='C'])

#c. ¿Cuántos alumnos han aprobado?
length(nota[nota>5])

#d. ¿Cuántos alumnos del grupo B han aprobado?
length(nota[grupo=='B'&nota>5])

#e. ¿Porcentaje de alumnos del grupo C han aprobado?
AprobadosC=c(length(nota[grupo=='C'&nota>5]))
TotalC=length(nota[grupo=='C'])

(AprobadosC/TotalC)*100

#f. ¿De qué grupos son la máxima y mínima notas de toda la muestra?
max(nota)
min(nota)
v1[v1$nota==max(nota),]
v1[v1$nota==min(nota),]

#g. Nota media de los alumnos de grupo A y B, juntos, considerando sólo a los que han aprobado
mean(nota[grupo=='B'&nota>5])
mean(nota[grupo=='A'&nota>5])
mean(c(nota[grupo=='B'&nota>5],nota[grupo=='A'&nota>5]))

#6. Calcula el percentil 66 de las notas de todos los alumnos, y también de los alumnos del grupo C
quantile(nota, 66/100)
quantile(nota[notasordenadas],66/100)
nota[nota<=5.5]
nota[notasordenadas[nota>5.5]]
#alumnos del grupo C
data.al <- data.frame(grupo,nota) 
soloC <- data.al[(data.al$grupo == "C"),]
quantile(soloC$nota, 66/100)

#7.Un alumno tiene una nota de 4.9. ¿Qué porcentaje, del total de alumnos, tiene una nota menor o igual que la suya? ¿Y qué porcentaje tiene una nota mayor o igual que la suya?

A=length(nota[nota>=4.9])
B=length(nota[nota<=4.9])
TOTAL=length(nota)
(A/TOTAL)*100
(B/TOTAL)*100


#8.Realiza el gráfico de diagramas de caja de las notas de cada grupo, para poder comparar el nivel de cada uno de ellos.
boxplot(nota~grupo)

#9. Si la variable conc recoge la concentración de plomo (en ppm) en el aire de cierta zona durante un día completo
horas<-c(rep(0,12),gl(23,12))
minutos<-c(0,seq(5,55,5))
plomo<-data.frame(conc, horas,minutos)
plomo
#a. ¿Cuál ha sido la concentración máxima?
max(plomo$conc)
#b. ¿En cuántos de los muestreos se ha superado la concentración de 40.0 ppm?
length(which(plomo$conc>40))
#c. ¿Cuál ha sido la concentración media del día?
mean(plomo$conc)
#d. ¿Cuáles fueron las 10 mediciones más bajas del día?
menoresconc=order(plomo$conc,na.last = TRUE,decreasing = TRUE)
plomo$conc[tail(menoresconc, 10)]
#e. Si la primera medida fue a las 00:00. ¿A qué hora del día se alcanzó la concentración máxima?
c(plomo$horas[match(max(plomo$conc),plomo$conc)],plomo$minutos[match(max(plomo$conc),plomo$conc)])
plomo[plomo$conc==max(conc),]

#1.Graficar los puntos (1,1),(2,4),(3,6),(4,8),(5,25),(6,36),(7,49),(8,61),(9,81),(10,100) en un plano usado Rstudio
abscisas<-c(1,2,3,4,5,6,7,8,9,10)
ordenadas<-c(1,4,6,8,25,36,49,61,81,100)
plot(x=abscisas,y=ordenadas)

#2. Ingresar la matriz A en RStudio
vect1<-c(1, 2, 3, 4, 2, 4, 6, 8, 3, 6, 9, 12)
matrix(data = vect1, nrow = 4, ncol = 3)
A= matrix(data = vect1, nrow = 4, ncol = 3)

#3. Ingresar la matriz identidad de tamaño 3
diag(1,3,3)    #o también     
diag(3)

#4. Crea una función que cree una matriz nula ingresando las dimensiones
matrixnula<-function(x,y) {
  matrix(0,x,y)
}
#Ejemplo:
matrixnula(7,10)

#5. Modificar la matriz diag(4), para que se parezca a la matriz B
vec3<-c(0, 2, 3, 4)
diag(x =vec3, nrow = 4, ncol = 4)
B=diag(x =vec3, nrow = 4, ncol = 4)
#También 
diag(c(0,2,3,4),4,4)

#6. Obtener la matriz transpuesta de A (ejercicio 2)
t(A)

#7. Realizar las siguientes operaciones A+B, A - B, 3B y AB
A
B
A+B
A-B
3*B
A%*%B
B%*%A

#8.Crea una función para calcular P6 
P<-matrix(c(1,-2,1,2,4,0,3,-2,1),nrow=3,ncol=3)
P
fun<- function(x){
  (((((x%*%x)%*%x)%*%x)%*%x)%*%x)
}
fun(P)

#9. Resolver el sistema de ecuaciones 
#3x−y+z=−1
#9x−2y+z=−9
#3x+y−2z=−9
A=cbind(c(3,9,3),c(-1,-2,1),c(1,1,-2))
B=c(-1,-9,-9)
solve(A,B)

#10.Utilizando la ayuda de R, investigue para qué sirven las funciones eigen() y det()
#det sirve para hallar por separado el módulo del determinante de una matriz
mtrx=matrix(c(-2,2,-3,-1,1,3,2,0,-1),3,3)
det(mtrx)
#eigen sirve para hallar por separado los valores y vectores propios de una matriz
eigen(mtrx)

#11. calcular A⋅B-A(B^t)
### cambiando B⋅A-B(A^t)
v <- (1:10)
B2 <- matrix(c(v,v*2,v*3,v*4,v*5),10)
A2 <- matrix(c(0,1,0,0,1,1,0,1,1,0,0,1,0,0,1,1,0,1,0,1,0,1,0,1,0),5)
B2%*%A2 - B2%*%t(A2)

#12.Considere  β = ( X t ⋅ X ) ^−1 ⋅ X^ t ⋅ Y
x<-matrix(c(1,1,1,1,1,1,-1,0,1,2),nrow=5,ncol=2)
y<-matrix(c(0,0,1,1,3),nrow = 5,ncol = 1)
(solve(t(x)%*%x)%*%t(x))%*%y

#13. Corre el siguiente código para cargar los vectores year y co2 en memoria
data(co2)
means = aggregate(co2, FUN=mean)
year = as.vector(time(means))
co2 = as.vector(means)


#14.Lee el archivo rainfall.csv como un data.frame. Calcula e imprime un vector con los nombres de las estaciones donde al menos uno de los meses tiene una precipitación superior a 180mm
df<-read.csv("C:/Users/Camilo/Documents/UNMSM/PROGRAMACIÓN/rainfall.csv")
Nombres<-df[(df$sep>180)|(df$oct>180)|(df$nov>180)|(df$dec>180)|(df$jan>180)|(df$feb>180)|(df$mar>180)|(df$apr>180)|(df$may>180),]
c((Nombres$name))

df[1]


