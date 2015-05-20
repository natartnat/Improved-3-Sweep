cyl = UnitCylinder(2);
 
L1 = 3;
L2 = 2;
L3 = 1;
radius = .3;
 
w1 = 5;
w2 = 10;
w3 = 30;
 
arm1 = translate(scale(cyl,radius,radius,L1/2),0,0,L1/2);
arm1.facecolor = 'blue';
arm2 = translate(scale(cyl,radius,radius,L2/2),0,0,L2/2);
arm2.facecolor = 'green';
arm3 = translate(scale(cyl,radius,radius,L3/2),0,0,L3/2);
arm3.facecolor = 'red';
 
angle1 = 0 ; angle2 = 0 ; angle3 = 0;
 
for i = 1:36
    
    distal = combine(translate(rotateY(arm3,angle3),0,0,L2),arm2);
    distal = rotateY(distal, angle2);
    
    arm = combine(translate(distal,0,0,L1), arm1);
    arm = rotateY(arm, angle1);
    
    cla
    renderpatch(arm);
    camlight
    box on
    view(30,30)
    drawnow
    set(gca,'xlim',[-5 5],'ylim',[-5 5],'zlim',[-5 5])
    
    
    angle1 = angle1 + w1 ;
    angle2 = angle2 + w2 ;
    angle3 = angle3 + w3 ;
end
	
%This program builds a water molecule, duplicates it, then flys the camera around the scene and makes a movie of the flight.
clear all
 
% Hydrogen 
H = UnitSphere(2);
H.facecolor = 'blue';

%Oxygen 
Rox = 1.4;
Ox = scale(UnitSphere(2),Rox,Rox,Rox);
Ox.facecolor = 'red';
 
d = 1.4;   %approx O-H distance
H1 = translate(H,d,0,0);
ang = 107; %bond angle
H2 = rotateY(H1,ang);
 
water = combine(Ox,H1,H2);
 
%approx Hydrogen bond distance
water2 = combine(water,translate(rotateX(water,-45),1,2,3));
 
%init 40 frames of a movie
mov = moviein(40);
framecount = 1;
figure(1); clf;
%draw the water and move the camera and make a movie
for i=0:.1:1.57
    renderpatch(water2);
    camlight
    set(gca,'cameraposition',[20*cos(i),20*sin(i),0])
    set(gca,'cameratarget',[1,1,1])
    set(gca,'cameraupvector',[0 0 1])
    set(gca,'cameraviewangle',30)
    set(gca,'xlim',[-5 5],'ylim',[-5 5],'zlim',[-5 5])
    box on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    mov(framecount) = getframe(gcf);
    framecount = framecount + 1;
end
 
figure(2); clf;
axis off
movie(mov,-5,15);	