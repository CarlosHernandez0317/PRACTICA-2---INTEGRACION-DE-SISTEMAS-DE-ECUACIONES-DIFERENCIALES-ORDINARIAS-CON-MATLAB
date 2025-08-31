[t, x] = ode45(@Funcion_PenduloInvertido, [0 10], [0 0 0.1 0]);

% Graficas
figure;

subplot(2,1,1);
plot(t, x(:,1), 'LineWidth', 1.5); hold on;
plot(t, x(:,2), 'LineWidth', 1.5);
legend('x_c','dx_c');
xlabel('Tiempo [s]');
ylabel('Carro');
grid on; title('Dinámica del carro');

subplot(2,1,2);
plot(t, x(:,3), 'LineWidth', 1.5); hold on;
plot(t, x(:,4), 'LineWidth', 1.5);
legend('\alpha','d\alpha');
xlabel('Tiempo [s]');
ylabel('Péndulo');
grid on; title('Dinámica del péndulo');
