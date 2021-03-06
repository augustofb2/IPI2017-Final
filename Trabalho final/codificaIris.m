%Recebe a imagem da iris normalizada e filtrada por Log-Gabor e cria o seu
%iriscode, formado por 2 bits para cada pixel da imagem, com base na fase
%dos numeros complexos gerados pela filtragem
function iriscode = codificaIris(irisGabor)

tam1 = size(irisGabor,2)*2;%Largura do iriscode sera o dobro da imagem original

iriscode = zeros(size(irisGabor,1), tam1);%Inicializa iriscode com zeros

tam2 = size(irisGabor, 2);

c = 1:size(irisGabor, 1);%c percorre a altura do iriscode

C1 = real(irisGabor) > 0;%Cria mascara com 1 nos pixeis onde a parte real eh positiva
C2 = imag(irisGabor) > 0;%Mascara com 1 onde parte imaginaria eh positiva

for i = 0:tam2-1
    
    ja = double(2*(i));
    
    %Preenche iriscode com os bits calculados
    iriscode(c, ja + 1) = C1(c, i+1);
    iriscode(c, ja + 2) = C2(c, i+1);
end