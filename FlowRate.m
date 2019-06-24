function fRate =  FlowRate(w, R)
    fun = @(x) w .* x;
    %fRate = R .* integral(@(x)fun(x,w), 0, 1,'ArrayValued', true);
%     fRate = 2*pi*R^2 .* integral(@(x)fun(x,w), 0, 1,'ArrayValued', true);
    fRate = R .* integral(fun, 0, 1,'ArrayValued', true);
end