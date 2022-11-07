clc
clear all
close all
warning off all

%generando las clases
c1x=randn(1,1000);
c1y=randn(1,1000);

c2x=randn(1,1000)-25;
c2y=randn(1,1000)+7;

c3x=(randn(1,1000)-5)*2;
c3y=(randn(1,1000)+7)*3;


%graficando clases
figure(1)
plot(c1x(1,:),c1y(1,:),'ro','MarkerFaceColor','r','MarkerSize',10)
grid on
hold on
plot(c2x(1,:),c2y(1,:),'go','MarkerFaceColor','k','MarkerSize',10)
plot(c3x(1,:),c3y(1,:),'yo','MarkerFaceColor','y','MarkerSize',10)
legend('clase1','clase2','clase3')
disp('fin de proceso...')