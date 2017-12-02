clc 
I1 = imread('Img_005_L_5.bmp');
I2 = imread('Img_005_R_4.bmp');
distancia = 0;
%Foram criadas funçoes para a segmentação e normalização da pupila

[RaioPupila1,RaioIris1,CentroX1,CentroY1,Centro1] = DetectarPupila(I1);
[RaioPupila2,RaioIris2,CentroX2,CentroY2,Centro2] = DetectarPupila(I2);

[Cartesiano1] = PolarCartesiano(I1,RaioIris1,RaioPupila1,CentroY1,CentroX1);
[Cartesiano2] = PolarCartesiano(I2,RaioIris2,RaioPupila2,CentroY2,CentroX2);

%Para retirar a palpebra superior fui utilizada uma marcara que zera os 
%coeficientes
% Cartesiano1 = imadjust(Cartesiano1,[],[],0.7);
% Cartesiano2 = imadjust(Cartesiano2,[],[],0.7);
Cartesiano1 = imadjust(Cartesiano1);
Cartesiano2 = imadjust(Cartesiano2);


% % % %  for y = 1:512
% % % %      for x = 1:64
% % % %        distancia = distancia + ( int32( Cartesiano1( x , y ) )  - int32 (Cartesiano2 ( x , y ) ) )^2;
% % % %         
% % % %      end
% % % %  end
% % % % distancia/1000000
% figure
% imshow(I1);
% title('Olho 1');
% viscircles(Centro1,RaioPupila1,'color','y');
% viscircles(Centro1,1.8*RaioPupila1);
% 
% figure
% imshow(I2);
% title('Olho 2');
% viscircles(Centro2,RaioPupila2,'color','y');
% viscircles(Centro2,1.8*RaioPupila2);


figure
imshow(Cartesiano1);
title('Normalização do olho 1');
figure
imshow(Cartesiano2)
title('Normalização do olho 2');

res1 = filtrogabor(Cartesiano1, 18, 0.5);
res2 = filtrogabor(Cartesiano2, 18, 0.5);
for y = 330:435
    for x = 39:64
        res1(x,y) = 0;
        res2(x,y) = 0;
    end
end
figure;imshow(res1);
figure;imshow(res2);

iriscode1 = codificaIris(res1);
iriscode2 = codificaIris(res2);

figure;imshow(iriscode1);
figure;imshow(iriscode2);

dist = HammingDistance(iriscode1, iriscode2)