close all  %Fecha todas as janelas
%clear all  %Limpa a memória
clc        %Limpa o workspace
syms x; %Atribui a 'x' a propriedade de simbolo do sistema para criar a func
f(x)=x^4-15*x^3+12*x^2-90*x;    %Função Problema
%f(x)=((x^2)/2)-sin(x);         %Exemplo aula
x=linspace(-10,20,399);  %Cria um vetor de -10 até 20,contendo 400 pontos
a=9;    %Valor inicial para o ponto A
b=12;    %Valor inicial para o ponto B
plot(x,f(x),'r')    %Plota a função problema
grid on;    %Habilita o grid
hold on;    %Mantem o plot
metodo=1;   % 0=Bisseção; 1=Seção Aurea
if (metodo==1)
    met='Seção Aurea';
else
    met='Bisseção';
end
disp(['Método da ' met ' selecionado! Os pontos [a,b] iniciais são [' ...
    num2str(a) ',' num2str(b) ']']);
disp('------------------------------------------------------------------');
switch metodo  %Seleciona o método
    case 0
        [A,B,ALFA]=bissecao(f,a,b);    %Método da Bisseção %f=função, a=ponto inical, b=ponto inicial
    case 1
        [A,B,ALFA]=sec_aurea(f,a,b);   %Método da Seção Aurea %f=função, a=ponto inical, b=ponto inicial
end
plot(A,f(A),'go',B,f(B),'yo',ALFA,f(ALFA),'x')