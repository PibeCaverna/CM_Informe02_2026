function [dx] = finitopromedio(x,t)
% Retorna la derivada de un vector x mediante
% el promedio de las diferenciaciones finita 
% ascendente y finita descendiente, reduciendo
% cuadraticamente el error de aproximacion

dx = (finitoascendente(x,t)+finitodescendente(x,t))/2;

end