clc;
clear all


a = [0 1 1 1 -1 2]; %Поддиагональ
b = [70 90 110 -120 135 150]; %Основная диагональ
c = [1 -1 1 1 -1 0]; %Наддиагональ
d = [7; 10; 10; -13; 14; 16]; %Матрица ответов
X = zeros(length(d), 1); %Матрица - заготовка под ответы
n = length(b);

g = zeros(n,1);
alfa = zeros(n,1);
betta = zeros(n,1);

%Прямой ход

g(1) = b(1);
alfa(1) = -c(1)/g(1);
betta = d(1)/g(1);

for i = 2:(n-1)
   
    g(i) = b(i)+a(i)*alfa(i-1);
    alfa(i) = -c(i)/g(i);
    betta(i) = (d(i)-a(i)*betta(i-1))/g(i);
    
end

%Обратный ход

g(n) = b(n)+a(n)*alfa(n-1);
betta(n) = (d(n)-a(n)*betta(n-1))/g(n);
X(n) = betta(n);

for i = n-1:-1:1
   
    X(i) = betta(i)+alfa(i)*X(i+1);
    
end


disp(X)