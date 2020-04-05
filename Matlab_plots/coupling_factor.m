kb = 1.38e-23; % m^2*kg/(s^2*K)
Tl = 300; % K
hbar = 1.054e-34; % J/s
d = [200 300 400 500 600 700 800 900 1000 5000 15000]*1e-9; 
debye_temp= 359; % K
t = 19e-9; %thickness, m
axy = 0.3*363e-12+0.7*250e-12;
az = (10*(axy)+6*392e-12+3*330e-12)*1e-9/t
n=1.67e29; % density of electrons

G=zeros(length(d));
for m=1:length(d)
    G(m) = 9/8*kb^2*debye_temp/(hbar*Tl*d(m))*(n^2/(3*pi^2))^(1/3)   
end

plot(d,G);xlabel('diameter');ylabel('G')


