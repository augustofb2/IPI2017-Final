function [RaioPupila,RaioIris,CentroX,CentroY,Centro] = DetectarPupila(I)

BW = edge(I);
[centers, radii] = imfindcircles(BW,[70 150],'ObjectPolarity','dark', ...
    'Sensitivity',0.97);
Centro = centers(1,1:2);
RaioPupila = (radii(1));
RaioIris = 1.8*RaioPupila;
CentroX = Centro(1,2);
CentroY = Centro(1,1);

end

