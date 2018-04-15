%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        DC_ASSIGNMENT1
%         CRC_8
%         QUES 21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PALAK SINGHAL   (16CO129)
%  SHARANYA KAMATH (16CO140)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this function plots graph
function graph=input(perc,num)

error_bits=zeros([1 num]);
for i=1:num
    error_bits(i)=i;
end

%plots the graph with x axis as number of error bits and y axis as percentage of error correction
graph=bar(error_bits,perc)

