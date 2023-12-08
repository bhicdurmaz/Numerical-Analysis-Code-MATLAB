function [t, y] = trapezMethod(f, y0, tspan, h)
    % Trapezoidal method for solving ODEs
    
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

    % Trapezoidal method loop
    for i = 2:numSteps + 1
        % Implicit step: solve the nonlinear equation using a solver (fsolve in this case)
        y(i) = fsolve(@(ynext) ynext - y(i - 1) - 0.5 * h * (f(t(i), ynext) + f(t(i-1), y(i-1))), y(i - 1));
    end
end