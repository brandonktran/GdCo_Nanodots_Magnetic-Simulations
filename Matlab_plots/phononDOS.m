%Calculates the phonon density of states based on the patterned dot
%dimensions

%Abmient parameters
kb = 8.6173303e-5; %Boltzmann constant eV/K
T = 300; %Assumed temperature, K

hbar = 6.582119514e-16; %reduced planck's constant, eV*s
cs_eff = 3583.16; %effect speed of sound in stack, m/s
E = linspace(0,2,1000); %energies, eV
d = [15000 5000 500 400 300 200]*1e-9; %dot diameters,m
t = 19e-9; %thickness, m

DOS=zeros(length(d),length(E));
for m=1:length(d)
    DOS(m,:) = 3/2*(d(m)^2*t)*E.^2/(pi^2*cs_eff^3*hbar^3);
%     if m==1
%         %DOS includes factor of 3 assuming longitudinal (1) and transversal
%         %(2) modes are degenerate
%         DOS(m,:) = 3/2*(d(m)^2*t)*E.^2/(pi^2*cs_eff^3*hbar^3);
%     else
%         DOS(m,:) = d(m)^2/8*t*E.^2/(pi*cs_eff^3*hbar^3); %use cylindrical volume instead of cubic
%     end
end
%figure(1)
%plot(E,DOS);xlabel('Energy (J)');ylabel('Density of States')
figure(2)%
semilogy(E,DOS,'LineWidth',1);xlabel('Energy (eV)');ylabel('Density of States');xlim([0 E(length(E))]);%xlim([0 3*kb*T]);
legend('15um','5um','500nm','400nm','300nm','200nm')


% a_GdCo=0.3*(2*363.6+278.26)/3 + 0.7*(2*250.71+406.95)/3;
% a_eff = (a_GdCo*10+392.42*3*2+330.13*3)*1e-12/19; %effective lattice constant, m
% d = [15000 5000 4000 3000 2000 1000 900 800 700 600 500 400 300 200]*1e-9; %dot diameters,m
% t = 20e-9; %thickness, m
% kz = linspace(pi/t,pi/a_eff,1000); %wavenumber in z direction, 1/m
% kxy = linspace(pi/d(1),pi/a_eff,1000); %wavenumber in x and y directions, 1/m
% k = sqrt(2*kxy.^2+kz.^2); %total wavevector, 1/m
% 
% DOS=zeros(length(d),length(kz));
% for m=1:length(d)
%     k_d_limit = sqrt(2*(pi/d(m))^2+(pi/t)^2); %lower limit of wavevector for given diameter
%     for n=1:length(k)
%         if k(n)<k_d_limit
%             DOS(m,n)=NaN;
%         else
%             DOS(m,:) = 1/(8*pi)*k(m).^2*t*d(m)^2;
%         end
%     end
% end
% figure(3)
% plot(k,DOS);xlabel('wavevector (1/m)');ylabel('Density of States')
% figure(4)
% semilogy(k,DOS);xlabel('Energy (J)');ylabel('Density of States');
% legend('15um','5um','4um','3um','2um','1um','900nm','800nm','700nm','600nm','500nm','400nm','300nm','200nm')



%% 2D DOS
DOS2D=zeros(length(d),length(E));
for m=1:length(d)
    DOS2D(m,:) = (d(m)^2)*E/(pi*cs_eff^2*hbar^2); % D(E)=A*E/(pi*cs^2*hbar^2) or D(w)=A*w/(pi*cs^2)
end
%figure(1)
%plot(E,DOS);xlabel('Energy (J)');ylabel('Density of States')
figure(3)%
semilogy(E,DOS2D,'LineWidth',1);xlabel('Energy (eV)');ylabel('Density of States 2D');xlim([0 E(length(E))]);%xlim([0 3*kb*T]);
legend('15um','5um','500nm','400nm','300nm','200nm')
