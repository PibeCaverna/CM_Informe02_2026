# Control Moderno: Segundo Informe 2026
Modelo de ecuaciones de estados en identificación de parámetros  
Se establece la entrega en tres partes:  
- [x] Primera Parte *260428*  
- [x] Segunda Parte *260507*  
- [x] Tercera Parte *260521*  

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

### Obtencion de representacion en variables de estado
Partiendo de las ecuaciones diferenciales del informe 1:

$$
\begin{cases}
  (I_1+m_1 c^2 + m_2 L^2 +I_2)\ddot\theta_1 + I_2 
  \ddot{\theta}_2+g(m_1c+m_2L)\sin\theta_1 = 0 \\
  I_2(\ddot{\theta}_1 + \ddot\theta_2) = 
  \frac{Nk_T}{R}V_i-\frac{N^2k_Tk_f}{R}\dot\theta_2
\end{cases}
$$

Se pueden identificar a las variables de estado como:

$$
\begin{cases}
  x_1 = \theta_1 \\
  x_2 = \dot x_1 = \dot\theta_1\\
  x_3 = \theta_2 \\
  x_4 = \dot x_3 = \dot\theta_2\\
\end{cases}
$$

Luego, de resolver el sistema de ecuaciones para $\dot x_2$
y $\dot x_3$:

$$
\begin{cases}
\dot x_1 = x_2 \\
\dot x_2 = -q_1\sin x_1+q_2x_4-q_3u \\
\dot x_3 = x_4 \\
\dot x_4 = q_1\sin x_1 - (\rho+1)q_2x_4 + (\rho+1)q_3u
\end{cases}
$$

Entonces, quedaria plantear las ecuaciones:

$$
[\dot x_2] = [-\sin x_1,x_4,-u] [q1,q2,q3] \\
[\dot x_4-q_1 \sin x_1] = [-q_2x_4+q_3u] [\rho-1]
$$

Donde la implementacion del planteo del 
laboratorio 1 resulta en los valores apreciables en el archivo 
CM_IP2_Tabla_Desages_Falconieri.tex

## Tercera Parte
Para correr el testbench, primero ejecute 02/Main.m, luego abra modelo.mdl y
corra la simulación, empleando el workspace creado por el script mencionado
previamente
