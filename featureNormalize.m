function [X_norm, mu, sigma] = featureNormalize(X)
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));
numberOfColumnsInX_norm = columns(X_norm);
for i = 1:numberOfColumnsInX_norm, 
	meanOfCurrentFeatureInX = mean(X(:, i));
	mu(:, i) = meanOfCurrentFeatureInX;

	X_norm(:, i) = X_norm(:, i) .- mu(:, i);

	standardDeviationOfCurrentFeatureInX = std(X(:, i));
	sigma(:, i) = standardDeviationOfCurrentFeatureInX;

	X_norm(:, i) = X_norm(:, i) ./ sigma(:, i);
end
end


