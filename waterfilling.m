function [P_alloc, water_level] = waterfilling(H, P_total, N0, epsilon)
% Inputs
%  H: The array of channel gains for each subcarrier. Each element
%    represents the gain of a subcarrier. For waterfilling, only the 
%    magnitude squared (|H|^2) is relevant.
%  P_total : The total power budget available for allocation 
%  N0 : The noise power spectral density. Assumed to be constant.
%  epsilon : Tolerance factor for the binary search algorithm. Defines a small threshold for when binary search stops.
%
% Outputs
%  P_alloc : The power allocated to each subcarrier. This array has the 
%  same dimensions as H and contains the power for each subcarrier to 
%  maximize the overall channel capacity under the given constraints.
%  water_level : The final water level (lambda) achieved in the 
%  waterfilling algorithm. Subcarriers with a channel gain to noise ratio
%  above this level receive power, while others do not.
  
    if nargin <  4 
        epsilon =  1e-11;
    end
    
    num_channels = length(H);
    
    % Convert gains to equivalent channel noise levels for water-filling
    channel_levels =  N0 ./  abs(H.^2);
    
    l =  0;
    u = max(channel_levels) + P_total / num_channels;
    
    while u - l > epsilon
        mid = (u + l) /  2;
        power_allocation_temp = max(0, mid - channel_levels);
        
        if sum(power_allocation_temp) > P_total
            u = mid;
        else
            l = mid;
        end
    end
    
    water_level = (u + l) /  2;
    P_alloc = max(0, water_level - channel_levels);

end
function [P_alloc, water_level] = waterfilling(H, P_total, N0, epsilon)
% Inputs
%  H: The array of channel gains for each subcarrier. Each element
%    represents the gain of a subcarrier. For waterfilling, only the 
%    magnitude squared (|H|^2) is relevant.
%  P_total : The total power budget available for allocation 
%  N0 : The noise power spectral density. Assumed to be constant.
%  epsilon : Tolerance factor for the binary search algorithm. Defines a small threshold for when binary search stops.
%
% Outputs
%  P_alloc : The power allocated to each subcarrier. This array has the 
%  same dimensions as H and contains the power for each subcarrier to 
%  maximize the overall channel capacity under the given constraints.
%  water_level : The final water level (lambda) achieved in the 
%  waterfilling algorithm. Subcarriers with a channel gain to noise ratio
%  above this level receive power, while others do not.
  
    if nargin <  4 
        epsilon =  1e-11;
    end
    
    num_channels = length(H);
    
    % Convert gains to equivalent channel noise levels for water-filling
    channel_levels =  N0 ./  abs(H.^2);
    
    l =  0;
    u = max(channel_levels) + P_total / num_channels;
    
    while u - l > epsilon
        mid = (u + l) /  2;
        power_allocation_temp = max(0, mid - channel_levels);
        
        if sum(power_allocation_temp) > P_total
            u = mid;
        else
            l = mid;
        end
    end
    
    water_level = (u + l) /  2;
    P_alloc = max(0, water_level - channel_levels);

end
