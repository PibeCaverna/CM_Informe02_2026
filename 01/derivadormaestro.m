function Mxx = derivadormaestro(Mxx)
% obtiene velocidad y aceleracion de la barra y el
% disco de inercia, mediante el promedio de las 
% diferencias finita ascendente y descendiente

% definicion de un filtro butterworth
filtmult = 4;
T       = mean(diff(Mxx.ts));
Fs      = 1 / T;
N       = length(Mxx.tita1);

X1_full = fft(Mxx.tita1);
X1_half = abs(X1_full(1:floor(N/2)));

[~, idx1] = max(X1_half);

f_hz1 = (idx1 - 1) * Fs / N;

fc = f_hz1 * filtmult;

Wn = fc / (Fs / 2);

[b, a] = butter(2, Wn);

Mxx.tita1 = filtfilt(b, a, Mxx.tita1);
Mxx.tita2 = filtfilt(b, a, Mxx.tita2);

Mxx.v1 = finitopromedio(Mxx.tita1,Mxx.ts);
Mxx.v1 = filtfilt(b,        a,    Mxx.v1);

Mxx.v2 = finitopromedio(Mxx.tita2,Mxx.ts);
Mxx.v2 = filtfilt(b,        a,    Mxx.v2);

Mxx.a1 = finitopromedio(Mxx.v1,   Mxx.ts);
Mxx.a1 = filtfilt(b,         a,   Mxx.a1);

Mxx.a2 = finitopromedio(Mxx.v2,   Mxx.ts);
Mxx.a2 = filtfilt(b,         a,   Mxx.a2);

end