function fRate =  FlowRate(w, R)
    fun = @(x) w .* x;
    fRate = R .* integral(fun, 0, 1,'ArrayValued', true);
end