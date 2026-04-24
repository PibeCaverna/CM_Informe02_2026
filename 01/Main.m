%% Primera Parte, Estimado de velocidades y aceleraciones
% 1_ Carga de datos
M01 = cargamediciones("../m01/");
M02 = cargamediciones("../m02/");
M03 = cargamediciones("../m03/");
M04 = cargamediciones("../m04/");
% 2_ Filtrado
% definicion de un filtro butterworth
filtro.fs = 1/mean(diff(M01.ts));
filtro.fc = 10;
filtro.orden = 20;
[filtro.b, filtro.a] = butter(filtro.orden, ...
    filtro.fc/(filtro.fs/2),"low");
% 3_ Aproximacion de valores
M01 = derivadormaestro(M01,filtro);
M02 = derivadormaestro(M02,filtro);
M03 = derivadormaestro(M03,filtro);
M04 = derivadormaestro(M04,filtro);
