close all  %Fecha todas as janelas
clear all  %Limpa a mem�ria
clc        %Limpa o workspace
syms x; %Atribui a 'x' a propriedade de simbolo do sistema para criar a func
f(x)=x^4-15*x^3+12*x^2-90*x;    %Fun��o Problema
x=linspace(-100,100,1000);  %Cria um vetor de -100 at� 100,contendo 1000 pontos
a=0;    %Valor inicial para o ponto A
b=1;    %Valor inicial para o ponto B
plot(x,f(x),'r')    %Plota a fun��o problema
grid on;    %Habilita o grid
hold on;    %Mantem o plot
metodo=1;   % 0=Bisse��o; 1=Se��o Aurea
switch metodo  %Seleciona o m�todo
    case 0
        bissecao(f,a,b);    %M�todo da Bisse��o
    case 1
       sec_aurea(f,a,b);    %M�todo da Se��o Aurea
end
