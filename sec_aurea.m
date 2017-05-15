function [a,b,alfa] = sec_aurea(f,a,b)
au=0.618;   %Denife o valor Aureo
it=1;       %Variável para controlar as iterações
alfa(it)=a(it)+(1-au)*(b(it)-a(it));    %Calcula Alfa1
u(it)=a(it)+au*(b(1)-a(1));             %Calcula u1
erro(it)=abs(double(f(b(it)))-double(f(a(it)))); %Calcula erro inicial
while(erro>1e-3)    %Execute enquanto e erro for menor que 10^-3
   if(double(f(alfa(it)))<double(f(u(it)))) %Se Alfa < u
       a(it+1)=a(it);       % a seguinte recebe a anterior
       b(it+1)=u(it);       % b seguinte recebe u anterior
       u(it+1)=alfa(it);    % u seguinte recebe Alfa anterior
       alfa(it+1)=a(it+1)+(1-au)*(b(it+1)-a(it+1)); % Calcula o novo Alfa
   else
       a(it+1)=alfa(it);    % a seguinte recebe Alfa anterior
       b(it+1)=b(it);       % b seguinte recebe b anterior
       alfa(it+1)=u(it);    % Alfa seguinte recebe u anterior
       u(it+1)=a(it+1)+au*(b(it+1)-a(it+1));    % Calcula o novo u
   end
   erro(it)=abs(double(f(b(it)))-double(f(a(it))));
   disp(['Iteração nº ' num2str(it) ' -> ERRO : ' num2str(erro(it)) ...
       ' [ a = ' num2str(a(it)) ' , b = ' num2str(b(it)) ...
       ', Alfa = ' num2str(alfa(it)) ' ]']);
   it=it+1;
end
disp('------------------------------------------------------------------');
disp('FIM!');
end