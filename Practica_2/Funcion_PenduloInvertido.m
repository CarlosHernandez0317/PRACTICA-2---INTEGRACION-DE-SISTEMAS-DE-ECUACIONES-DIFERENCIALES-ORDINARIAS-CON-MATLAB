function dx = Funcion_PenduloInvertido(t, x)
    % x(1) = x_c     (posición del carro)
    % x(2) = dx_c    (velocidad del carro)
    % x(3) = alpha   (ángulo del péndulo)
    % x(4) = dalpha  (velocidad angular)

    % Parámetros del sistema (valores de la tabla)
    Ip = 0.0079;
    Mc = 0.7031;
    lp = 0.3302;
    Mp = 0.23;
    Fc = 0;           
    Beq= 4.3;         
    g  = 9.81;        
    Bp = 0.0024;      

    % Estados
    xc     = x(1);
    dxc    = x(2);
    alpha  = x(3);
    dalpha = x(4);

    % Denominador común (según modelo)
    Den = (Mc+Mp)*Ip + Mc*Mp*lp^2 + Mp^2*lp^2*sin(alpha)^2;

    % Aceleración del carro (ddxc)
    ddxc = ((Ip+Mp*lp^2)*Fc + Mp^2*lp^2*g*cos(alpha)*sin(alpha) ...
           - (Ip+Mp*lp^2)*Beq*dxc - (Ip*Mp*lp - Mp^2*lp^3)*dalpha^2*sin(alpha) ...
           - Mp*lp*dalpha*cos(alpha)*Bp) / Den;

    % Aceleración angular del péndulo (ddalpha)
    ddalpha = ((Mc+Mp)*Mp*g*lp*sin(alpha) - (Mc+Mp)*Bp*dalpha ...
              + Fc*Mp*lp*cos(alpha) - Mp^2*lp^2*dalpha^2*sin(alpha)*cos(alpha) ...
              - Beq*Mp*lp*dxc*cos(alpha)) / Den;

    % Vector de salida (primer orden)
    dx = zeros(4,1);
    dx(1) = dxc;
    dx(2) = ddxc;
    dx(3) = dalpha;
    dx(4) = ddalpha;
end
