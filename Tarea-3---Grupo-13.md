Tarea 3
================

# **TAREA 3 - GRUPO 13**

**Integrantes**

-   BARRRENECHEA BENITES, Marycielo Corazon

-   BECERRA ZEVALLOS, Cesar Gerardo

-   MUÑOZ RIMACHI, Camilo Patricio

``` r
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 4.1.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(nycflights13)
```

    ## Warning: package 'nycflights13' was built under R version 4.1.2

``` r
flights
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## **PARTE 1: dplyr - filter**

**1.** Encuentra todos los vuelos que:

**a.** Tuvieron un retraso de llegada de dos o más horas.

``` r
sol1a=dplyr::filter(flights, arr_delay >= 120)
sol1a
```

    ## # A tibble: 10,200 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      811            630       101     1047            830
    ##  2  2013     1     1      848           1835       853     1001           1950
    ##  3  2013     1     1      957            733       144     1056            853
    ##  4  2013     1     1     1114            900       134     1447           1222
    ##  5  2013     1     1     1505           1310       115     1638           1431
    ##  6  2013     1     1     1525           1340       105     1831           1626
    ##  7  2013     1     1     1549           1445        64     1912           1656
    ##  8  2013     1     1     1558           1359       119     1718           1515
    ##  9  2013     1     1     1732           1630        62     2028           1825
    ## 10  2013     1     1     1803           1620       103     2008           1750
    ## # ... with 10,190 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**b.** Volaron a Houston (IAH o HOU)

``` r
sol1b=dplyr::filter(flights, dest=="IAH" | dest=="HOU")
sol1b
```

    ## # A tibble: 9,313 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      623            627        -4      933            932
    ##  4  2013     1     1      728            732        -4     1041           1038
    ##  5  2013     1     1      739            739         0     1104           1038
    ##  6  2013     1     1      908            908         0     1228           1219
    ##  7  2013     1     1     1028           1026         2     1350           1339
    ##  8  2013     1     1     1044           1045        -1     1352           1351
    ##  9  2013     1     1     1114            900       134     1447           1222
    ## 10  2013     1     1     1205           1200         5     1503           1505
    ## # ... with 9,303 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

OTRA FORMA:

``` r
solu1b=dplyr::filter(flights, dest%in%c("IAH", "HOU"))
solu1b
```

    ## # A tibble: 9,313 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      623            627        -4      933            932
    ##  4  2013     1     1      728            732        -4     1041           1038
    ##  5  2013     1     1      739            739         0     1104           1038
    ##  6  2013     1     1      908            908         0     1228           1219
    ##  7  2013     1     1     1028           1026         2     1350           1339
    ##  8  2013     1     1     1044           1045        -1     1352           1351
    ##  9  2013     1     1     1114            900       134     1447           1222
    ## 10  2013     1     1     1205           1200         5     1503           1505
    ## # ... with 9,303 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**c.** Fueron operados por United, American o Delta

``` r
sol1c=dplyr::filter(flights,carrier=="UA"|carrier=="AA"|carrier=="DL")
sol1c
```

    ## # A tibble: 139,504 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      558            600        -2      753            745
    ##  7  2013     1     1      558            600        -2      924            917
    ##  8  2013     1     1      558            600        -2      923            937
    ##  9  2013     1     1      559            600        -1      941            910
    ## 10  2013     1     1      559            600        -1      854            902
    ## # ... with 139,494 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

OTRA FORMA:

``` r
solu1c=dplyr::filter(flights, carrier%in%c("UA", "AA", "DL"))
solu1c
```

    ## # A tibble: 139,504 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      558            600        -2      753            745
    ##  7  2013     1     1      558            600        -2      924            917
    ##  8  2013     1     1      558            600        -2      923            937
    ##  9  2013     1     1      559            600        -1      941            910
    ## 10  2013     1     1      559            600        -1      854            902
    ## # ... with 139,494 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**d.** Partieron en invierno del hemisferio sur (julio, agosto y
septiembre)

``` r
sol1d=dplyr::filter(flights, month==7|month==8|month==9)
sol1d
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

OTRA FORMA:

``` r
solu1d=dplyr::filter(flights, month%in%c(7, 8, 9))
solu1d
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**e.** Llegaron más de dos horas tarde, pero no salieron tarde

``` r
sol1e=dplyr::filter(flights, dep_delay <= 0 & arr_delay > 120)
sol1e
```

    ## # A tibble: 29 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1    27     1419           1420        -1     1754           1550
    ##  2  2013    10     7     1350           1350         0     1736           1526
    ##  3  2013    10     7     1357           1359        -2     1858           1654
    ##  4  2013    10    16      657            700        -3     1258           1056
    ##  5  2013    11     1      658            700        -2     1329           1015
    ##  6  2013     3    18     1844           1847        -3       39           2219
    ##  7  2013     4    17     1635           1640        -5     2049           1845
    ##  8  2013     4    18      558            600        -2     1149            850
    ##  9  2013     4    18      655            700        -5     1213            950
    ## 10  2013     5    22     1827           1830        -3     2217           2010
    ## # ... with 19 more rows, and 11 more variables: arr_delay <dbl>, carrier <chr>,
    ## #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>,
    ## #   distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**f.** Se retrasaron por lo menos una hora, pero repusieron más de 30
minutos en vuelo

``` r
sol1f=dplyr::filter(flights, dep_delay >= 60 & dep_delay - arr_delay > 30)
sol1f
```

    ## # A tibble: 1,844 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1     2205           1720       285       46           2040
    ##  2  2013     1     1     2326           2130       116      131             18
    ##  3  2013     1     3     1503           1221       162     1803           1555
    ##  4  2013     1     3     1839           1700        99     2056           1950
    ##  5  2013     1     3     1850           1745        65     2148           2120
    ##  6  2013     1     3     1941           1759       102     2246           2139
    ##  7  2013     1     3     1950           1845        65     2228           2227
    ##  8  2013     1     3     2015           1915        60     2135           2111
    ##  9  2013     1     3     2257           2000       177       45           2224
    ## 10  2013     1     4     1917           1700       137     2135           1950
    ## # ... with 1,834 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**g.** Partieron entre la medianoche y las 6 a.m. (incluyente)

``` r
sol1g=dplyr::filter(flights,dep_time %in% c(1:600)|dep_time==2400)
sol1g
```

    ## # A tibble: 9,373 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 9,363 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**2.** Otra función de dplyr que es útil para usar filtros es between().
¿Qué hace? ¿Puedes usarla para simplificar el código necesario para
responder a los desafíos anteriores?

``` r
#BETWEEN(): Between es una función la cual actúa como un atajo para x >= izquierda & x <= derecha, y devuelve un valor lógico que indica si el valor especificado está dentro de un rango. Esta se puede usar dentro de un filter() para agilizar el trabajo y no usar distintas operaciones lógicas

#Ejm: 1c. 
dplyr::filter(flights,between(month, 7, 9))
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**3.** ¿Cuántos vuelos tienen datos faltantes en horario_salida? ¿Qué
otras variables tienen valores faltantes? ¿Qué representan estas filas?

``` r
dplyr::filter(flights, is.na(dep_time))
```

    ## # A tibble: 8,255 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1       NA           1630        NA       NA           1815
    ##  2  2013     1     1       NA           1935        NA       NA           2240
    ##  3  2013     1     1       NA           1500        NA       NA           1825
    ##  4  2013     1     1       NA            600        NA       NA            901
    ##  5  2013     1     2       NA           1540        NA       NA           1747
    ##  6  2013     1     2       NA           1620        NA       NA           1746
    ##  7  2013     1     2       NA           1355        NA       NA           1459
    ##  8  2013     1     2       NA           1420        NA       NA           1644
    ##  9  2013     1     2       NA           1321        NA       NA           1536
    ## 10  2013     1     2       NA           1545        NA       NA           1910
    ## # ... with 8,245 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
#Los vuelos con NA en el horario de salida (dep_time) son los que no llegaron a salir, por lo tanto en las variables: dep_delay, arr_time, arr_delay, air_time, también se obtiene NA. Con esto concluimos que los vuelos fueron cancelados. 
```

**4.** ¿Por qué NA^0 no es faltante?

``` r
NA^0
```

    ## [1] 1

``` r
#is,na() es una función que determina si hay un valor faltante, con el retorno de un valor lógico. Pero como NA puede tomar cualquier valor, este número a la potencia de 0 siempre será 1.
```

¿Por qué NA \| TRUE no es faltante?

``` r
NA|TRUE
```

    ## [1] TRUE

``` r
#Como el NA se toma como un valor lógico, se aplica lógica proposicional: V|V o F|V siempre será verdadero (TRUE).
```

¿Por qué FALSE & NA no es faltante?

``` r
NA & FALSE
```

    ## [1] FALSE

``` r
# Como el NA se toma como un valor lógico, se aplica lógica proposicional: V&F o F&F siempre será falso (FALSE).
```

¿Puedes descubrir la regla general? (¡NA \* 0 es un contraejemplo
complicado!)

``` r
NA*0
```

    ## [1] NA

``` r
#Como el NA puede ser considerado cualquier valor (incluso los de números que tienden a infinito) y, como sabemos por teoría de límites, si multiplicamos 0*∞ no obtenemos resultado pues es indeterminado.
```

## **PARTE 2: dplyr - arrange**

**1.** ¿Cómo podrías usar arrange() para ordenar todos los valores
faltantes al comienzo? (Sugerencia: usa is.na()).

``` r
flights %>%
  arrange(desc(is.na(air_time)))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1     1525           1530        -5     1934           1805
    ##  2  2013     1     1     1528           1459        29     2002           1647
    ##  3  2013     1     1     1740           1745        -5     2158           2020
    ##  4  2013     1     1     1807           1738        29     2251           2103
    ##  5  2013     1     1     1939           1840        59       29           2151
    ##  6  2013     1     1     1952           1930        22     2358           2207
    ##  7  2013     1     1     2016           1930        46       NA           2220
    ##  8  2013     1     1       NA           1630        NA       NA           1815
    ##  9  2013     1     1       NA           1935        NA       NA           2240
    ## 10  2013     1     1       NA           1500        NA       NA           1825
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**2.** Ordena vuelos para encontrar los vuelos más retrasados. Encuentra
los vuelos que salieron más temprano.

VUELOS MÁS RETRASADOS:

``` r
flights %>%
  arrange(desc(dep_delay))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     9      641            900      1301     1242           1530
    ##  2  2013     6    15     1432           1935      1137     1607           2120
    ##  3  2013     1    10     1121           1635      1126     1239           1810
    ##  4  2013     9    20     1139           1845      1014     1457           2210
    ##  5  2013     7    22      845           1600      1005     1044           1815
    ##  6  2013     4    10     1100           1900       960     1342           2211
    ##  7  2013     3    17     2321            810       911      135           1020
    ##  8  2013     6    27      959           1900       899     1236           2226
    ##  9  2013     7    22     2257            759       898      121           1026
    ## 10  2013    12     5      756           1700       896     1058           2020
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

VUELOS QUE SALIERON MÁS TEMPRANO:

``` r
flights %>%
  arrange(dep_delay)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013    12     7     2040           2123       -43       40           2352
    ##  2  2013     2     3     2022           2055       -33     2240           2338
    ##  3  2013    11    10     1408           1440       -32     1549           1559
    ##  4  2013     1    11     1900           1930       -30     2233           2243
    ##  5  2013     1    29     1703           1730       -27     1947           1957
    ##  6  2013     8     9      729            755       -26     1002            955
    ##  7  2013    10    23     1907           1932       -25     2143           2143
    ##  8  2013     3    30     2030           2055       -25     2213           2250
    ##  9  2013     3     2     1431           1455       -24     1601           1631
    ## 10  2013     5     5      934            958       -24     1225           1309
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

**3.** Ordena vuelos para encontrar los vuelos más rápidos (que viajaron
a mayor velocidad).

``` r
#Tendremos en cuenta rapidez = distance / air_time
flights %>%
  mutate(distance, rapidez = distance/air_time) %>%
  arrange(desc(rapidez))
```

    ## # A tibble: 336,776 x 20
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     5    25     1709           1700         9     1923           1937
    ##  2  2013     7     2     1558           1513        45     1745           1719
    ##  3  2013     5    13     2040           2025        15     2225           2226
    ##  4  2013     3    23     1914           1910         4     2045           2043
    ##  5  2013     1    12     1559           1600        -1     1849           1917
    ##  6  2013    11    17      650            655        -5     1059           1150
    ##  7  2013     2    21     2355           2358        -3      412            438
    ##  8  2013    11    17      759            800        -1     1212           1255
    ##  9  2013    11    16     2003           1925        38       17             36
    ## 10  2013    11    16     2349           2359       -10      402            440
    ## # ... with 336,766 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   rapidez <dbl>

**4.** ¿Cuáles vuelos viajaron más lejos? ¿Cuál viajó más cerca?

VUELOS QUE VIAJARON MÁS LEJOS:

``` r
flights %>%
  arrange(desc(distance))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      857            900        -3     1516           1530
    ##  2  2013     1     2      909            900         9     1525           1530
    ##  3  2013     1     3      914            900        14     1504           1530
    ##  4  2013     1     4      900            900         0     1516           1530
    ##  5  2013     1     5      858            900        -2     1519           1530
    ##  6  2013     1     6     1019            900        79     1558           1530
    ##  7  2013     1     7     1042            900       102     1620           1530
    ##  8  2013     1     8      901            900         1     1504           1530
    ##  9  2013     1     9      641            900      1301     1242           1530
    ## 10  2013     1    10      859            900        -1     1449           1530
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

VUELOS QUE VIAJARON MÁS CERCA:

``` r
flights %>%
  arrange(distance)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7    27       NA            106        NA       NA            245
    ##  2  2013     1     3     2127           2129        -2     2222           2224
    ##  3  2013     1     4     1240           1200        40     1333           1306
    ##  4  2013     1     4     1829           1615       134     1937           1721
    ##  5  2013     1     4     2128           2129        -1     2218           2224
    ##  6  2013     1     5     1155           1200        -5     1241           1306
    ##  7  2013     1     6     2125           2129        -4     2224           2224
    ##  8  2013     1     7     2124           2129        -5     2212           2224
    ##  9  2013     1     8     2127           2130        -3     2304           2225
    ## 10  2013     1     9     2126           2129        -3     2217           2224
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## **PARTE 3: dplyr - select**

**1.** Haz una lluvia de ideas sobre tantas maneras como sea posible
para seleccionar dep_time, dep_delay, arr_time, and arr_delay de
flights.

MÉTODO 1:

``` r
flights %>%
  select(dep_time, dep_delay, arr_time, arr_delay)
```

    ## # A tibble: 336,776 x 4
    ##    dep_time dep_delay arr_time arr_delay
    ##       <int>     <dbl>    <int>     <dbl>
    ##  1      517         2      830        11
    ##  2      533         4      850        20
    ##  3      542         2      923        33
    ##  4      544        -1     1004       -18
    ##  5      554        -6      812       -25
    ##  6      554        -4      740        12
    ##  7      555        -5      913        19
    ##  8      557        -3      709       -14
    ##  9      557        -3      838        -8
    ## 10      558        -2      753         8
    ## # ... with 336,766 more rows

MÉTODO 2:

``` r
flights %>%
  select(starts_with('dep') | starts_with('arr'))
```

    ## # A tibble: 336,776 x 4
    ##    dep_time dep_delay arr_time arr_delay
    ##       <int>     <dbl>    <int>     <dbl>
    ##  1      517         2      830        11
    ##  2      533         4      850        20
    ##  3      542         2      923        33
    ##  4      544        -1     1004       -18
    ##  5      554        -6      812       -25
    ##  6      554        -4      740        12
    ##  7      555        -5      913        19
    ##  8      557        -3      709       -14
    ##  9      557        -3      838        -8
    ## 10      558        -2      753         8
    ## # ... with 336,766 more rows

MÉTODO 3:

``` r
flights %>%
  select(ends_with('delay') | (ends_with('time') & (starts_with('arr') | starts_with('dep'))))
```

    ## # A tibble: 336,776 x 4
    ##    dep_delay arr_delay dep_time arr_time
    ##        <dbl>     <dbl>    <int>    <int>
    ##  1         2        11      517      830
    ##  2         4        20      533      850
    ##  3         2        33      542      923
    ##  4        -1       -18      544     1004
    ##  5        -6       -25      554      812
    ##  6        -4        12      554      740
    ##  7        -5        19      555      913
    ##  8        -3       -14      557      709
    ##  9        -3        -8      557      838
    ## 10        -2         8      558      753
    ## # ... with 336,766 more rows

**2.** ¿Qué sucede si incluyes el nombre de una variable varias veces en
una llamada a select()?

``` r
flights %>%
  select(air_time, air_time, air_time)
```

    ## # A tibble: 336,776 x 1
    ##    air_time
    ##       <dbl>
    ##  1      227
    ##  2      227
    ##  3      160
    ##  4      183
    ##  5      116
    ##  6      150
    ##  7      158
    ##  8       53
    ##  9      140
    ## 10      138
    ## # ... with 336,766 more rows

Sucede que select solo muestra una vez la columna de la variable.

**3.** ¿Qué hace la función any_of()? ¡¿Por qué podría ser útil en
conjunto con este vector?

``` r
vector <- c('dep_delay', 'arr_delay', 'arr_time', 'dep_time')
flights%>%
  select(any_of(vector))
```

    ## # A tibble: 336,776 x 4
    ##    dep_delay arr_delay arr_time dep_time
    ##        <dbl>     <dbl>    <int>    <int>
    ##  1         2        11      830      517
    ##  2         4        20      850      533
    ##  3         2        33      923      542
    ##  4        -1       -18     1004      544
    ##  5        -6       -25      812      554
    ##  6        -4        12      740      554
    ##  7        -5        19      913      555
    ##  8        -3       -14      709      557
    ##  9        -3        -8      838      557
    ## 10        -2         8      753      558
    ## # ... with 336,766 more rows

La función any_of() combinado con select va escoger los elementos que
están de un vector para mostrarlos.

## **PARTE 4: dplyr - mutate**

**1.** Las variables horario_salida y salida_programada tienen un
formato conveniente para leer, pero es difícil realizar cualquier
cálculo con ellas porque no son realmente números continuos.
Transfórmalas hacia un formato más conveniente como número de minutos
desde la medianoche.

``` r
flights %>%
  mutate(dep_time,horario_salida=(dep_time%/%100*60+dep_time%%100)%%1440) %>%
  mutate(sched_dep_time,salida_programada=(sched_dep_time%/%100*60+sched_dep_time%%100)%%1440)
```

    ## # A tibble: 336,776 x 21
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 13 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   horario_salida <dbl>, salida_programada <dbl>

**2.** Compara tiempo_vuelo con horario_llegada - horario_salida. ¿Qué
esperas ver? ¿Qué ves? ¿Qué necesitas hacer para arreglarlo?

Se esperaría que si restamos el horario de llegada y el horario de
salida (ambos en minutos después de medianoche) sea igual a air_time

``` r
flights %>%
  mutate(dep_time, horario_salida=(dep_time%/%100*60+dep_time%%100)%%1440) %>%
  mutate(arr_time, horario_llegada=(arr_time%/%100*60+arr_time%%100)%%1440) %>%
  filter(horario_llegada - horario_salida == air_time)
```

    ## # A tibble: 196 x 21
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     7     1150           1200       -10     1341           1330
    ##  2  2013     1    13     1947           1815        92     2218           2032
    ##  3  2013     1    16      651            600        51      914            730
    ##  4  2013     1    16      707            705         2     1106           1015
    ##  5  2013     1    16      943            945        -2     1211           1135
    ##  6  2013     1    25     1619           1620        -1     1826           1750
    ##  7  2013     1    30     1016           1010         6     1234           1140
    ##  8  2013     1    30     1419           1420        -1     1614           1550
    ##  9  2013     1    30     2155           2100        55     2347           2220
    ## 10  2013    10     2     1853           1750        63     2045           1929
    ## # ... with 186 more rows, and 13 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   horario_salida <dbl>, horario_llegada <dbl>

Se visualiza que no se cumple en todos los casos con un filter. Esto lo
arreglaremos mediante el uso de mutate:

``` r
flights %>%
  mutate(dep_time, horario_salida=(dep_time%/%100*60+dep_time%%100)%%1440) %>%
  mutate(arr_time, horario_llegada=(arr_time%/%100*60+arr_time%%100)%%1440) %>%
  mutate(air_time, tiempo_vuelo=horario_llegada - horario_salida) %>%
  select(horario_salida, horario_llegada, tiempo_vuelo)
```

    ## # A tibble: 336,776 x 3
    ##    horario_salida horario_llegada tiempo_vuelo
    ##             <dbl>           <dbl>        <dbl>
    ##  1            317             510          193
    ##  2            333             530          197
    ##  3            342             563          221
    ##  4            344             604          260
    ##  5            354             492          138
    ##  6            354             460          106
    ##  7            355             553          198
    ##  8            357             429           72
    ##  9            357             518          161
    ## 10            358             473          115
    ## # ... with 336,766 more rows

**3.** Compara horario_salida, salida_programada, y atraso_salida. ¿Cómo
esperarías que esos tres números estén relacionados?

Se esperaría que el horario_salida sea igual a la salida_programada
sumada con el dep_delay.

``` r
flights %>%
  mutate(dep_time, horario_salida=(dep_time%/%100*60+dep_time%%100)%%1440) %>%
  mutate(sched_dep_time, salida_programada=(sched_dep_time%/%100*60+sched_dep_time%%100)%%1440) %>%
  select(horario_salida, salida_programada, dep_delay)
```

    ## # A tibble: 336,776 x 3
    ##    horario_salida salida_programada dep_delay
    ##             <dbl>             <dbl>     <dbl>
    ##  1            317               315         2
    ##  2            333               329         4
    ##  3            342               340         2
    ##  4            344               345        -1
    ##  5            354               360        -6
    ##  6            354               358        -4
    ##  7            355               360        -5
    ##  8            357               360        -3
    ##  9            357               360        -3
    ## 10            358               360        -2
    ## # ... with 336,766 more rows

**4.** Encuentra los 10 vuelos más retrasados utilizando una función de
ordenamiento. ¿Cómo quieres manejar los empates? Lee atentamente la
documentación de min_rank().

``` r
sol4=head(arrange(flights,desc(arr_delay)),10)
min_rank(sol4$arr_delay)
```

    ##  [1] 10  9  8  7  6  5  4  3  2  1

``` r
#La función min_rank hace que, en caso de empates, le asigna a los valores el puesto del más bajo del empate. Ejm: si 3 valores están empatados como 2do, se les asgina el 4 a los tres. 
```

**5.** ¿Qué devuelve 1:3 + 1:10? ¿Por qué?

``` r
sol5=1:3+1:10
```

    ## Warning in 1:3 + 1:10: longitud de objeto mayor no es múltiplo de la longitud de
    ## uno menor

``` r
sol5
```

    ##  [1]  2  4  6  5  7  9  8 10 12 11

Como los objetos no tienen el mismo número de elementos, R repite el más
pequeño vector hasta que sean del mismo tamaño. Es decir, va sumar 1 2 3
1 2 3 1 2 3 1 con 1 2 3 4 5 6 7 8 9 10.

**6.** ¿Qué funciones trigonométricas proporciona R?

Razones trigonométricas:

``` r
x=pi/4
sin(x)
```

    ## [1] 0.7071068

``` r
cos(x)
```

    ## [1] 0.7071068

``` r
tan(x)
```

    ## [1] 1

Razones trigonométricas inversas:

``` r
y=1/2
asin(y)
```

    ## [1] 0.5235988

``` r
acos(y)
```

    ## [1] 1.047198

``` r
atan(y)
```

    ## [1] 0.4636476

Las demás trigonométricas (ctgx, secx, cscx) no se encuentran como
función; sin embargo se pueden obtener mediante identidades
trigonométricas. De igual manera, en el caso de las inversas.

``` r
cscx=1/sin(x)
cscx
```

    ## [1] 1.414214

``` r
actgx=atan(1/y)
actgx
```

    ## [1] 1.107149

## **PARTE 5: dplyr - group_by & summarize**

**1.** Haz una lluvia de ideas de al menos 5 formas diferentes de
evaluar las características de un retraso típico de un grupo de vuelos.
Considera los siguientes escenarios:

-   Un vuelo llega 15 minutos antes 50% del tiempo, y 15 minutos tarde
    50% del tiempo.

15 minutos antes 50% del tiempo

``` r
sol5.1a<-filter(flights, arr_delay<15) %>%
  group_by(year, month, day) %>%
  summarise(sol5.1a=quantile(arr_delay, 0.5, na.rm=TRUE))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

``` r
sol5.1a
```

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day sol5.1a
    ##    <int> <int> <int>   <dbl>
    ##  1  2013     1     1      -4
    ##  2  2013     1     2      -4
    ##  3  2013     1     3      -7
    ##  4  2013     1     4     -12
    ##  5  2013     1     5      -9
    ##  6  2013     1     6      -6
    ##  7  2013     1     7     -12
    ##  8  2013     1     8     -10
    ##  9  2013     1     9      -8
    ## 10  2013     1    10     -13
    ## # ... with 355 more rows

15 minutos tarde 50% del tiempo

``` r
sol5.1<-filter(flights, arr_delay >15)%>%
  group_by(year, month, day)%>%
  summarise(sol5.1b=quantile(arr_delay, 0.5, na.rm=TRUE))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

``` r
sol5.1b
```

    ## Error in eval(expr, envir, enclos): objeto 'sol5.1b' no encontrado

-   Un vuelo llega siempre 10 minutos tarde.

``` r
flights %>%
  filter(arr_delay == 10)%>%
  group_by(year, month, day) 
```

    ## # A tibble: 3,373 x 19
    ## # Groups:   year, month, day [365]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      624            630        -6      840            830
    ##  2  2013     1     1      717            720        -3      850            840
    ##  3  2013     1     1      745            745         0     1135           1125
    ##  4  2013     1     1      805            805         0     1015           1005
    ##  5  2013     1     1      811            815        -4     1026           1016
    ##  6  2013     1     1      921            900        21     1237           1227
    ##  7  2013     1     1     1158           1205        -7     1530           1520
    ##  8  2013     1     1     1211           1215        -4     1423           1413
    ##  9  2013     1     1     1455           1459        -4     1655           1645
    ## 10  2013     1     1     1554           1600        -6     1830           1820
    ## # ... with 3,363 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

-   Un vuelo llega 30 minutos antes 50% del tiempo, y 30 minutos tarde
    50% del tiempo.

30 minutos antes 50% del tiempo

``` r
sol5.3a<-filter(flights, arr_delay < 30)%>%
  group_by(year, month, day)%>% 
  summarise(sol5.3a=quantile(arr_delay, 0.5, na.rm=TRUE))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

``` r
sol5.3a
```

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day sol5.3a
    ##    <int> <int> <int>   <dbl>
    ##  1  2013     1     1      -1
    ##  2  2013     1     2       0
    ##  3  2013     1     3      -2
    ##  4  2013     1     4     -10
    ##  5  2013     1     5      -8
    ##  6  2013     1     6      -4
    ##  7  2013     1     7     -11
    ##  8  2013     1     8      -9
    ##  9  2013     1     9      -7
    ## 10  2013     1    10     -12
    ## # ... with 355 more rows

30 minutos tarde 50% del tiempo

``` r
sol5.3b<-filter(flights, arr_delay > 30)%>%
  group_by(year, month, day)%>% 
  summarise(sol5.3b=quantile(arr_delay, 0.5, na.rm=TRUE))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

``` r
sol5.3b
```

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day sol5.3b
    ##    <int> <int> <int>   <dbl>
    ##  1  2013     1     1    54  
    ##  2  2013     1     2    58  
    ##  3  2013     1     3    51  
    ##  4  2013     1     4    49  
    ##  5  2013     1     5    65  
    ##  6  2013     1     6    52  
    ##  7  2013     1     7    59  
    ##  8  2013     1     8    50  
    ##  9  2013     1     9    48.5
    ## 10  2013     1    10    48  
    ## # ... with 355 more rows

-   Un vuelo llega a tiempo en el 99% de los casos. 1% de las veces
    llega 2 horas tarde. ¿Qué es más importante: retraso de la llegada o
    demora de salida?

Llega a tiempo en el 99% de los casos

``` r
sol5.4a<-filter(flights, arr_delay == 0)%>%
  group_by(year, month, day)%>%  
  summarise(sol5.4a=quantile(arr_delay, 0.99, na.rm=TRUE))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

``` r
sol5.4a
```

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day sol5.4a
    ##    <int> <int> <int>   <dbl>
    ##  1  2013     1     1       0
    ##  2  2013     1     2       0
    ##  3  2013     1     3       0
    ##  4  2013     1     4       0
    ##  5  2013     1     5       0
    ##  6  2013     1     6       0
    ##  7  2013     1     7       0
    ##  8  2013     1     8       0
    ##  9  2013     1     9       0
    ## 10  2013     1    10       0
    ## # ... with 355 more rows

Llega 2 horas tarde en el 1% de los casos

``` r
sol5.4b<-filter(flights, arr_delay == 120)%>%
  group_by(year, month, day)%>%  
  summarise(sol5.5=quantile(arr_delay, 0.01, na.rm=TRUE))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

Más importante debe ser el dep_delay pues si se demora al salir del
punto de inicio, lo más probable, es que también se demore en llegar a
su destino generando un arr_delay considerable.

**2.** Sugiere un nuevo enfoque que te dé el mismo output que
no_cancelados %>% count(destino) y no_cancelado %>% count(codigo_cola,
wt = distancia) (sin usar count()).

-   **2.1**

``` r
no_cancelados <-filter(flights, !is.na(dep_delay), !is.na(arr_delay))
no_cancelados %>% 
  count(dest)
```

    ## # A tibble: 104 x 2
    ##    dest      n
    ##    <chr> <int>
    ##  1 ABQ     254
    ##  2 ACK     264
    ##  3 ALB     418
    ##  4 ANC       8
    ##  5 ATL   16837
    ##  6 AUS    2411
    ##  7 AVL     261
    ##  8 BDL     412
    ##  9 BGR     358
    ## 10 BHM     269
    ## # ... with 94 more rows

OTRO ENFOQUE:

``` r
no_cancelados %>% 
  group_by(dest) %>%
  summarise(length(dest))
```

    ## # A tibble: 104 x 2
    ##    dest  `length(dest)`
    ##    <chr>          <int>
    ##  1 ABQ              254
    ##  2 ACK              264
    ##  3 ALB              418
    ##  4 ANC                8
    ##  5 ATL            16837
    ##  6 AUS             2411
    ##  7 AVL              261
    ##  8 BDL              412
    ##  9 BGR              358
    ## 10 BHM              269
    ## # ... with 94 more rows

\-**2.2**

``` r
no_cancelados %>% count(tailnum, wt = distance)
```

    ## # A tibble: 4,037 x 2
    ##    tailnum      n
    ##    <chr>    <dbl>
    ##  1 D942DN    3418
    ##  2 N0EGMQ  239143
    ##  3 N10156  109664
    ##  4 N102UW   25722
    ##  5 N103US   24619
    ##  6 N104UW   24616
    ##  7 N10575  139903
    ##  8 N105UW   23618
    ##  9 N107US   21677
    ## 10 N108UW   32070
    ## # ... with 4,027 more rows

OTRO ENFOQUE:

``` r
no_cancelados %>% 
  group_by(tailnum) %>%
  summarise(sum(distance))
```

    ## # A tibble: 4,037 x 2
    ##    tailnum `sum(distance)`
    ##    <chr>             <dbl>
    ##  1 D942DN             3418
    ##  2 N0EGMQ           239143
    ##  3 N10156           109664
    ##  4 N102UW            25722
    ##  5 N103US            24619
    ##  6 N104UW            24616
    ##  7 N10575           139903
    ##  8 N105UW            23618
    ##  9 N107US            21677
    ## 10 N108UW            32070
    ## # ... with 4,027 more rows

**3.** Nuestra definición de vuelos cancelados (is.na(atraso_salida) \|
is.na (atraso_llegada)) es un poco subóptima. ¿Por qué? ¿Cuál es la
columna más importante?

``` r
vuelos_cancelados<-flights %>%
  filter(is.na(dep_delay) | is.na(arr_delay))
vuelos_cancelados
```

    ## # A tibble: 9,430 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1     1525           1530        -5     1934           1805
    ##  2  2013     1     1     1528           1459        29     2002           1647
    ##  3  2013     1     1     1740           1745        -5     2158           2020
    ##  4  2013     1     1     1807           1738        29     2251           2103
    ##  5  2013     1     1     1939           1840        59       29           2151
    ##  6  2013     1     1     1952           1930        22     2358           2207
    ##  7  2013     1     1     2016           1930        46       NA           2220
    ##  8  2013     1     1       NA           1630        NA       NA           1815
    ##  9  2013     1     1       NA           1935        NA       NA           2240
    ## 10  2013     1     1       NA           1500        NA       NA           1825
    ## # ... with 9,420 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
flights %>%
  filter(is.na(dep_delay))
```

    ## # A tibble: 8,255 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1       NA           1630        NA       NA           1815
    ##  2  2013     1     1       NA           1935        NA       NA           2240
    ##  3  2013     1     1       NA           1500        NA       NA           1825
    ##  4  2013     1     1       NA            600        NA       NA            901
    ##  5  2013     1     2       NA           1540        NA       NA           1747
    ##  6  2013     1     2       NA           1620        NA       NA           1746
    ##  7  2013     1     2       NA           1355        NA       NA           1459
    ##  8  2013     1     2       NA           1420        NA       NA           1644
    ##  9  2013     1     2       NA           1321        NA       NA           1536
    ## 10  2013     1     2       NA           1545        NA       NA           1910
    ## # ... with 8,245 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
flights %>%
  filter(is.na(arr_delay))
```

    ## # A tibble: 9,430 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1     1525           1530        -5     1934           1805
    ##  2  2013     1     1     1528           1459        29     2002           1647
    ##  3  2013     1     1     1740           1745        -5     2158           2020
    ##  4  2013     1     1     1807           1738        29     2251           2103
    ##  5  2013     1     1     1939           1840        59       29           2151
    ##  6  2013     1     1     1952           1930        22     2358           2207
    ##  7  2013     1     1     2016           1930        46       NA           2220
    ##  8  2013     1     1       NA           1630        NA       NA           1815
    ##  9  2013     1     1       NA           1935        NA       NA           2240
    ## 10  2013     1     1       NA           1500        NA       NA           1825
    ## # ... with 9,420 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

La columna más importante es arr_delay y eso lo verificamos filtrando
ambas columnas por separado, y observamos que el resultado usando
únicamente arr_delay es el mismo que usando ambos.

**4.** Mira la cantidad de vuelos cancelados por día. ¿Hay un patrón?
¿La proporción de vuelos cancelados está relacionada con el retraso
promedio?

``` r
cancelados_dia <- dplyr::group_by(flights, year, month, day)
dplyr::summarise_all(cancelados_dia, funs(sum(is.na(.))))
```

    ## Warning: `funs()` was deprecated in dplyr 0.8.0.
    ## Please use a list of either functions or lambdas: 
    ## 
    ##   # Simple named list: 
    ##   list(mean = mean, median = median)
    ## 
    ##   # Auto named with `tibble::lst()`: 
    ##   tibble::lst(mean, median)
    ## 
    ##   # Using lambdas
    ##   list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.

    ## # A tibble: 365 x 19
    ## # Groups:   year, month [12]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <int>    <int>          <int>
    ##  1  2013     1     1        4              0         4        5              0
    ##  2  2013     1     2        8              0         8       10              0
    ##  3  2013     1     3       10              0        10       10              0
    ##  4  2013     1     4        6              0         6        6              0
    ##  5  2013     1     5        3              0         3        3              0
    ##  6  2013     1     6        1              0         1        1              0
    ##  7  2013     1     7        3              0         3        3              0
    ##  8  2013     1     8        4              0         4        4              0
    ##  9  2013     1     9        5              0         5        7              0
    ## 10  2013     1    10        3              0         3        3              0
    ## # ... with 355 more rows, and 11 more variables: arr_delay <int>,
    ## #   carrier <int>, flight <int>, tailnum <int>, origin <int>, dest <int>,
    ## #   air_time <int>, distance <int>, hour <int>, minute <int>, time_hour <int>

En particular, no se encuentra ninguna relación entre los vuelos
cancelados y el delay promedio.

**5.** ¿Qué compañía tiene los peores retrasos? Desafío: ¿puedes
desenredar el efecto de malos aeropuertos vs. el efecto de malas
aerolíneas? ¿Por qué o por qué no?

``` r
flights %>%
  arrange(arr_delay) %>%
  group_by(arr_delay, carrier, dest)%>%
  summarise()
```

    ## `summarise()` has grouped output by 'arr_delay', 'carrier'. You can override using the `.groups` argument.

    ## # A tibble: 39,730 x 3
    ## # Groups:   arr_delay, carrier [4,683]
    ##    arr_delay carrier dest 
    ##        <dbl> <chr>   <chr>
    ##  1       -86 VX      SFO  
    ##  2       -79 VX      SFO  
    ##  3       -75 AA      SEA  
    ##  4       -75 UA      LAX  
    ##  5       -74 AS      SEA  
    ##  6       -73 UA      SFO  
    ##  7       -71 B6      LAX  
    ##  8       -71 DL      PDX  
    ##  9       -71 UA      SFO  
    ## 10       -70 B6      LGB  
    ## # ... with 39,720 more rows

**6.** ¿Qué hace el argumento sort a count(). ¿Cuándo podrías usarlo?

``` r
flights %>%
  count(month, sort=TRUE)
```

    ## # A tibble: 12 x 2
    ##    month     n
    ##    <int> <int>
    ##  1     7 29425
    ##  2     8 29327
    ##  3    10 28889
    ##  4     3 28834
    ##  5     5 28796
    ##  6     4 28330
    ##  7     6 28243
    ##  8    12 28135
    ##  9     9 27574
    ## 10    11 27268
    ## 11     1 27004
    ## 12     2 24951

``` r
#Sort sirve para poner de forma descendente deste la variable que tiene mayor cantidad de datos contados hasta la que tiene menor. 
#En este ejemplo, se utilizó para saber qué mes salieron más vuelos.
```

## **PARTE 6: dplyr - transformaciones agrupadas**

**1.** Remítete a las listas de funciones útiles de mutación y filtrado.
Describe cómo cambia cada operación cuando las combinas con la
agrupación.

FILTER: sirve para seleccionar o filtrar datos de un dataframe o un
tibble que cumplan con las condiciones lógicas dadas.

``` r
dplyr::filter(flights, month == 12 & day == 25)
```

    ## # A tibble: 719 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013    12    25      456            500        -4      649            651
    ##  2  2013    12    25      524            515         9      805            814
    ##  3  2013    12    25      542            540         2      832            850
    ##  4  2013    12    25      546            550        -4     1022           1027
    ##  5  2013    12    25      556            600        -4      730            745
    ##  6  2013    12    25      557            600        -3      743            752
    ##  7  2013    12    25      557            600        -3      818            831
    ##  8  2013    12    25      559            600        -1      855            856
    ##  9  2013    12    25      559            600        -1      849            855
    ## 10  2013    12    25      600            600         0      850            846
    ## # ... with 709 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
dplyr::group_by(flights, carrier) %>% 
  filter(month == 12 & day == 25)
```

    ## # A tibble: 719 x 19
    ## # Groups:   carrier [14]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013    12    25      456            500        -4      649            651
    ##  2  2013    12    25      524            515         9      805            814
    ##  3  2013    12    25      542            540         2      832            850
    ##  4  2013    12    25      546            550        -4     1022           1027
    ##  5  2013    12    25      556            600        -4      730            745
    ##  6  2013    12    25      557            600        -3      743            752
    ##  7  2013    12    25      557            600        -3      818            831
    ##  8  2013    12    25      559            600        -1      855            856
    ##  9  2013    12    25      559            600        -1      849            855
    ## 10  2013    12    25      600            600         0      850            846
    ## # ... with 709 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

MUTATE: sirve para crear una nueva columna en un dataframe o un tibble
con datos de las columnas preexistentes.

``` r
dplyr::mutate(flights, total_delay = dep_delay + arr_delay)
```

    ## # A tibble: 336,776 x 20
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   total_delay <dbl>

``` r
dplyr::group_by(flights, carrier) %>% 
  mutate(total_delay = dep_delay + arr_delay)
```

    ## # A tibble: 336,776 x 20
    ## # Groups:   carrier [16]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   total_delay <dbl>

**2.** ¿Qué avión (codigo_cola) tiene el peor registro de tiempo?

``` r
sol6.2=no_cancelados %>%
  count(tailnum,wt=air_time)
arrange(sol6.2,n)
```

    ## # A tibble: 4,037 x 2
    ##    tailnum     n
    ##    <chr>   <dbl>
    ##  1 N505SW     43
    ##  2 N746SK     50
    ##  3 N824AS     53
    ##  4 N881AS     57
    ##  5 N766SK     60
    ##  6 N701SK     64
    ##  7 N760SK     64
    ##  8 N795SK     66
    ##  9 N726SK     67
    ## 10 N772SK     67
    ## # ... with 4,027 more rows

**3.** ¿A qué hora del día deberías volar si quieres evitar lo más
posible los retrasos?

``` r
sol6.3=no_cancelados%>%
  select(hour, minute, dep_delay, arr_delay) %>%
  filter(arr_delay<0 & dep_delay<0)
arrange(sol6.3,hour,minute)
```

    ## # A tibble: 144,346 x 4
    ##     hour minute dep_delay arr_delay
    ##    <dbl>  <dbl>     <dbl>     <dbl>
    ##  1     5      0        -4       -19
    ##  2     5      0        -2       -10
    ##  3     5      0        -6       -11
    ##  4     5      0        -6       -23
    ##  5     5      0        -3        -1
    ##  6     5      0       -10       -14
    ##  7     5      0        -7        -5
    ##  8     5      0        -7        -8
    ##  9     5      0        -7        -3
    ## 10     5      0        -7       -12
    ## # ... with 144,336 more rows

**4.** Para cada destino, calcula los minutos totales de demora. Para
cada vuelo, calcula la proporción de la demora total para su destino.

``` r
delay=flights %>%
  group_by(dest)
summarise(delay, delay_min = sum(arr_delay, na.rm = TRUE))
```

    ## # A tibble: 105 x 2
    ##    dest  delay_min
    ##    <chr>     <dbl>
    ##  1 ABQ        1113
    ##  2 ACK        1281
    ##  3 ALB        6018
    ##  4 ANC         -20
    ##  5 ATL      190260
    ##  6 AUS       14514
    ##  7 AVL        2089
    ##  8 BDL        2904
    ##  9 BGR        2874
    ## 10 BHM        4540
    ## # ... with 95 more rows

``` r
ratio=flights %>%
  group_by(dest)
summarise(ratio, delay_min = mean(arr_delay, na.rm = TRUE))
```

    ## # A tibble: 105 x 2
    ##    dest  delay_min
    ##    <chr>     <dbl>
    ##  1 ABQ        4.38
    ##  2 ACK        4.85
    ##  3 ALB       14.4 
    ##  4 ANC       -2.5 
    ##  5 ATL       11.3 
    ##  6 AUS        6.02
    ##  7 AVL        8.00
    ##  8 BDL        7.05
    ##  9 BGR        8.03
    ## 10 BHM       16.9 
    ## # ... with 95 more rows

**5.** Los retrasos suelen estar temporalmente correlacionados: incluso
una vez que el problema que causó el retraso inicial se ha resuelto, los
vuelos posteriores se retrasan para permitir que salgan los vuelos
anteriores. Usando lag(), explora cómo el retraso de un vuelo está
relacionado con el retraso del vuelo inmediatamente anterior.

``` r
sol6.5=lag(flights$arr_time, n = 1L, default = NA, order_by = NULL)
head(sol6.5)
```

    ## [1]   NA  830  850  923 1004  812

En los argumentos de la fucion lag están:

-   n es el número entero positivo 1 que indica el número de posiciones
    ya sea de adelanto o atraso por defecto.

-   default que es el valor que se le da a las columnas en las que no
    existen datos (por defecto es NA).

-   order_by es el condicional que permite anular para usar otra
    columna.

**6.** Mira cada destino. ¿Puedes encontrar vuelos sospechosamente
rápidos? (es decir, vuelos que representan un posible error de entrada
de datos). Calcula el tiempo en el aire de un vuelo relativo al vuelo
más corto a ese destino. ¿Cuáles vuelos se retrasaron más en el aire?

``` r
sol6.6 = flights %>%
  filter(air_time < 30) %>%
  arrange(desc(air_time))
head(sol6.6)
```

    ## # A tibble: 6 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013     1     2     1606           1610        -4     1730           1729
    ## 2  2013     1     2     2125           2110        15     2221           2212
    ## 3  2013     1     3      912            919        -7     1011           1030
    ## 4  2013     1     4     1349           1300        49     1458           1406
    ## 5  2013     1     5      600            600         0      644            659
    ## 6  2013     1     5     1155           1200        -5     1241           1306
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

**7.** Encuentra todos los destinos que son volados por al menos dos
operadores. Usa esta información para clasificar a las aerolíneas.

``` r
sol6.7<-flights %>%
  select(carrier, dest) %>%
  count(dest, carrier) %>%
  group_by(dest) %>%
  filter(rank(desc(carrier)) > 2)
unique(sol6.7$dest)
```

    ##  [1] "ATL" "AUS" "BNA" "BOS" "BTV" "BUF" "BWI" "CHS" "CLE" "CLT" "CMH" "CVG"
    ## [13] "DCA" "DEN" "DFW" "DTW" "FLL" "IAD" "IND" "JAX" "LAS" "LAX" "MCI" "MCO"
    ## [25] "MEM" "MIA" "MKE" "MSP" "MSY" "OMA" "ORD" "ORF" "PBI" "PDX" "PHL" "PHX"
    ## [37] "PIT" "PWM" "RDU" "ROC" "RSW" "SAN" "SAT" "SDF" "SEA" "SFO" "SJU" "SRQ"
    ## [49] "STL" "STT" "SYR" "TPA"

**8.** Para cada avión, cuenta el número de vuelos antes del primer
retraso de más de 1 hora.

``` r
sol6.8=flights%>%
  select(dep_delay, tailnum) %>%
  count(tailnum, dep_delay) %>%
  group_by(tailnum) %>%
  filter(dep_delay < 60) %>%
  summarise(sum(n))
sol6.8
```

    ## # A tibble: 4,009 x 2
    ##    tailnum `sum(n)`
    ##    <chr>      <int>
    ##  1 D942DN         3
    ##  2 N0EGMQ       331
    ##  3 N10156       129
    ##  4 N102UW        46
    ##  5 N103US        46
    ##  6 N104UW        43
    ##  7 N10575       228
    ##  8 N105UW        44
    ##  9 N107US        40
    ## 10 N108UW        58
    ## # ... with 3,999 more rows
