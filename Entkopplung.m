%% Modell Roboter Diff-Drive um Betriebstrajektorie Kreis
% Modell erweitert um u2
clear all

syms x [4,1]
syms u [2,1]
syms r0 w
syms f(x) g(x) h(x)
f(x1,x2,x3,x4)=[-sin(x3-x2)*x4;...
                -w+cos(x3-x2)/(x1+r0)*x4;...
                -w;...
                0]

g(x1,x2,x3,x4)=[    0 0;...
                    0 0;...
                    0 1;...
                    1 0]

h(x1,x2,x3,x4)=[ x1;...
                 x2]

dx=f+g*u
y=h

%% 
clear all

syms x [4,1]
syms u [2,1]
syms r0 w

f=[-sin(x3-x2)*x4;...
    -w+cos(x3-x2)/(x1+r0)*x4;...
    -w;
    0]

g=[  0 0;...
        0 0;...
        0 1;...
        1 0]

h=[  x1;...
     x2]

dx=f+g*u

ddx=jacobian(f)*dx+jacobian(g)*dx*u+g*du
y=h

%% Jacobi-Linearisienug
% original System
dxalt(x1,x2,x3,u1,u2)=[-sin(x3-x2)*u1;-w+cos(x3-x2)/(x1+r0)*u1;-w+u2]
Aa=jacobian(dxalt)
ABalt=Aa(0,0,0,w*r0,w)

%dynamisch erweitertes System
aa=jacobian(dx)
A=aa(0,0,0,w*r0)
B=g(0,0,0,w*r0)

%% Berechnung entkopplung 
Lgh=L(g,h)
 
Lfh=L(f,h);
LgLfh=L(g,Lfh);

inv(LgLfh(0,0,0,x4))
EntKop=inv(LgLfh);

Lf2h=L(f,Lfh)

syms v dv [2,1]

%% Berechnung Eingang
Trans(x1,x2,x3,x4,v1,v2)=EntKop*([v1;v2]-Lf2h);
Trans=simplify(Trans)

%% Überprüfung der Linearisierung
dxres(x1,x2,x3,x4,v1,v2)=f(x1,x2,x3,x4)+g(x1,x2,x3,x4)*Trans(x1,x2,x3,x4,v1,v2);
dxres=simplify(dxres)
%dTrans=jacobian(Trans)*[dx;dv1;dv2]

%jacobian(g)=0
%ddx=dt dx(x(t))=jacobian(x)*dx
ddx=jacobian(dxres)*[dxres;dv1;dv2];
ddx=simplify(ddx) %=> es gilt ddx(1:2)=v

%% Linearisierung geregeltes System in Umgebung
% gew. Ruhelage: x1=x2=x3=0

simplify(dxres(0,0,0,x4,v1,v2))
%ruhelage => x=w*r0; v2=0

simplify(dxres(0,0,0,w*r0,v1,0))
%ruhelage => v1=0

dxresa=jacobian(dxres);
dxresapprox=dxresa(0,0,0,w*r0,0,0)

Ta=jacobian(Trans);
Transapprox=Ta(0,0,0,w*r0,0,0)
