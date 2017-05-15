function [] = sec_aurea(f,a,b)
au=0.618;
it=1;
alfa(it)=a(it)+(1-au)*(b(it)-a(it));
u(it)=a(it)+au*(b(1)-a(1));
erro(it)=abs(double(f(b(it)))-double(f(a(it))));
while(erro>1e-3)
   if(double(f(alfa(it)))<double(f(u(it))))
       a(it+1)=a(it);
       b(it+1)=u(it);
       u(it+1)=alfa(it);
       alfa(it+1)=a(it+1)+(1-au)*(b(it+1)-a(it+1));
   else
       a(it+1)=alfa(it);
       b(it+1)=b(it);
       alfa(it+1)=u(it);
       u(it+1)=a(it+1)+au*(b(it+1)-a(it+1));
   end
   
   disp('ERRO :');
   erro(it)=abs(double(f(b(it)))-double(f(a(it))));
   disp(erro(it))
   it=it+1;
end
disp('FIM!');
end