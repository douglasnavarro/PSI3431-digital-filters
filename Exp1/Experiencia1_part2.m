clc; clear; close all;

n=0:1000;
h = calc_h(n, 1);
x = calc_x(n);

subplot(4,1,1);
plot(n,x);
title('x[n]')

y = my_conv(x,h);
subplot(4,1,2);
plot(n,y);
title('y[n] using my\_conv function')

y_filter= filter(h,1,x);
subplot(4,1,3);
plot(n,y_filter);
title("y[n] using matlab's filter program");

y_conv= conv(h,x);
subplot(4,1,4);
trunc_y = y_conv(1:1001);
plot(n,trunc_y);
title("y[n] using matlab's conv program");


function y = calc_h(x, hamming)
    y = 0.25*sinc(0.25*(x-50));
    if(hamming)
        y = y.*calc_w(x);
    end
end

function y = calc_x(x)
    y = cos(pi*x/200) + cos(pi*x/3);
end

function y = calc_w(x)
    y = 0.54 + 0.46*cos(2*pi*(x-50)/100);
end