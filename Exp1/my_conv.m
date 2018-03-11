%{
Escreva em Matlab um programa para implementar o filtro acima, ou seja, um
programa que calcule para uma entrada x[n] dada
y(n) = h[0]*x[n] + h[1]*x[n-1] + ... + h[L-1]*x[n-L+1]
%}

function y = my_conv(x, h)
    N = length(x);
    L = length(h);
    y = zeros(1,N);
    l_i = 0;
    for i=1:N
         y(i) = 0;
         if(l_i < L)
             l_i = l_i + 1;
         end
         for j=1:l_i
             y(i) = y(i) + h(j)*x(i-j+1);
         end
    end
end

