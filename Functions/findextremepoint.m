function extreme_point = findextremepoint(matrix)
% 输出极值点的数值及所在行列的位置，包括最大最小点
% 输入参数：任意二维矩阵
% 输出参数：max_value,min_value,max_row,max_col,min_row,min_col

% 工程参数
[row, col] = size(matrix);

% 寻找最大值最小值
origin_max = matrix(1,1);
origin_min = matrix(1,1);
for i=1:row
    for j=1:col
        if matrix(i,j) >= origin_max
            origin_max = matrix(i,j);
            max_row = i;
            max_col = j;
        end
        if matrix(i,j) <= origin_min
            origin_min = matrix(i,j);
            min_row = i;
            min_col = j;
        end
    end
end
max_value = max(max(matrix));
min_value = min(min(matrix));
extreme_point = [max_value,min_value,max_row,max_col,min_row,min_col];
end