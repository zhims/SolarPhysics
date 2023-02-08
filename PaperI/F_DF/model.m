function U = model(parameters,t)

numLayers = numel(fieldnames(parameters));

% First fully connect operation.
weights = parameters.fc1.Weights;
bias = parameters.fc1.Bias;
U = fullyconnect(t,weights,bias);

% tanh and fully connect operations for remaining layers.
for i=2:numLayers
    name = "fc" + i;

    U = tanh(U);

    %U = max(0,U);

    weights = parameters.(name).Weights;
    bias = parameters.(name).Bias;
    U = fullyconnect(U, weights, bias);
end

end
