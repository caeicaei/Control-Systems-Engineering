%% Kreisberechnung und Kontrolle
clear all
syms phi1 phi2 x1 x2 y1 y2 r

rr(x1,x2,y1,y2,phi1,phi2)=(r*cos(phi1)+x1+r*cos(phi2)-x2)^2 ...
                         +(r*sin(phi2)-y2+r*sin(phi1)+y1)^2

assume(phi1,"positive");
assume(phi2,"positive");
assume(x1,"real");
assume(x2,"real");
assume(y1,"real");
assume(y2,"real");
%assume(r,"real")
ar(x1,x2,y1,y2,phi1,phi2)=simplify(solve(rr(x1,x2,y1,y2,phi1,phi2)==4*r^2,r,"real",true))
%-> probleme mit phi1=phi2=0,pi -> am besten Fallunterscheidung, ist ja
%einfach
% controlle
x1=2;
x2=4;
phi1=mod(4*pi/2+pi/2/10,2*pi);
phi2=mod(pi-pi/2/10,2*pi);

%bestimmer betragsmäßig kleinstes mögliches r
r=(solve(rr(x1,x2,0,0,phi1,phi2)==4*r^2,r));
r=double(r)
r=r(abs(r)==min(abs(r)))
if length(r)>1
    r=r(1)
end

%berechne korrespondierende icc
xr1=x1+cos(phi1)*r;
xr2=x2-cos(phi2)*r;
yr1=-sin(phi1)*r;
yr2=sin(phi2)*r;

% zeichne volle kreise, welche trajektorie beinhalten
viscircles([yr1,xr1],abs(r));
viscircles([yr2,xr2],abs(r));