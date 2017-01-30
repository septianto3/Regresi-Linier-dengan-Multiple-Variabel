function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, numberOfIterations)
m = length(y);
J_history = zeros(numberOfIterations, 1); 
for iteration = 1:numberOfIterations
    hypothesis = X * theta;
    errors = hypothesis .- y;
    newDecrement = (alpha * (1/m) * errors' * X); 
    theta = theta - newDecrement';
    J_history(iteration) = computeCostMulti(X, y, theta);
end
end


