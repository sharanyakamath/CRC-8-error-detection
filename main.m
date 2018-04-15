%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        DC_ASSIGNMENT1
%         CRC_8
%         QUES 21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PALAK SINGHAL   (16CO129)
%  SHARANYA KAMATH (16CO140)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%main function
% sample message
msg=[1 0 0 1 1 0 1]

%sample generator polynomial
poly=[1 0 1 0 1 0 1 1]

%creation of a matrix consisting of zeros with dimension 1*length of codeword
%matrix will contain no of x bit errors which could be detected in the xth column
%of the matrix 
matrix=zeros([1 length(msg)+7]);

%creation of ncr matrix with dimension 1*length of codeword initialised with zeros
%it will contain the no of possible combination of datawords that could be formed 
%with x bit errors where x is a column of the matrix
ncr=zeros([1 length(msg)+7]);

%perc matrix is a matrix of dimensions 1*length of codeword
%it will contain the %error detection of x bit error in the xth column
perc=zeros([1 length(msg)+7]);

%transmitted msg(codeword)
frame=codeword(msg,poly);   

%conversion of transmitted message to a string
frame=num2str(frame);

 %decimal of transmitted msg
frame=bin2dec(frame);   

%loop to find the xor of transmitted codeword with binary numbers from 1 to
% 2^(length of codeword) to c
%c here is a binary value whose number of 1's indicate the no of error bits
for n=1:power(2,length(msg)+7)-1
    if(n==frame)               %case of 0 bit error
       continue;
    end
    c=bitxor(frame,n);         %finding xor
    c=dec2bin(c);              %converting decimal c to binary c
    count=0;                   % a variable initialized to 0 to keep count of number of error bits
    for i=1:length(c)          %this loop is to count the no of 1's in c  
        if(c(i)=='1')
            count=count+1;
        end
    end
    count%printing the count value
    receive=dec2bin(n);
    receive=str2num(receive);  %convert the string to number
    syndrome=synd(receive,poly);     %calculating the syndrome for the received codeword with errors by dividing with the sample generator polynomial 
        if(syndrome~=0)        %if syndrome ==0 error cannot be detected else it can be detected
           matrix(count)=matrix(count)+1;    %we increase the xth column of matrix by 1 which represent x bit error
    end
    matrix                                %displaying the generated matrix after every received codeword
    
end
for n=1:length(msg)+7                     %filling the ncr matrix
    ncr(n)=nchoosek(length(msg)+7,n);
end
ncr                            %displaying the ncr matrix after each step
perc=rdivide(matrix,ncr)       %dividing the no of codewords with x bit detectable error by the total codewords with x bit errrors
perc=perc*100                       %finding the percentage by multiplying with 100
graphfunc(perc,length(msg)+7);     %to plot the graph of error bits(x axis) vs %error correction
