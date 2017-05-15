close all
clear all
syms x;
f(x)=x^4-15*x^3+12*x^2-90*x;
x=linspace(-100,100,1000);
a=0;
b=1;
plot(x,f(x),'r')
metodo=1;
switch metodo
    case 0
        bissecao(f,a,b);
    case 1
       sec_aurea(f,a,b); 
end
