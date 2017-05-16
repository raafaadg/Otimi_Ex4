close all  %Fecha todas as janelas
%clear all  %Limpa a mem�ria
clc        %Limpa o workspace
syms x; %Atribui a 'x' a propriedade de simbolo do sistema para criar a func
f(x)=x^4-15*x^3+12*x^2-90*x;    %Fun��o Problema
%f(x)=((x^2)/2)-sin(x);         %Exemplo aula
x=linspace(-10,20,399);  %Cria um vetor de -10 at� 20,contendo 400 pontos
a=9;    %Valor inicial para o ponto A
b=12;    %Valor inicial para o ponto B
plot(x,f(x),'r')    %Plota a fun��o problema
grid on;    %Habilita o grid
hold on;    %Mantem o plot
metodo=1;   % 0=Bisse��o; 1=Se��o Aurea
if (metodo==1)
    met='Se��o Aurea';
else
    met='Bisse��o';
end
disp(['M�todo da ' met ' selecionado! Os pontos [a,b] iniciais s�o [' ...
    num2str(a) ',' num2str(b) ']']);
disp('------------------------------------------------------------------');
switch metodo  %Seleciona o m�todo
    case 0
        [A,B,ALFA]=bissecao(f,a,b);    %M�todo da Bisse��o %f=fun��o, a=ponto inical, b=ponto inicial
    case 1
        [A,B,ALFA]=sec_aurea(f,a,b);   %M�todo da Se��o Aurea %f=fun��o, a=ponto inical, b=ponto inicial
end
plot(A,f(A),'go',B,f(B),'yo',ALFA,f(ALFA),'x')