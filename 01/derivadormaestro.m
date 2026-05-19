function Mxx = derivadormaestro(Mxx)
% obtiene velocidad y aceleracion de la barra y el
% disco de inercia, mediante el promedio de las 
% diferencias finita ascendente y descendiente

% definicion de un filtro butterworth
filtmult = 8;
T       = mean(diff(Mxx.ts));
Fs      = 1 / T;
N       = length(Mxx.tita1);

% FFT solo de la mitad positiva del espectro
X1_full = fft(Mxx.tita1);
X2_full = fft(Mxx.tita2);
X1_half = abs(X1_full(1:floor(N/2)));
X2_half = abs(X2_full(1:floor(N/2)));

% Índice del bin dominante (en la mitad positiva)
[~, idx1] = max(X1_half);
[~, idx2] = max(X2_half);

% Conversión de bin a frecuencia en Hz
f_hz1 = (idx1 - 1) * Fs / N;
f_hz2 = (idx2 - 1) * Fs / N;

% Frecuencia de corte: la más alta de las dos, multiplicada por filtmult
fc = max([f_hz1, f_hz2]) * filtmult;

% Normalización correcta para butter: dividir por Nyquist (Fs/2)
Wn = fc / (Fs / 2);
Wn = min(Wn, 0.99);   % Clamp: butter requiere Wn < 1

% Filtro Butterworth pasa-bajos de orden 2
[b, a] = butter(2, Wn);

% Aplicar filtro (si es necesario)
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