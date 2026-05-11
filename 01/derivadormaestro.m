function Mxx = derivadormaestro(Mxx)
% obtiene velocidad y aceleracion de la barra y el
% disco de inercia, mediante el promedio de las 
% diferencias finita ascendente y descendiente

% definicion de un filtro butterworth
filtro.fs = 1/mean(diff(Mxx.ts));
filtro.fc = .1;
filtro.orden = 2;
[b, a] = butter(filtro.orden,filtro.fc);

Mxx.v1 = finitopromedio(Mxx.tita1,Mxx.ts);
Mxx.v1 = filtfilt(b,        a,    Mxx.v1);

Mxx.v2 = finitopromedio(Mxx.tita1,Mxx.ts);
Mxx.v2 = filtfilt(b,        a,    Mxx.v2);

Mxx.a1 = finitopromedio(Mxx.v1,   Mxx.ts);
Mxx.a1 = filtfilt(b,       a,    Mxx.a1);

Mxx.a2 = finitopromedio(Mxx.v1,   Mxx.ts);
Mxx.a2 = filtfilt(b,    a,    Mxx.a2);

end