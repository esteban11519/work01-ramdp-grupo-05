## GRUPO DE TRABAJO 05
#### JHOHAN DAVID CONTRERAS ARAGÓN 1007687796
#### ANDRÉS FELIPE MEDINA MEDINA 1015464557
#### MITCHELL ELIZABETH RODRÍGUEZ BARRETO 1032503089




## RESPUESTA
1. Para determinar el tamaño máximo del Buffer de memoria que se puede crear con la FPGA en este caso la Nexys 4ddr utilizada por el grupo de trabajo se reviso el datasheet de esta misma encontrando que el valor es de 4860000 bits

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
