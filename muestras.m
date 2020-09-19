filename='robotGrupoD.dat';
delimiter=' ';
A=importdata(filename,delimiter,1);
time=A.data(:,1);
angle=A.data(:,2);
speed=A.data(:,3);
error=90-angle;% se calula el error apartir del vector de angulos
par_aplicado=A.data(:,4);