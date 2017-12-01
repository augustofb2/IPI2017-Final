function res = filtrogabor(I, compOnda, desvio)

%Entradas:
%I = imagem da iris normalizada a ser filtrada
%compOnda = comprimento de onda para filtragem
%desvio = desvio padrao que descreve transferencia para centro de
%frequencia do filtro;

%Saida:
%res = resultado da filtragem: 


[lin, col] = size(I);

pontos = col;

if mod(pontos, 2) ~= 0
    pontos = pontos - 1;
end

logGabor = zeros(1, pontos);
resLinha = zeros(lin, pontos);

raio = [0:fix(pontos/2)]/fix(pontos/2)/2;
raio(1) = 1;
    
onda = compOnda;

centro = 1.0/onda;
    
logGabor(1:pontos/2+1) = exp((-(log(raio/centro)).^2) / (2 * log(desvio)^2));
logGabor(1) = 0;
    
    
filtro = logGabor;
    
    
for j = 1:lin
    sinal = I(j, 1:pontos);
    It = fft(sinal);
    resLinha(j,:) = ifft(It.*filtro);
end
    
res = resLinha;
