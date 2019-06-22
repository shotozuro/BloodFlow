function fRate =  FlowRate(w, R)
    fun = @(x,w) w./2 .* x.^2;
    fRate = R .* integral(@(x)fun(x,w), 0, 1,'ArrayValued', true);
end