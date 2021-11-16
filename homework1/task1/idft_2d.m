function t=idft_2d(o, M, N)

% perform DFT transformation for M * N matrix

t = double(zeros(M, N));
for m = 0:M-1
    for n = 0:N-1
        for p = 0:M-1
            for q = 0:N-1
                t(m+1, n+1) = t(m+1, n+1) + double(o(p+1,q+1)) * exp(((2i)*pi)*((double(m*p)/M)+(double(n*q)/N)));
            end
        end
    end
end