Using Multi-Variable Linear Regression for Prediction
=====================================================

This specific folder contains an example of using multi-variable linear regression to predict
future city populations. But understand that by just giving a different ```inputTrainingSet.txt``` 
file you can easily use multi-variable linear regression to predict something you want!

<h2>How To Use This Code</h2>
1. install Octave or Matlab 

2. fork this repo and clone it locally!

3. navigate to the folder with the above files

4. type ```run``` in Octave or Matlab command line

<h2>Linear Regression In Multiple Variables Review</h2>

+ Linear Regression in multiple variables with training set
    - Multiple features/variables
        + n = number of features
        + x^(i) = input (features) of ith training example
        + (x_j)^(i) = value of feature j in ith training example
        + h(x) = theta_0 + theta_1 * x_1 + theta_2 * x_2 + ...
        theta_n * x_n
        + if x_0 = 1, then vector x = [x_0; x_1; ... x_n]
        + and vector theta = [theta_0; theta_1; ... theta_n]
        + COOL THING: we can rewrite h(x) = X * theta
        + NOTE: h(x) = theta^T * x where T is transpose and x is a vector of 1 training example
        + J(theta) = (1/2m)(Sum from i = 1 to m of (h(x^(i))-y^(i))^2 )
        + <b>We want to find which theta gives us the smallest cost J(theta)! By using gradient descent.</b>
        + Remember that GRADIENT DESCENT = algorithm that lets us find the theta vector that gives us the minimal cost!!!
    - Gradient Descent
        + formula = Then, one iteration of updating theta_j is given as:  
        ![alt text](https://raw.github.com/quinnliu/MachineLearning/master/imagesForExplanation/equations/gradientDescentUpdateTheta_j.gif)
        + problems with gradient descent is shown here:  
        ![alt text](https://raw.github.com/quinnliu/MachineLearning/master/imagesForExplanation/GradientDescentWithMutlipleLocalMinimum.jpg)

    - Feature Scaling = technique for making gradient descent work better = make sure features are on a similar scale
        + For example, if x_1 has a range of values from 0 - 2000 and x_2 has a range of values from 0 - 5
        inverse both values so x_1 = 1/(x_1) and x_2 = 1/(x_2) making both features take on a range of values from
        0 < x_i < 1. Your goal is to get every feature approximately in the range -1 < x_i < 1.
    - Mean normalization = technique for making gradient descent work better = replace x_i with x_i - mu_i to make
    features have approximately zero mean (Do NOT apply to x_0 = 1).
        + new x_i = (x_i - mu_i)/s_i where mu_i is the average value of x_i in training set and s_i is the range of the training set of is the standard deviation of the training set.
    - Picking the Learning Rate Problem:
       + if alpha is too small, there will be a slow convergence. Solution = picker larger alpha.
       + if alpha is too large, J(theta) may not decrease during each iteration of gradient decent and will not converge. Solution = picker smaller alpha.
    - Polynomial Regressioin
       + if your traning data is not lineary distributed you may consider making your h_theta(x) function quadratic or cubic. This can be done even if you only have one feature. For example:
       + you currently have h_theta(x) = theta_0 + theta_1 * x_1 but your data isn't LINEAR
       + so rewrite as h_theta(x) = theta_0 + theta_1 * x_1 + theta_2 * (x_1)^2 giving you are quadratic function
    - Normal Equation = method to solve for theta at once instead of iteratively with gradient descent
       + To understand the reason behind this method first image you have a quadratic equation of the form
       J(theta) = a*theta^2 + b*theta + c
       + to find the value of theta that will give you the smallest value of J(theta) you would take the derivative of J(theta), set the derivative to 0, and then solve for theta.
       + This is the exact same that will be done for the cost function J(theta_0, theta_1, ..., theta_m) instead of J(theta)
       + where theta = (X^T * X)^-1 * X^T * y and can be coded as ```pinv(X' * X) * X' * y```
    - When to use Normal Equation vs. Gradient Descent
       + m = # of training examples, n = # of features, alpha = learning rate in gradient descent
         
         |When to use Normal vs. Gradient Descent|Pros                                   |Cons                                   |
         |:-------------------------------------:|:-------------------------------------:|:-------------------------------------:|
         |Gradient Descent                       |works well even when n is large        |need to choose alpha                   |
         |                                       |                                       |needs many iterations                  |
         |Normal Equation                        |no need to choose alpha                |slow if n is very large                |
         |                                       |don't need to iterate                  |doesn't work for logistic regression   |

       + General Rule = <b>If # of features is > 10,000 use Normal Equation, otherwise use Gradient Descent</b>
       + NOTE: the Normal equation is slow on mordern computers in 2013 when n > 10,000 because we need to compute (X^T * X)^-1 which will take O(n^3) time for inversing the matrix. If n > 10^4 then you should use gradient decent instead.