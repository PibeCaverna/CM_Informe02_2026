%% Primera Parte, Estimado de velocidades y aceleraciones
% 1_ Carga de datos
M01 = cargamediciones("../m01/");
M02 = cargamediciones("../m02/");
M03 = cargamediciones("../m03/");
M04 = cargamediciones("../m04/");
% 2_ Aproximacion de valores
M01 = derivadormaestro(M01);
M02 = derivadormaestro(M02);
M03 = derivadormaestro(M03);
M04 = derivadormaestro(M04);
