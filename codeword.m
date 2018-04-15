%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        DC_ASSIGNMENT1
%         CRC_8
%         QUES 21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PALAK SINGHAL   (16CO129)
%  SHARANYA KAMATH (16CO140)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The program generates transmitted msg(codeword)

function frame = codeword(msg,poly)
%calculating the dimensions of the polynomial
[M N]=size(poly);

%appending zeroes(length of generator polynomial -1) to the dataword
mseg=[msg zeros(1,N-1)];

%calculating the quotient and remainder when the new message after appending the zeroes is divided by the polynomial        
[q r]=deconv(mseg,poly);
r=abs(r);
%finding the absolute value of remainder
for i=1:length(r)
    a=r(i);
    if ( mod(a,2)== 0 )
        r(i)=0;
    else
        r(i)=1;
    end
end

%calculating the generated codeword 
frame = bitor(mseg,r);
