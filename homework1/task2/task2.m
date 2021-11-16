clear
% read image
image = rgb2gray(im2double(imread('64\file4.png')));
% figure, imshow(image)
% perform transformation
f = @(block_struct) dct_shear(block_struct.data);
t = blockproc(image, [8, 8], f);
figure, imshow(t)


function t = dct_shear(o)
% by default 8 * 8 blocking

% perform DCT transformation
M = 8;
N = 8;
inter = double(zeros(M, N));
for m = 1:M
    for n = 1:N
        for i = 1:M
            for j = 1:N
                inter(m, n) = inter(m, n) + o(i, j) * cos((2 * i - 1) * (m - 1) * pi / (2 * M)) * cos((2 * j - 1) * (n - 1) * pi / (2 * N));
            end
        end
        if (m==1)
            ci = 1/sqrt(M);
        else
            ci = sqrt(2/M);
        end
        if (n==1)
            cj = 1/sqrt(N);
        else
            cj = sqrt(2/N);
        end
        inter(m, n) = inter(m, n) * ci * cj;
    end
end

% shear some of the diagonal elements

for i = 0:M-1
    for j = 0:N-1
        if i+j >= 1
            inter(i+1, j+1) = 0;
        end
    end
end

% perform IDCT transformation

t = double(zeros(M, N));
for m = 1:M
    for n = 1:N
        for i = 1:M
            for j = 1:N
                if (i==1)
                    ci = 1/sqrt(M);
                else
                    ci = sqrt(2/M);
                end
                if (j==1)
                    cj = 1/sqrt(N);
                else
                    cj = sqrt(2/N);
                end
                t(m, n) = t(m, n) + ci * cj * double(inter(i, j)) * cos((2 * m - 1) * (i - 1) * pi / (2 * M)) * cos((2 * n - 1) * (j - 1) * pi / (2 * N));
            end
        end
    end
end

end
