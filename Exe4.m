close all  %Fecha todas as janelas
clear all  %Limpa a mem�ria
clc        %Limpa o workspace
format long
syms x; %Atribui a 'x' a propriedade de simbolo do sistema para criar a func
f(x)=x^4-15*x^3+12*x^2-90*x;    %Fun��o Problema
%f(x)=((x^2)/2)-sin(x);         %Exemplo aula
x=linspace(-10,20,399);  %Cria um vetor de -10 at� 20,contendo 400 pontos
a=9;    %Valor inicial para o ponto A
b=12;    %Valor inicial para o ponto B
plot(x,f(x),'r')    %Plota a fun��o problema
grid on;    %Habilita o grid
hold on;    %Mantem o plot
metodo=0;   % 0=Bisse��o; 1=Se��o Aurea
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
        [A,B,LAMB,ERRO]=bissecao(f,a,b);    %M�todo da Bisse��o %f=fun��o, a=ponto inical, b=ponto inicial
        Vars={'a' 'b' 'Lambda' 'f_lamb' 'Erro'};
        Names={num2str(zeros(1,size(LAMB,2)))};
        for k=1:size(LAMB,2)
            Names(k)={sprintf('Itera��o n�%d',k)};
        end
        ff=diff(f);
        T = table(A',B',LAMB',double(ff(LAMB')),ERRO','VariableName',Vars,'RowNames',Names);
    case 1
        [A,B,LAMB,U,ERRO]=sec_aurea(f,a,b);   %M�todo da Se��o Aurea %f=fun��o, a=ponto inical, b=ponto inicial
        Vars={'a' 'b' 'Lambda' 'Mi_u' 'f_lamb' 'f_mi' 'Erro'};
        Names={num2str(zeros(1,size(LAMB,2)))};
        for k=1:size(LAMB,2)
            Names(k)={sprintf('Itera��o n�%d',k)};
        end
        T = table(A',B',LAMB',U',double(f(LAMB')),double(f(U')),ERRO',...
            'VariableName',Vars,'RowNames',Names);
end
plot(A,f(A),'go',B,f(B),'yo',LAMB,f(LAMB),'x')
disp(T);
format short