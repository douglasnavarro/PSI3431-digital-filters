%{
h[n] =
0.25 sinc(0.25(n ? 50)), 0 ? n ? 100,
0, caso contrario.
%}
array_n = 1:100;
array_h = h(array_n);
%plot(array_n,array_h);

%{
Escreva um programa para calcular a resposta em frequencia
H(ej?) do seu filtro a partir de h[n], para frequencias 
igualmente espacadas no intervalo 0 ? ? ? ?. Nao é permitido 
usar as funcoes freqz ou fft neste item.
%}
% Devemos calcular, então, a transformada de h[n] (TFTD):
array_w = linspace(0, pi);
for i = 1:length(array_w)
    H(i) = 0;
    for n = array_n
        H(i) = H(i) + h(n)*exp(-1i*n*array_w(n));
    end
end

plot(array_w,real(H),array_w,phase(H));

function y = h(x)
y = sinc(0.25*(x-50));
end

