
clc % limpiar pantalla
close all   %cierra todo
clear all %limpia todo

warning off all 
s1='Yes'
s2='Yes'
c1=[15 65 45 48 27; 45 90 48 45 76];
c2=[60 50 70 65 38; -58 -25 -38 -33 -45];
c3=[-30 -35 -45 -30 -40; 50 70 55 67 70];
c4=[-50 -36 -60 -28 -30; -20 30 -10 20 -40];
c5=[10 23 21 22 24; 17 0 17 24 33];
c6=[-10 -5 -15 10 0; -85 -94 -65 -80 -69];
while strcmp(s1,s2)



disp('welcome to pattern recognition')

%diseño de un clasificador de distancia euclideana

% metiendo las clases de pertenencia


vx=input('dame la coord del vector en x=');
vy=input('dame la coord del vector en y=');
vector=[vx;vy];
mediaTotal = mean((cat(2,c1,c2,c3,c4,c5,c6)),2)

if 1000 < vector(1,1) || 1000 < vector (2,1)
    fprintf("Demasiado lejos el valor\n");
    ct=[mediaTotal,vector];
    f2=figure(2);
    plot(ct(1,:),ct(2,:),'ro-','MarkerFaceColor','r','MarkerSize', 10, 'Marker','hexagram','MarkerEdgeColor','k')
    pause(0.5);
else
%GRAFICANDO LAS CLASES


%%% obteniendo parámetros de cada clase


media1=mean(c1,2);
media2=mean(c2,2);
media3=mean(c3,2);
media4=mean(c4,2);
media5=mean(c5,2);
media6=mean(c6,2);

c_1=[media1,vector];
c_2=[media2,vector];
c_3=[media3,vector];
c_4=[media4,vector];
c_5=[media5,vector];
c_6=[media6,vector];




distancia1=norm(media1-vector);
distancia2=norm(media2-vector);
distancia3=norm(media3-vector);
distancia4=norm(media4-vector);
distancia5=norm(media5-vector);
distancia6=norm(media6-vector);


dist_total=[distancia1,distancia2, distancia3,distancia4,distancia5,distancia6];
minima=min(min(dist_total))
encuentra=find(dist_total==minima)
fprintf('el vector desconocido pertenece a la clase %d\n',encuentra)

    f1 = figure(1);
    plot(c1(1,:),c1(2,:),'ro','MarkerFaceColor','r','MarkerSize', 10, 'Marker','hexagram')
    grid on
    hold on
    plot(c2(1,:),c2(2,:),'go','MarkerFaceColor','g','MarkerSize', 10,'Marker','<')
    plot(c3(1,:),c3(2,:),'bo','MarkerFaceColor','b','MarkerSize', 10,'Marker','>')
    plot(c4(1,:),c4(2,:),'co','MarkerFaceColor','c','MarkerSize', 10,'Marker','pentagram')
    plot(c5(1,:),c5(2,:),'mo','MarkerFaceColor','m','MarkerSize', 10,'Marker','diamond')
    plot(c6(1,:),c6(2,:),'yo','MarkerFaceColor','y','MarkerSize', 10,'Marker','^')
    plot(vector(1,:),vector(2,:),'ko','MarkerFaceColor','k','MarkerSize', 10,'Marker','diamond')
    plot(c_1(1,:),c_1(2,:),'ro-','MarkerFaceColor','r','MarkerSize', 10, 'Marker','hexagram','MarkerEdgeColor','k')
    plot(c_2(1,:),c_2(2,:),'go-','MarkerFaceColor','g','MarkerSize', 10,'Marker','<','MarkerEdgeColor','k')
    plot(c_3(1,:),c_3(2,:),'bo-','MarkerFaceColor','b','MarkerSize', 10,'Marker','>','MarkerEdgeColor','k')
    plot(c_4(1,:),c_4(2,:),'co-','MarkerFaceColor','c','MarkerSize', 10,'Marker','pentagram','MarkerEdgeColor','k')
    plot(c_5(1,:),c_5(2,:),'mo-','MarkerFaceColor','m','MarkerSize', 10,'Marker','diamond','MarkerEdgeColor','k')
    plot(c_6(1,:),c_6(2,:),'yo-','MarkerFaceColor','y','MarkerSize', 10,'Marker','^','MarkerEdgeColor','k')
    plot(vector(1,:),vector(2,:),'ko','MarkerFaceColor','k','MarkerSize', 16,'Marker','o','MarkerEdgeColor','k')
    legend('clase1','clase2','clase3','clase4','clase5','clase6','vector','distanciaC1','distanciaC2','distanciaC3','distanciaC4','distanciaC5','distanciaC6')

    if encuentra==1
        c1 = cat(2,c1,vector);
    elseif encuentra==2
        c2 = cat(2,c2,vector);
    elseif encuentra==3
        c3 = cat(2,c3,vector);
    elseif encuentra==4
        c4 = cat(2,c4,vector);
    elseif encuentra==5
        c5 = cat(2,c5,vector);
    elseif encuentra==6
        c6 = cat(2,c6,vector);
    end
end
pause(2);
s2=input('Deseas volver a buscar un vector? [Yes/No]','s');

clear vector %limpia todo
%close(f1)
end