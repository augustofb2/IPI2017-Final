%Recebe o Iriscode das duas iris a serem comparadas e calcula a distancia
%de Hamming entre elas
function distancia = HammingDistance(iriscode1, iriscode2)

iriscode1 = logical(iriscode1);
iriscode2 = logical(iriscode2);

distancia = 100000;%Distancia inicial arbitrariamente alta

for desloc = -6:6
    
    %Bits da primeira imagem sao deslocados como se a iris estivesse
    %girando. Isso melhora o econhecimento quando as fotos de uma mesma
    %iris estiverem em angulos diferentes.
    deslocado = deslocaBits(iriscode1, desloc);
    
    N = size(iriscode1, 1) * size(iriscode1, 2) - (25*(115 - 2*abs(desloc)));
    S = xor(deslocado, iriscode2);              %Ignora mascara da palpebra
    
    dif = sum(sum(S == 1));
    
    dist = dif/N;
    
    if dist < distancia
        distancia = dist;%Seleciona a menor distancia encontrada
    end
end

end
