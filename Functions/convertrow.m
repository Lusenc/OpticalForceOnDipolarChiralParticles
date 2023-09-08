function mat2 = convertrow(mat1)
%convertrow 用于将矩阵的行反转
%   举例：第一行与最后一行交换，第二行与倒第二行交换，以此类推

[row, col] = size(mat1);
mat2 = zeros(row, col);

for i = 1:row
    mat2(i,:) = mat1(row+1-i,:);
end

end