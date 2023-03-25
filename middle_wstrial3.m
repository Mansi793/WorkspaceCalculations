a1 = 51.45; 
a2 = 28.04;
a3 = 18.87;

alph1 = 0;
alph2 = 0;
alph3 = 0;

alpha1_min = -1.605;
alpha1_max = 1.5994;
alpha2_min = -0.93556;
alpha2_max = 0.94249;
alpha3_min = -0.002444;
alpha3_max = 0.24001;

theta1 = pi/3;
theta2 = pi/3;
theta3 = pi/3;

d1 = 0;
d2 = 0;
d3 = 0;

N = 20000;
t1 = alpha1_max + (alpha1_max - alpha1_min)*rand(N,1);
t2 = alpha2_max + (alpha2_max - alpha2_min)*rand(N,1);
t3 = alpha3_max + (alpha3_max - alpha3_min)*rand(N,1);

 
for i = 1:N
    A1 = TransMat(t1(i),a1, d1, alph1);
    A2 = TransMat(t2(i),a2, d2, alph2);
    A3 = TransMat(t3(i),a3, d3, alph3);
    
    T = A1 * A2 * A3;
    X=T(1,4);
    X_min = min(X);
    X_max = max(X);
    Y=T(2,4);
    Y_min = min(Y);
    Y_max = max(Y);
    Z=T(3,4);
    Z_min = min(Z);
    Z_max = max(Z);
    plot3(X,Y,Z,'.')
    hold on;
end
view(3);
title('Isometric view');
xlabel('x (mm)');
ylabel('y (mm)');
zlabel('z (mm) ');
% view(2); % top view
% title(' Top view');
% xlabel('x (mm)');
% ylabel('y (mm)');
% view([0 1 0]); % y-z plane
% title('Side view, Y-Z');
% ylabel('y (m)');
% zlabel('z (m)');
 
 
function [ T ] = TransMat(thet, a, d, alph)
T = [ cos(thet), -sin(thet)*cos(alph), sin(thet)*sin(alph), a*cos(thet);
      sin(thet), cos(thet)*cos(alph), -cos(thet)*sin(alph), a*sin(thet);
      0, sin(alph), cos(alph), d;
      0, 0, 0, 1];
end
