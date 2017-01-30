function J = computeCostMulti(X, y, theta)
m = length(y);
J = 0;
hypothesis = X * theta;
errors = hypothesis .- y;
squareOfErrors = (errors).^2;
sumOfSquareErrors = sum(squareOfErrors);
J = 1/(2 * m) * sumOfSquareErrors;
end

