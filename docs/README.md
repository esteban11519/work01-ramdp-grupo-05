## GRUPO DE TRABAJO 05

### INTEGRANTES DEL GRUPO
#### Jhohan David Contreras Aragón		1007687796
#### Andrés Felipe Medina Medina 		1015464557
#### Mitchell Elizabeth Rodríguez Barreto	1032503089


### Pregunta 1:
¿Definir cuál es el tamaño máximo de buffer de memoria que puede crear?, se recomienda leer las especificaciones de la FPGA que está usando cada grupo. La respuesta se debe dar en bytes.

Para determinar el tamaño máximo del buffer de memoria que se puede crear con la FPGA, en este caso la Nexys 4 DDr, primero se revisó el datasheet encontrando que el valor de bloque de memoria RAM en la FPGA es de 4.860.000 bits.

Para calcular el número de bits que va a ocupar la memoria se debe tener en cuenta el tamaño de la imagen en pixeles y, además, que cada pixel está compuesto de 2 bytes, es decir, 16 bits. Por lo tanto:

![Dimensiones de la memoria RAM](./figs/tamRam.png)
![4cm Dimensiones de la memoria RAM]


*Para una imagen de 640 x 480 pixeles
El número de posiciones en una memoria está dado por 2^n, en éste caso, debe ser mayor o igual a 640 x 480 = 307.200. Para hallar el valor de _n_ se halla el logaritmo en base 2 de 307.200 y se redondear al entero mayor más cercano. 

log_2⁡〖(307.200)=18,23〗≈19
n=19

![Logaritmo1](./figs/formulaUno.png)

El tamaño en bits de la memoria RAM sería el número de posiciones por el ancho del registro:

2^19  × 16 = 8.388.608 bits

![Logaritmo1](./figs/formulaDos.png)


Como se puede observar el número de bits sobrepasa el permitido por la tarjeta. 
8.388.608 > 4.860.000

*Para una imagen de 320 x 240 pixeles
Número de posiciones ≥ 320 x 240 = 76.800

log_2(76.800) = 16,23 ≈ 17
n = 17

2^17 x 16 = 2.097.152 bits

Como se puede observar el tamaño en bits de la memoria RAM para una imagen de 320 x 240 pixeles ocuparía el 43,15 % de la memoria disponible en la FPGA, por lo tanto, se usará este tamaño. El tamaño en bytes sería de 262.144.

2.097.152 bits / 8 = 262.144 bytes






3. Los registros a editar son:

* Reestablecer todos los registros

Pin F2 RESET#: Limpiar todos los registros

0: Reset mode

* Habilitar el escalado

0D -> COM4

Bit[3:0] Reserved

Bit[5:4] 01: 1/2 window

Bit[7:6] Reserved

Página 12

* Configurar el formato y el tamaño del pixel:

40 -> COM15

Bit[3:0] Reserved

Bit[5:4] 01: RGB 565

Bit[7:6] 11: Output range: [00] to [FF]

Página 18

* Habilitar el test de barra de colores:

42 -> COM17

Bit[2:0] Reserved

Bit[3] 1: Enable

Bit[5:4] Reserved

Bit[7:6] 01: 1/2 same value as COM4

Página 19
