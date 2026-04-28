function export(Mxx,dir)
%EXPORT Summary of this function goes here
%   Detailed explanation goes here
tita1 = Mxx.tita1;
tita2 = Mxx.tita2;
ts = Mxx.ts;
u = Mxx.u;
v1 = Mxx.v1;
v2 = Mxx.v2;
a1 = Mxx.a1;
a2 = Mxx.a2;

save(strcat(dir,"tita1.dat"),"tita1","-ascii");
save(strcat(dir,"tita2.dat"),"tita2","-ascii");
save(strcat(dir,"tiempo.dat"),"ts","-ascii");
save(strcat(dir,"control.dat"),"u","-ascii");
save(strcat(dir,"velocidad1.dat"),"v1","-ascii");
save(strcat(dir,"velocidad2.dat"),"v2","-ascii");
save(strcat(dir,"aceleracion1.dat"),"a1","-ascii");
save(strcat(dir,"aceleracion2.dat"),"a2","-ascii");
end