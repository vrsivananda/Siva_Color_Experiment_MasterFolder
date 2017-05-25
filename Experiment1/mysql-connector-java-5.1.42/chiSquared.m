function output = chiSquared(y,y_pred)
    n = length(y);
    sumSquared = 0;
    for i = 1:n
        value = ((y(i)-y_pred(i))^2)/y_pred(i);
        sumSquared = sumSquared + value;
    end
    output = sumSquared;
end