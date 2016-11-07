%% Initilize

% Basic
L       = 1; % length env.
H       = 1; % height env.

for nrNodes = 10; %[10 20 40];
    x       = linspace(0,L,nrNodes);
    y       = linspace(0,H,nrNodes);
    
    % BC
    T1      = 10; % Temp. along B1
    T2      = 20; % Temp. along B2
    T3      = 15 + 5*x/L; % temp along B3
    dT_dx   = 0; % along B4
    
    
    % Grid
    T       = ones(nrNodes+1,nrNodes+1);
    % Surronding the squares with boundary.
    T(1,:)  = T3; % B3
    T(end,:)= T1; % B1
    T(:,1)  = T4; % B4
    T(:,end)= T1; % B1
    
    F       = % Flux
    A       = 1/nrNodes; % Face length between cells (eqidistant case)
    
    
    % Properties
    c1      = 25;
    c2      = 0.3;
    %k
    %b
    
    %% Offsets
    s       = size(T);
    N       = 2;
    [cc1{1:N}]= 1:3;
    cc2(1:N) ={2};
    offsets = sub2ind(s,cc1{:}) - sub2ind(s,c2{:});
    a_ij    = [1.4,1,1.4;1,1.4,1;1.4,1,1.4];
    %% Loop
    for tol = [0.001]
        while  epsilon > tol
            
            % Update properties
            k       = 2*(1+20*T/T1); % Coefficient of conductivity
            b       = 15*(c1-c2*T^2); % Heat source over the whole computational domain
            b       = b/(nrNodes^2); % for each square
            
            for i = 1:(nrNodes+1)^2 
                if i<11 || i>109 || mod(i,11)== 0 || mod(i,11)== 1
                    %% Core
                    %Now, for any linear index in your matrix L, you can get all its neighbors by doing
                    neighbors = T(i+offsets); % all 8 neigbours.
                    T_NEW(i) = sum(sum(a_ij^-1.*neighbors))/9 + b; % invented this.
                    
                    if mod(i,11) == 2 || mod(i,11) == 11 || i < 22 || i > 109
                        flux(i) = A*(T_NEW(i)-T(i))*k(i);
                    end
                    
                    T(i) = T_NEW(i);
                end
            end
            
            
            F = sum(flux);
            epsilon = 1/F*(sum(a_E*T(i+1,j)+a_W*T(i-1,j)+a_N*T(i,j+1)+a_S*T(i,j-1)+S_u-a_P*T(i,j)));
        end
    end
end
%quiver plot command
