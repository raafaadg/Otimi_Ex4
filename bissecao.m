% function [a,b,lamb,erro]=bissecao(f,a,b)
clear all
clc

syms alfa
% f(alfa) = 1028*alfa^2-260*alfa-15; %Alterar aqui os coeficientes da função
% f(alfa)=800*alfa^2-272*alfa;
% f(alfa)=12100.5*alfa^2-356.25*alfa-18.76785;
f(alfa)=887.635*alfa^2-285.666*alfa+10*(log(-8.1667*alfa+2)+log(-34.1665*alfa+3));
a=0;    %Fornecer valor inicial de a
b=0.09;    %Fornecer valor inicial de b


it=1;           %Variável para controlar as iterações
df=diff(f);  %Derivada da função
erro(it)=abs(double(f(b))-double(f(a)));    %Calcula erro inicial
% erro(it)=abs(b(it)-a(it));
lamb(it)=(a(it)+b(it))/2;
while(erro(it)>1e-3)    %Execute enquanto e erro for menor que 10^-3
   
   if(double(df(lamb(it)))<0)       %Caso alfa sejá negativo
       a(it+1)=lamb(it);            % a seguinte recebe alfa atual
       b(it+1)=b(it);               % b seguinte recebe b atual
   elseif(double(df(lamb(it)))>0)   %Caso alfa sejá positivo
       a(it+1)=a(it);               % a seguinte recebe a atual
       b(it+1)=lamb(it);            % b seguinte recebe alfa atual
   elseif(double(df(lamb(it)))==0)  %Caso alfa sejá igual a zero
       disp('LAMBDA = 0');            %Exibe que o Alfa é zero
   end

   disp(['Iteração nº ' num2str(it) ' -> ERRO : ' num2str(erro(it)) ...
       ' [ a = ' num2str(a(it)) ' , b = ' num2str(b(it)) ...
       ', Lambda = ' num2str(lamb(it)) ' ]']);
   it=it+1; %Incrementa a variavél de controle da iteração
   erro(it)=abs(double(f(b(it)))-double(f(a(it))));%Calcula erro atual
%    erro(it)=abs(b(it)-a(it));
   lamb(it)=(a(it)+b(it))/2; %Calcula alfa para os pontos a e b ionformados
end
disp(['Iteração nº ' num2str(it) ' -> ERRO : ' num2str(erro(it)) ...
       ' [ a = ' num2str(a(it)) ' , b = ' num2str(b(it)) ...
       ', Lambda = ' num2str(lamb(it)) ' ]']);
disp('------------------------------------------------------------------');
disp('FIM!');
% end