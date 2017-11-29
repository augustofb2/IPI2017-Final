function [Cartesiano] = PolarCartesiano(I,RaioIris,RaioPupila,CentroY,...
    CentroX)
x = 1; y = 1;

for angulo = 0:2*pi/511:2*pi
    x = 1;
    for raio = RaioPupila+15:round(RaioIris-RaioPupila-15)/63:round(RaioIris)
        Cartesiano(x,y) = I(round(raio*sin(angulo)+CentroX),round(raio*...
            cos(angulo)+ CentroY));
        x = x+1;
    end
    y = y+1;
end
end

