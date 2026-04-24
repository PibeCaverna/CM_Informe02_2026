function [dx] = finitoascendente(x,t)
% Retorna la derivada de un vector x mediante
% diferenciacion finita ascendente, se repite el
% ultimo valor para tener vectores del mismo largo
% en la entrada y la salida.
T = mean(diff(t));
dx = diff(x)/T;
dx = [dx;dx(end)];
end