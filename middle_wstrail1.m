
clc;
clear all;
close all;

L(1) = Link([pi/3  0 51.45  0],'standard');
L(2) = Link([pi/3  0 28.04  0],'standard');
L(3) = Link([pi/3  0 18.87  0],'standard');

Robot = SerialLink(L);

conv = pi/180;
i = 0;
for q1 = -185*conv:10*conv:185*conv
    for q2 = -140*conv:10*conv:-5*conv
        for q3 = 0*conv:10*conv:155*conv
            T01 = trotz(q1)*transl(51.45,pi/3,0)*trotx(0);
            T12 = trotz(q2)*transl(28.04,pi/3,0);
            T23 = trotz(q3)*transl(18.87,pi/3,0);
            T03 = T01*T12*T23;
            i = i+1;
            p = T03(1:3,4);
            p1(i) = p(1);
            p2(i) = p(2);
            p3(i) = p(3);
        end
    end
end   
figure(2)
plot((p2.^2+p1.^2).^0.5,p3,'b.');
xlabel('x')
ylabel('z')

figure(3)
plot((p1.^2+p3.^2).^0.5,p2,'b.');
xlabel('x')
ylabel('y')