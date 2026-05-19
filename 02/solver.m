function [param] = solver(Mxx)
% Resuelve los parametros de la representacion
% en variables de estado, usando los valores
% provistos en la muestra Mxx

x1  = Mxx.tita1;
x2p = Mxx.a1;
x4  = Mxx.v2;
x4p = Mxx.a2;
u   = Mxx.u;

% Calculamos q1, q2 y q3 con SVD
A1 = [-sin(x1) x4 -u];
y = x2p;

%[U1 S1 V1]= svd(A1,0);
%q = V1*inv(S1)*U1'*y;
%q  = A1 \ x2p;
q = pinv(A1)*x2p
% Calculamos rho
A2 = [-q(2)*x4+q(3)*u];
z = [x4p-q(1)*sin(x1)];

%[U2 S2 V2] = svd(A2,0);
%rho = V2*inv(S2)*U2'*z;
%rho = A2 \ z;
rho = pinv(A2)*z
param = [q;rho-1];
end