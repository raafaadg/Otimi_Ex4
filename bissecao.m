function [a,b,alfa]=bissecao(f,a,b)
it=1;           %Variável para controlar as iterações
df=diff(f);  %Derivada da função
% erro(it)=abs(double(f(b))-double(f(a)));    %Calcula erro inicial
erro(it)=abs(b(it)-a(it));
while(erro(it)>1e-3)    %Execute enquanto e erro for menor que 10^-3
   alfa(it)=(a(it)+b(it))/2; %Calcula alfa para os pontos a e b ionformados
   if(double(df(alfa(it)))<0)       %Caso alfa sejá negativo
       a(it+1)=alfa(it);            % a seguinte recebe alfa atual
       b(it+1)=b(it);               % b seguinte recebe b atual
   elseif(double(df(alfa(it)))>0)   %Caso alfa sejá positivo
       a(it+1)=a(it);               % a seguinte recebe a atual
       b(it+1)=alfa(it);            % b seguinte recebe alfa atual
   elseif(double(df(alfa(it)))==0)  %Caso alfa sejá igual a zero
       disp('ALFA = 0');            %Exibe que o Alfa é zero
   end
%    erro(it+1)=abs(double(f(b(it)))-double(f(a(it))));%Calcula erro atual
   erro(it+1)=abs(b(it)-a(it));
   disp(['Iteração nº ' num2str(it) ' -> ERRO : ' num2str(erro(it)) ...
       ' [ a = ' num2str(a(it)) ' , b = ' num2str(b(it)) ...
       ', Alfa = ' num2str(alfa(it)) ' ]']);
   it=it+1; %Incrementa a variavél de controle da iteração
end
disp('------------------------------------------------------------------');
disp('FIM!');
end