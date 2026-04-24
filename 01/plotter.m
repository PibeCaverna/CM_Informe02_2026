function plotter(Mxx,Nombre)
% Genera figuras de los datos relevantes del sistema

figure("Name",Nombre);
subplot(1,2,1);
plot(Mxx.ts,Mxx.tita1,Mxx.ts,Mxx.v1,Mxx.ts,Mxx.a1);
legend("$\theta_1$","$\dot\theta_1$","$\ddot\theta_1$", ...
    "interpreter","latex")
subplot(1,2,2);
plot(Mxx.ts,Mxx.v2,Mxx.ts,Mxx.a2);
legend("$\dot\theta_2$","$\ddot\theta_2$", ...
    "interpreter","latex")

end