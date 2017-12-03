%Realiza deslocamento de bits de forma a simular giro da iris. Recebe o
%iriscode a ser deslocado e um inteiro n, que representa a distancia de
%deslocamento.
function deslocado = deslocaBits(iriscode, n)

deslocado = zeros(size(iriscode));

tam = size(iriscode, 2);

margin = round(2 * abs(n));
offset = tam - margin;

if n == 0   %n = 0 significa que nao havera deslocamento
    deslocado = iriscode;
    
elseif n < 0    %n < 0 : deslocamento para a esquerda
    
    x = 1:offset;
    deslocado(:, x) = iriscode(:, x + margin);
    
    x = (offset + 1):tam;
    deslocado(:, x) = iriscode(:, x - offset);
    
else            %n > 0 : deslocamento para a direita
    x = (margin + 1):tam;
    deslocado(:, x) = iriscode(:, x - margin);
    
    x = 1:margin;
    deslocado (:, x) = iriscode(:, x + margin);
    
end
    
    
        