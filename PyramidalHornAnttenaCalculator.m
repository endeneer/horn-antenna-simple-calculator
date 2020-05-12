% Your Specifications
GdB = 20;
G = 10^(GdB/10);
freq = 4.9*10^(9);
lambda = 299792458/freq;

% a_s and b_s in the video is same as a and b respectively.
a = 47.5488*10^(-3);
b = 22.1488*10^(-3);

% Pyramidal Horn Design Equation
epsilon_ap = 0.51;
A = roots([1 -a 0 3*b*G*lambda^2/(8*pi*epsilon_ap) -3*G^2*lambda^4/(32*pi^2*epsilon_ap^2)])
% Then choose non-negative A, e.g. A(1) or A(4) etc.
A = A(1)
% To approximate A,
% A = 0.45*lambda*G^(1/2)
B = G*lambda^2/(0.51*4*pi*A)

% Solving RE and RH,
% If RE != RH then use another a and b by trial and error until RE=RH.
% Or you work backward from here to obtain a and b
R1 = A^2/(3*lambda);
RH=R1*(A-a)/A
R2=B^2/(2*lambda);
RE=R2*(B-b)/B