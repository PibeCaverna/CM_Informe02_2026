function Mxx = derivadormaestro(Mxx,f)
% obtiene velocidad y aceleracion de la barra y el
% disco de inercia, mediante el promedio de las 
% diferencias finita ascendente y descendiente
Mxx.tita1 = filtfilt(f.b,f.a,Mxx.tita1);
Mxx.tita2 = filtfilt(f.b,f.a,Mxx.tita2);

Mxx.v1 = finitopromedio(Mxx.tita1,Mxx.ts);
Mxx.v1 = filtfilt(f.b,    f.a,    Mxx.v1);
Mxx.v2 = finitopromedio(Mxx.tita1,Mxx.ts);
Mxx.v2 = filtfilt(f.b,    f.a,    Mxx.v2);

Mxx.a1 = finitopromedio(Mxx.v1,   Mxx.ts);
Mxx.a1 = filtfilt(f.b,    f.a,    Mxx.a1);
Mxx.a2 = finitopromedio(Mxx.v1,   Mxx.ts);
Mxx.a2 = filtfilt(f.b,    f.a,    Mxx.a2);

end