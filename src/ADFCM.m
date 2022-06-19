clc;
clear;
%%   Defining specific Variables
% variables which need to consider by user and may be changed based on
% purpose
m=2;   % the membership function it's value must be more than 2. bigger m will cause more fuzzy clustering.
C=3;   % number of clusters
ct=0.45; % Certainty Threshold. higher threshold will cause more sensivity of algorithm, more ambiguous records and lower false rate

%% Clustering the data
data=xlsread('data.xlsx'); % load the excel dataset. the data set must be in the same directory with name: data.xls
[center,U,obj_fun]=fcm(data,C,m); % Clustering the data with specified variables

%% Calculating Certainty Factor
P=zeros(C);
n=size(data); % n shows dimensions of input data
for (i=1:C)    % this loop calcuulate P Matrix which will be used for Certainty Factor
    for (j=1:C)
        if (i==j)
            P(i,j)=sum(U(i,:))/n(1);
        else
            P(i,j)= sum(1-U(i,:))/n(1);
        end
    end
end     
[val idx]=max(U); % determining max relevant cluster in idx and it's value in val
for i=1:n(1)
    score=0;
    sigma=0;
   for j=1:C
       if (j==idx(i))
        score=U(j,i);
       else 
           score=1-U(j,i);
       end
       sigma=sigma + score*P(idx(i),j);
   end
   cf= sigma/C;
   if cf> ct
       cluster(i)=idx(i); % record is not ambiguous
   else
       cluster(i)=0;    % record is ambiguous
   end
end
%% Saving Results
Cl=cluster';
result=data;
result(:,n(2)+1)=Cl(:);
xlswrite('result.xlsx',result);

    
