Eine Überprüfung der hier Händischen Rechnung findet sich in der entsprechenden Matlab Datei
## Allgemeines Modell in Polarkoordinaten
Über Modellbildung durch $\Delta\to \partial$ findet man als Dynamik für das System die Gleichung in Polarkoordinaten
$$\dot{r}=\cos(\phi-\theta)u_{1}$$
$$
\dot{\theta}=\sin(\phi-\theta) \frac{u_{1}}{r}
$$
$$
\dot{\phi}=u_{2}
$$
wobei
$$
u=\begin{pmatrix}
v \\
\dot{\phi}
\end{pmatrix}
$$
mit $v$ vorwärtsgeschwindigkeit des DiffDrive, $\dot{\phi}$ drehgeschindigkeit des DiffDrive, $r$ Radius der Polarkoordinatn, $\theta$ winkel der Polarkoordinaten.
## Modell um Betriebstrajektorie

Wir wählen als Betriebstrajektorie
$$
\hat{\theta}(t)=\theta_{0}+\omega t,~\hat{r}(t)=r_{0}
$$
als Drehung um den Ursprung als Momentanpol.

Dies vermindert nicht die Allgemeingültigkeit des Modells, vereinfacht allerdings die Berechnung und herleitung einer Regelung.

Die differenzkoordinaten sind 
$$
\theta_{e}=\theta-\hat{\theta}(t),~r_{e}=r-\hat{r},~\phi_{e}=\phi-\hat{\theta}(t)-\frac{\pi}{2}
$$
und mit $x_{1},x_{2},x_{3}=r_{e},\theta_{e},\phi_{e}$ folgt für des Fehlersystem dann
$$
\dot{x}_{1}=\cos(\phi-\theta)u_{1}=\cos\left( \phi_{e}+\hat{\theta}+\frac{\pi}{2}-\theta_{e}-\hat{\theta} \right)=-\sin\left( x_{3}-x_{2}\right)u_{1}
$$
$$
\dot{x}_{2}=\sin\left( \phi_{e}+\hat{\theta}+\frac{\pi}{2}-\theta_{e}-\hat{\theta} \right) \frac{u_{1}}{r_{e}+r_{0}}-\dot{\hat{\theta}}=\cos(x_{3}-x_{2})\frac{u_{1}}{(x_{1}+r_{0})}-\omega
$$
$$
\dot{x}_{3}=\dot{\phi}_{e}=\dot{\phi}-\dot{\hat{\theta}} = u_{2}-\omega
$$
Also insgesamt
$$
\dot{x}=\begin{pmatrix}
0 \\
-\omega \\
-\omega
\end{pmatrix}+\begin{pmatrix}
-\sin(x_{3}-x_{2}) & 0 \\
\frac{\cos(x_{3}-x_{2})}{x_{1}+r_{0}} & 0\\
0 & 1
\end{pmatrix} u
$$
## Dynamische Erweiterung 
Da das einfache System nicht Einganslinearisierbar ist, erweitern wir das System zu
$$
\dot{x}=\begin{pmatrix}
0 \\
-\omega \\
-\omega
\end{pmatrix}+\begin{pmatrix}
-\sin(x_{3}-x_{2})u_{1}  \\
\frac{\cos(x_{3}-x_{2})}{x_{1}+r_{0}}u_{1} \\
 u_{2}
\end{pmatrix} 
$$
mit $\dot{u}_{1}=\bar{u}_{1}$ und $u_{2}=\bar{u}_{2}$ zu
$$
\dot{x}=\begin{pmatrix}
-\sin(x_{3}-x_{2})x_{4} \\
-\omega+ \frac{{\cos(x_{3}-x_{2})}}{x_{1}+r_{0}}x_{4} \\
-\omega \\
0
\end{pmatrix}+\begin{pmatrix}
0  & 0\\
0  & 0\\
0 & 1 \\
1 & 0
\end{pmatrix}\begin{pmatrix}
\tilde{u}_{1} \\
\bar{u}_{2}
\end{pmatrix}
$$
was der Eingangsaffinen Form
$$
\dot{x}=:f(x)+g(x)u
$$
entspricht mit konstantem $g$.
## Herleitung Eingangslinearisierung
Es folgt für die Entkopplungsmatrix mit $h_{1}(x)=x_{1},h_{2}(x)=x_{2}$ und $L_{g}h$ der Lie-Ableitung von $h$ nach $g$ 
$$
L_{g}h=0,
$$
$$
L_{g_{1}}L_{f}h_{1}=L_{g_{1}}(-\sin(x_{3}-x_{2})x_{4})=\begin{pmatrix}
\dots  & \dots  & -\cos(x_{3}-x_{2})x_{4} & -\sin(x_{3}-x_{2})
\end{pmatrix} \begin{pmatrix}
0 \\
0 \\
0 \\
1
\end{pmatrix}
$$
$$
\implies L_{g_{1}}L_{f}h_{1}=-\sin(x_{3}-x_{2})
$$
$$
L_{g_{2}}L_{f}h_{1}=L_{g_{2}}(-\sin(x_{3}-x_{2})x_{4})=-\cos(x_{3}-x_{2})x_{4}
$$
$$
L_{g_{1}}L_{f}h_{2}=L_{g_{1}}(\frac{\cos(x_{3}-x_{2})}{x_{1}+r_{0}}x_{4}-\omega)=\frac{\cos(x_{3}-x_{2})}{x_{1}+r_{0}}
$$
$$
L_{g_{2}}L_{f}h_{2}=L_{g_{2}}\left( \frac{\cos(x_{3}-x_{2})}{x_{1}+r_{0}}x_{4}-\omega \right)=-\frac{\sin(x_{3}-x_{2})}{x_{1}+r_{0}}x_{4}
$$ Also ist der Verktorrelativgrad $r=(2,2)$ und die Entkopplungsmatrix um $x_{1}=x_{2}=x_{3}=0,~x_{4}\neq 0$, genannt $\bar{x}$,
$$
L_{g}L_{f}h(\bar{x})=\begin{pmatrix}
0 & -x_{4} \\
\frac{1}{r_{0}}  & 0
\end{pmatrix}
$$
das inverse am allgemeinen Punkt $x$ mit $x_{4}\neq 0$ ist dann
$$
L_{g}L_{f}h(x)^{-1}=\begin{pmatrix}
\sin(x_{2}-x_{3}) & \cos(x_{2}-x_{3})(r_{0}+x_{1}) \\
-\frac{\cos(x_{2}-x_{3})}{x_{4}} & \frac{\sin(x_{2}-x_{3})(r_{0}+x_{1})}{x_{4}}
\end{pmatrix}
$$

Es gilt
$$
L_{f}^{2}h_{1}(x)=L_{f}(-\sin(x_{3}-x_{2})x_{4})
$$
$$
=\begin{pmatrix}
0 & \cos(x_{3}-x_{2})x_{4} & -\cos(x_{3}-x_{2})x_{4} & -\sin(x_{3}-x_{2})
\end{pmatrix} \begin{pmatrix}
-\sin(x_{3}-x_{2})x_{4} \\
-\omega+ \frac{{\cos(x_{3}-x_{2})}}{x_{1}+r_{0}}x_{4} \\
-\omega \\
0
\end{pmatrix}
$$
$$
=-\omega \cos(x_{3}-x_{2})x_{4}+ \frac{\cos^{2}(x_{3}-x_{2})}{x_{1}+r_{0}}x_{4}^{2}+\omega \cos(x_{3}-x_{2})x_{4}
$$
$$
\implies L_{f}^{2}h_{1}(x)=\frac{{\cos ^{2}(x_{3}-x_{2})}}{x_{1}+r_{0}}x_{4}^{2}
$$
$$
L_{f}^{2}h_{2}(x)=L_{f}(-\omega+ \frac{{\cos(x_{3}-x_{2})}}{x_{1}+r_{0}}x_{4})
$$
$$
=\begin{pmatrix}
-\cos(x_{3}-x_{2}) \frac{1}{(x_{1}+r_{0})^{2}}x_{4}   & \frac{\sin(x_{3}-x_{2})}{x_{1}+r_{0}}x_{4} & - \frac{\sin(x_{3}-x_{2})}{x_{1}+r_{0}}x_{4} & \dots
\end{pmatrix}\begin{pmatrix}
-\sin(x_{3}-x_{2})x_{4} \\
-\omega+ \frac{{\cos(x_{3}-x_{2})}}{x_{1}+r_{0}}x_{4} \\
-\omega \\
0
\end{pmatrix}
$$
$$
=\cos(x_{3}-x_{2})\sin(x_{3}-x_{2}) \frac{x_{4}^{2}}{(x_{1}+r_{0})^{2}} -\frac{\omega \sin(x_{3}-x_{2})}{x_{1}+r_{0}}x_{4} +\frac{\cos(x_{3}-x_{2})\sin(x_{3}-x_{2})}{(x_{1}+r_{0})^{2}}x_{4}^{2}+\frac{\omega \sin(x_{3}-x_{2})}{x_{0}+r_{0}}x_{4}
$$
$$
=\cos(x_{3}-x_{2}) \frac{\sin(x_{3}-x_{2})}{(x_{1}+r_{0})^{2}}x_{4}^{2}+\cos(x_{3}-x_{2}) \frac{\sin(x_{3}-x_{2})}{(x_{1}+r_{0})^{2}}x_{4}^{2}
$$
$$
=\frac{\sin(2(x_{3}-x_{2}))}{(x_{1}+r_{0})^{2}}x_{4}^{2}
$$
$$
\implies L_{f}^{2}h_{2}(x)=\frac{\sin(2(x_{3}-x_{2}))}{(x_{1}+r_{0})^{2}}x_{4}^{2}
$$
Mit dem Linearisierenden Regelgesetz
$$
\tilde{u}=(L_{g}L_{f}h(x))^{-1} \left(\tilde{v}-\begin{pmatrix}
L_{f}^{r_{1}}h_{1}(x) \\
L_{f}^{r_{2}}h_{2}(x)
\end{pmatrix}\right)
$$
wobei $\bar{v}$ der neue Eingang ist (nicht zu verwechseln mit $v$ der Geschwindigkeit des DiffDrive)
## Linearisierendes Regelgesetz
Ausgeschrieben folgt
$$
\tilde{u}=\begin{pmatrix}
(r_{0}v_{1}\sin(x_{2} - x_{3}) + v_{1}x_{1}\sin(x_{2} - x_{3}) + r_{0}^2v_{2}\cos(x_{2} - x_{3}) + v_{2}x_{1}^2\cos(x_{2} - x_{3}) + x_{4}^2\cos(x_{2} - x_{3})^2\sin(x_{2} - x_{3}) + 2r_{0}v_{2}x_{1}\cos(x_{2} - x_{3}))/(r_{0} + x_{1}) \\
{\left( \frac{5x_{4}^2\cos(x_{2} - x_{3})}{4} - \frac{x_{4}^2\cos(3x_{2} - 3x_{3})}{4} - r_{0}v_{1}\cos(x_{2} - x_{3}) - v_{1}x_{1}\cos(x_{2} - x_{3}) + r_{0}^2v_{2}\sin(x_{2} - x_{3}) + v_{2}x_{1}^2\sin(x_{2} - x_{3}) + 2r_{0}v_{2}x_{1}\sin(x_{2} - x_{3}) \right)} \frac{1}{(x_{4}(r_{0} + x_{1}))}
\end{pmatrix}
$$
Dieses lässt sich für $x_{2}-x_{3}$ klein auch gut lokal approximieren durch kleinwinkelnäherung. (ersetze $\sin(x_{2}-x_{3})\approx(x_{2}-x_{3})$ und $\cos(x_{2}-x_{3})\approx 1$)
$$
\tilde{u}\approx\begin{pmatrix}
(r_{0}v_{1}(x_{2} - x_{3}) + v_{1}x_{1}(x_{2} - x_{3}) + r_{0}^2v_{2} + v_{2}x_{1}^2 + x_{4}^2(x_{2} - x_{3}) + 2r_{0}v_{2}x_{1})/(r_{0} + x_{1}) \\
{\left( x_{4}^2 - r_{0}v_{1} - v_{1}x_{1} + r_{0}^2v_{2}(x_{2} - x_{3}) + v_{2}x_{1}^2(x_{2} - x_{3}) + 2r_{0}v_{2}x_{1}(x_{2} - x_{3}) \right)} \frac{1}{(x_{4}(r_{0} + x_{1}))}
\end{pmatrix}
$$
$$
=\begin{pmatrix}
(r_{0}+x_{1})(x_{2}-x_{3})v_{1}+ (r_{0}+x_{1})^{2}(x_{2}-x_{3})v_{2} + x_{4}^{2}(x_{2}-x_{3})\\
(x_{4}^{2}-(r_{0}+x_{1})v_{1}+(r_{0}+x_{1})^{2}(x_{2}-x_{3})v_{2}) \frac{1}{x_{4}}
\end{pmatrix} \frac{1}{r_{0}+x_{1}}
$$
$$
=\begin{pmatrix}
(x_{2}-x_{3})\left( v_{1}+(r_{0}+x_{1})v_{2}+ \frac{x_{4}^{2}}{r_{0}+x_{1}} \right) \\
(x_{4}^{2}-v_{1}+(r_{0}+x_{1})(x_{2}-x_{3})v_{2}) \frac{1}{x_{4}}
\end{pmatrix}
$$


Für das gesamtsystem gilt nun

$$
\begin{pmatrix}
\dot{x}_{1} \\
\ddot{x}_{1} \\
\dot{x}_{2} \\
\ddot{x}_{2}
\end{pmatrix}=\begin{bmatrix}
0 & 1 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 0 & 0
\end{bmatrix}\begin{pmatrix}
x_{1} \\
\dot{x}_{1} \\
x_{2} \\
\dot{x}_{2}
\end{pmatrix}+\begin{bmatrix}
0  & 0 \\
1 & 0 \\
0 & 0 \\
0 & 1
\end{bmatrix}\begin{pmatrix}
v_{1} \\
v_{2}
\end{pmatrix}
$$
wobei wie vorher $x_{1}=r_{e},x_{2}=\theta_{e}$ 
zudem gilt nach unserer Definition
$$
\dot{x}_{3}=\bar{u}_{2},~\dot{x}_{4}=\bar{u}_{1}
$$
und unser Eingang vom eigentlichen System ist
$$
u_{1}=x_{4}=\int_{0}^{t} \bar{u}_{1}  \, dt  
$$
$$
u_{2}=\bar{u}_{2}
$$

Von hier aus kann das System mit üblichen Methoden der Linearen Regelungstechnik behandelt werden. Es ist anzumerken, dass das System um $x_{1}$ und $x_{2}$ voneinander 'getrennt' sind.
