function output = cumulativeGaussian(x,p)
    n = length(x);
    allY = nan(1,n);
    for i = 1:n
        allY(i) = p(3)+(1-p(3)-p(4))*0.5*(erfc((-p(2)).*(x(i)-p(1))./sqrt(2)));
    end
    output = allY;
end