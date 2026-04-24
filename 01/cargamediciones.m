function [Mxx] = cargamediciones(dir)
% Presentamos una estructura por medicion, denominada Mxx
% Cada una posee los campos tita1, tita2, ts y u
% Los datos se cargan a partir del directorio dir provisto
% mediante el argumento

Mxx = struct;

load(strcat(dir,'tita1.dat'), "tita1");
load(strcat(dir,'tita2.dat'), "tita2");
load(strcat(dir,'ts.dat'), "ts");
load(strcat(dir,'u.dat'), "u");
Mxx.tita1 = tita1;
Mxx.tita2 = tita2;
Mxx.ts = ts;
Mxx.u = u;
end
