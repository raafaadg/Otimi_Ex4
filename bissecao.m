function []=bissecao(f,a,b)
syms x
it=1;
df(x)=diff(f);
erro(it)=abs(double(f(b))-double(f(a)));
while(erro(it)>1e-3)
   alfa(it)=(a(it)+b(it))/2;
   falfa(it)=double(df(alfa(it)));
   if(falfa<0)
       a(it+1)=alfa(it);
       b(it+1)=b(it);
   elseif(falfa>0)
       a(it+1)=a(it);
       b(it+1)=alfa(it);
   elseif(falfa==0) 
       disp('ALFA = 0');
   end
   disp('ERRO :');
   erro(it+1)=abs(double(f(b(it)))-double(f(a(it))));
   disp(erro(it));
   it=it+1;
end
disp('FIM!');
end