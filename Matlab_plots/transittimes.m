% parameters
mue = 8.5e3; %electron mobility, cm^2/V/s
muh = 400; % hole mobility, cm^2/V/s
Eapplied=1e5;% max E field, 1/4 of breakdown field, V/cm

d= 3e-4; %electrode spacing, cm

Vapplied=Eapplied*d
x=linspace(1e-7, 2*d, 1000); %depth, cm

re=mue*(1e-12)*Vapplied./x;
rh=muh*(1e-12)*Vapplied./x;

subplot (2,1,1)
plot(x,re);xlabel('distance cm');ylabel('distance traveled for electrons (cm)')

subplot (2,1,2)
plot(x,rh);xlabel('distance cm');ylabel('distance traveled for holes (cm)')

figure(2);
subplot (2,1,1)
loglog(x,re);xlabel('distance cm');ylabel('distance traveled for electrons (cm)'); 

subplot (2,1,2)
loglog(x,rh);xlabel('distance cm');ylabel('distance traveled for holes (cm)'); 

%%
figure(3);

te=(d/2)./(mue*Vapplied./x)
th=(d/2)./(muh*Vapplied./x)
subplot (2,1,1)
plot(x,te);xlabel('distance cm');ylabel('distance traveled for electrons (cm)')

subplot (2,1,2)
plot(x,th);xlabel('distance cm');ylabel('distance traveled for holes (cm)')


