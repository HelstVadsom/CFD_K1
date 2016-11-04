%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To avoid common mistakes, Tips
%
% 1) Check you do not have any negative k 
%
% 2) Calculate the Residual NOT in the same loop of the temperature
%
% 3) everything should be calcualated at the nodes and then interpolated to
% find values at the faces (if necessary)
%
% 4) in implicit treatment of the Neumann boundary condition the proper
% aNorthBoundary should be set to zero first and aP should be then calculated 
%
% 5) Remember that every section could be implemented as a function, to have a more compact code
%
% 6) Follow the coding standard. It will be beneficial for you, and for us 
% in case you need help
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
format long

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfFacesX = 9; 
numberOfNodesX = numberOfFacesX + 1; % This give a 10X10 nodes. The simpliest way is to place the last node on the boundary
numberOfFacesY = 9; 
numberOfNodesY = numberOfFacesY + 1;

% insert your parameters, like domain dimension 
%.......

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize your variable for the entire domain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xFaces = zeros(numberOfFacesX,numberOfFacesY);
yFaces = zeros(numberOfFacesX,numberOfFacesY);
temperatureNode = zeros(numberOfNodesX,numberOfNodesY);
temperatureFacesX = zeros(numberOfFacesX,numberOfNodesY);
temperatureFacesY = zeros(numberOfNodesX,numberOfFacesY);
%..........
%..........
%..........
aWest = zeros(numberOfNodesX,numberOfNodesY);
aEast= zeros(numberOfNodesX,numberOfNodesY);
aSouth = zeros(numberOfNodesX,numberOfNodesY);
aNorth = zeros(numberOfNodesX,numberOfNodesY);
aP = zeros(numberOfNodesX,numberOfNodesY);
%..........
%..........

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equidistant Grid Generator Example 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
deltaX = lengthDomain/(numberOfFaces - 1); %this might varies for non equidistant case
xFaces(1,:) = 0;
xFaces(numberOfFaces,:) = lengthDomain;
for j = 1:numberOfFacesY
    for i = 2:numberOfFacesX - 1
        xFaces(i,j) = xFaces(i - 1,j) + deltaX;
    end
end
%...........
%...........

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Boundary defition according to your case (Dirichlet)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%...........
%...........


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while  (errorCalculated > threshold) %you might want to start looping over some iterations to see if everything works
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % k calculation at the nodes
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %...........
    %...........

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % k calculation at the faces
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %...........
    %...........    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % coefficient calculation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    for j = 2:numberOfNodesY - 1 %last and first nodes are boundaries
        for i = 2:numberOfNodesX -1
            %.....
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculate boundaries separately and source term if you need it
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    %...........
    %...........    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Gauss seidel iteration (calculate temperature)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    %...........    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculate residual
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    %...........      
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculate boundary flux (to normalize the residual)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    %...........  
    %........... 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculate the errorCalculated
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    %...........      
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate fluxes in all cells
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%...........  
%...........

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






