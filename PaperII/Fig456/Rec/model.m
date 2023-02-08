function U = model(parameters,X,Y,Z)

XYZ = [X;Y;Z];

numLayers = numel(fieldnames(parameters))/2;

% First fully connect operation.
weights = parameters.fc1_Weights;
bias = parameters.fc1_Bias;
U = fullyconnect(XYZ,weights,bias);

% tanh and fully connect operations for remaining layers.
for i=2:numLayers
    name = "fc" + i;

    U = tanh(U);

    %U = max(0,U);

    weights = parameters.(name + "_Weights");
    bias = parameters.(name + "_Bias");
    U = fullyconnect(U, weights, bias);
end

end
