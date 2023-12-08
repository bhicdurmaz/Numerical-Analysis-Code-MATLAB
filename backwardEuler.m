function [t, y] = backwardEuler(f, y0, tspan, h)
    % Backward Euler method for solving ODEs
    
    % Input:
    %   - f: function handle for the ODE (dy/dt = f(t, y))
    %   - y0: initial condition
    %   - tspan: time span [t_start, t_end]
    %   - h: time step size
    
    % Output:
    %   - t: vector of time points
    %   - y: vector of corresponding solution values

    % Number of time steps
    numSteps = round((tspan(2) - tspan(1)) / h);

    % Initialize arrays
    t = linspace(tspan(1), tspan(2), numSteps + 1);
    y = zeros(size(t));
    y(1) = y0;

    % Backward Euler method loop
    for i = 2:numSteps + 1
        y(i) = fsolve(@(ynext) ynext - y(i - 1) - h * f(t(i), ynext), y(i - 1));
    end
end