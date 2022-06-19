% load('fcm2','data');
%data=xlsread('pima indians diabets.xls');
numbers=210;
ct=0.45;
%alfa=0.8;
beta=numbers;
TP=0;
s2=0;
a1=zeros(numbers);
 a2=zeros(numbers);
 a3=zeros(numbers);
 a4=zeros(numbers);
 a5=zeros(numbers); 
 b1=zeros(numbers);
 b2=zeros(numbers);
 b3=zeros(numbers);
 b4=zeros(numbers);
 b5=zeros(numbers);
 t=zeros(numbers);
%disp(v);
 %plot(v(2,1:numbers));
 [center,U,obj_fun]=fcm(data,3,2); 
%  a1=u1(1,1:numbers);
%  a2=u1(2,1:numbers);
%  a3=u1(3,1:numbers);

   for j=1:3            
           a=sum(U(j,:));
            if (j==1)
            b1=sum(1-U(2,:));
            b2=sum(1-U(3,:));
           c(1,:)=(U(1,:)*a+((1-U(2,:))*b1)+((1-U(3,:))*b2))/(3*numbers);
            end
            if (j==2)
            b1=sum(1-U(1,:));
            b2=sum(1-U(3,:));           
            c(2,:)=(U(2,:)*a+((1-U(1,:))*b1)+((1-U(3,:))*b2))/(3*numbers);
            end
            if (j==3)
            b1=sum(1-U(1,:));
            b2=sum(1-U(2,:));      
            c(3,:)=(U(3,:)*a+((1-U(1,:))*b1)+((1-U(2,:))*b2))/(3*numbers);
            end
                        
   end
   
   for i=1:numbers
        if (max(c(:,i))< ct)
        t(i)=0;        
        else
            k=max(c(:,i));
            if k==c(1,i)
                t(i)=1;
            end
            if k==c(2,i)
                t(i)=2;
            end
            if k==c(3,i)
                t(i)=3;
            end
            
        end
   end
%    for (i=1:numbers)
%      
%     if (a1(i)> 0.5)
%         cf=(a1(i)*c1+(1-a2(i))*(1-c2))/2;
%         if (cf>ct)
%             t(i)=0;
%         else
%             t(i)=-1;
%             am=am+1;
%         end
%     end
%      if (a2(i)> 0.5)
%          cf=(a2(i)*c2+(1-a1(i))*(1-c1))/2;
%          if (cf>ct)
%             t(i)=1;
%         else
%             t(i)=-1;
%             am=am+1;
%          end
%      end
%       if (a3(i)> 0.5)
%          if ((a3(i)> alfa) && (a2(i)<z2) && (a1(i)<z1) )
%             t(i)=1;
%         else
%             t(i)=-1;
%             am=am+1;
%          end
%       end
%  end
 ghalat=0;
 sahih=0;
 FN=0;
 TP=0;
 TN=0
 recall=0;
 gmean=0;
 FP=0;
 spec=0;
%  for (i=1:numbers)
%     if ( result(i)== t(i))
%         sahih=sahih+1;
%     end
%     if ((result(i)==0)&& (t(i)==0))
%         TP=TP+1;
%     end
%      if ((result(i)==1)&& (t(i)==1))
%         TN=TN+1;
%      end
%     if (( result(i)==0) && (t(i)==1))
%         FN=FN+1;
%     end
%     if (( result(i)==1) && (t(i)==0))
%         FP=FP+1;
%     end
%     if (result(i)~= t(i))
%         if (t(i) ~= -1)
%         ghalat=ghalat+1;
%         end
%     end
%  end
% spec=1-(FP/ghalat);
% recall=TP/(TP+FN);
% gmean= sqrt(spec*recall);
%     
% disp(sahih);        
% disp(ghalat);
% %disp(am);
% disp(gmean);
% rslt=zeros(8);
% rslt(1)=sahih;
% rslt(2)=ghalat;
% rslt(3)=am;
% rslt(4)=TP;
% rslt(5)=TN;
% rslt(6)=FP;
% rslt(7)=FN;
% rslt(8)=gmean;




            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
