# Control Moderno: Segundo Informe 2026
Modelo de ecuaciones de estados en identificación de parámetros  
Se establece la entrega en tres partes:  
- [ ] Primera Parte *260428*  
- [ ] Segunda Parte *260507*  
- [ ] Tercera Parte *260521*  

## Primera Parte
Estimación de las velocidades y aceleraciones a partir de mediciones.  
Las mediciones se cargan en estructuras denominadas Mxx, donde cada
campo es:
- **tita1** el ángulo del sistema
- **tita2** el ángulo del motor, a partir del cual se obtiene su velocidad
- **ts** el tiempo en el cual se tomó cada muestra
- **u** el valor de referencia utilizado
Se implementa un filtro de butterworth para suavizar las señales, el
filtrado se realiza en la diferenciación con el siguiente orden:
1. Se filtran los titas
2. Se calculan las velocidades
3. Se filtran las velocidades
4. Se calculan las aceleraciones
5. Se filtran las aceleraciones

## Segunda Parte

## Tercera Parte
