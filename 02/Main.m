% Carga Mediciones de la primera parte al workspace
run("../01/Main")

% Truncado de las referencias
M01.u = M01.u(1:1400);
M02.u = M02.u(1:2000);
M03.u = M03.u(1:2240);
M04.u = M04.u(1:1400);

param = [solver(M01) solver(M02)  ...
    solver(M03) solver(M04)]
