
close all
clc
x=1;y=1;angulo=0;raio=0;distancia = 0;
I = imread('Img_005_L_2.bmp');
BW = edge(I);
[centers, radii] = imfindcircles(BW,[70 150],'ObjectPolarity','dark', ...
    'Sensitivity',0.97);
Centro = centers(1,1:2);
RaioPupila = (radii(1));
RaioIris = 1.8*RaioPupila;
CentroX = Centro(1,2);
CentroY = Centro(1,1);

%Transformação de coordenadas polares pra coordenadas cartesianas
for angulo = 0:2*pi/511:2*pi
    x=1;
    for raio = RaioPupila:round(RaioIris-RaioPupila)/63:round(RaioIris)
        Cartesiano(x,y) = I(round(raio*sin(angulo)+CentroX),round(raio*cos(angulo)+ CentroY));
        x = x+1;
    end
    y = y+1;
end


%Retirada da palpreba superior
for y = 336:430
    for x = 39:64
        Cartesiano(x,y) = 0;
    end
end




for y = 1:512
    for x = 1:64
       distancia = distancia + (Cartesiano(x,y)- Cartesiano1(x,y))^2;
    end
end


imshow(I);
viscircles(Centro,RaioPupila,'color','y');
viscircles(Centro,1.8*RaioPupila);
figure
imshow(Cartesiano);
