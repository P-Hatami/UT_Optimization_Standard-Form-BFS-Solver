clc;clear;close all
syms X
n = input('Enter n: ');
A = 2*rand(2*n,n)-1;
b = rand(2*n,1);

C = combnk(1:2*n,n);%list of number of conditions
numberOfSteps = size(C,1);% combination value n of 2*n
tic
for i = 1:numberOfSteps
    valid = true;
    index = C(i,1:n);
    subA = A(index,1:n);%submatix of A according to n conditions
    if(det(subA) == 0)
        valid = false;
    end
    if(valid)
        subb = b(index,1);%submatix of B according to n conditions
        X = inv(subA)*subb;%A is invertible, if it wasn't in first version, assigns infinity
        
        for j=1:2*n%for all rows
            if(A(j,:)*X > b(j,1))%if the answer doesn't satisfies conditions
                valid = false;
            end
        end
        
        for i=1:n % X>=0
            if(X(i,1)<0)
                valid = false;
            end
        end
        
    end
    
    if(valid)
        disp(X)
    end
end
toc
