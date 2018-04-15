%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        DC_ASSIGNMENT1
%         CRC_8
%         QUES 21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PALAK SINGHAL   (16CO129)
%  SHARANYA KAMATH (16CO140)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculating syndrome for received codewords

function syndrome= synd(receive,poly)
  
%calculating the dimensions of the polynomial
[M N]=size(poly);

%calculating the quotient and remainder of the received codeword
[q r]=deconv(receive,poly);
r=abs(r);
for i=1:length(r)
    a=r(i);
    if ( mod(a,2)== 0 )
        r(i)=0;
    else
        r(i)=1;
    end
end

%finding the binary syndrome 
syndrome=r;