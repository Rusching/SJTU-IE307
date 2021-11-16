function t=dct_2d(o, M, N)

% perform DCT transformation for M * N matrix

t = double(zeros(M, N));
for m = 1:M
    for n = 1:N
        for i = 1:M
            for j = 1:N
                t(m, n) = t(m, n) + o(i, j) * cos((2 * i - 1) * (m - 1) * pi / (2 * M)) * cos((2 * j - 1) * (n - 1) * pi / (2 * N));
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
        t(m, n) = t(m, n) * ci * cj;
    end
end
