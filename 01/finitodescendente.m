function [dx] = finitodescendente(x,t)
% Retorna la derivada de un vector x mediante
% diferenciacion finita descendente, se repite el
% primer valor para tener vectores del mismo largo
% en la entrada y la salida.
T = mean(diff(t));
dx = diff(x);
dx = [dx(1);dx];
end