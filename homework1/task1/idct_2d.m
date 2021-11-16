function t=idct_2d(o, M, N)

% perform DFT transformation for M * N matrix

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
                t(m, n) = t(m, n) + ci * cj * o(i, j) * cos((2 * m - 1) * (i - 1) * pi / (2 * M)) * cos((2 * n - 1) * (j - 1) * pi / (2 * N));
            end
        end
    end
end
