function [outmat] = matdimdown(inmat,stepNUM)
% 矩阵维度退化函数，更进一步，保证中心行与中心列被取到
% 将 201x201 的矩阵退化成 51x51 的矩阵（step = 4）
% 参数 stepNUM 指步长，如stepNUM = 2，则1、3、5...

%% 初始化
[row,col] = size(inmat);

crow = floor(0.5*(row+1)); % 中心行/向下取整
ccol = floor(0.5*(col+1)); % 中心列

drow = 1+2*floor((crow-1)/stepNUM); % 缩放后的矩阵行数
dcol = 1+2*floor((ccol-1)/stepNUM); % 缩放后的矩阵列数

dcrow = floor(0.5*(drow+1)); % 缩放后的矩阵中心行
dccol = floor(0.5*(dcol+1)); % 缩放后的矩阵中心列
%% 行缩放

mat1 = zeros(drow,col); % 初始化（行缩放矩阵）
% 填补中心行及向上矩阵
m = 1;
for i = dcrow:-1:1
    for j = 1:col
        mat1(i,j) = inmat(crow-stepNUM*(m-1),j);
    end
    m = m + 1;
end
% 填补中心行向下矩阵
m = 1;
for i = dcrow+1:1:drow
    for j = 1:col
        mat1(i,j) = inmat(crow+stepNUM*m,j);
    end
    m = m + 1;
end
%% 列缩放

mat2 = zeros(drow,dcol); % 初始化（行列缩放矩阵）
% 填补中心列及向前矩阵
m = 1;
for j = dccol:-1:1
    for i = 1:drow
        mat2(i,j) = mat1(i,ccol-stepNUM*(m-1));
    end
    m = m + 1;
end
% 填补中心列向后矩阵
m = 1;
for j = dccol+1:1:dcol
    for i = 1:drow
        mat2(i,j) = mat1(i,ccol+stepNUM*m);
    end
    m = m + 1;
end
%% 输出
outmat = mat2;



%%%%%%%%%% 初版 %%%%%%%%%%%
% 备注：可能会错过中心行
% m = 1;
% n = 1;
% for i = 1:step:r
%     for j = 1:step:c
%         outmat(m,n) = inmat(i,j);
%         n = n+1;
%     end
%     n = 1;
%     m = m+1;
% end

end
