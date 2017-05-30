% p(1) = alpha  = bias / mean / threshold / PSE
% p(2) = beta   = slope
% p(3) = gamma  = guess rate
% p(4) = lambda = lapse rate

function output = inverseCumulativeGaussian(p,y)
    output = (sqrt(2)/(-p(2)))*(erfcinv((2*(y-p(3)))/(1-p(3)-p(4))))+p(1);
end