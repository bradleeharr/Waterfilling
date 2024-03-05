# Waterfilling

Power allocation using the waterfilling algorithm with binary search.
    This function allocates power across subcarriers in an OFDM system 
    to maximize the channel capacity under a total power constraint using the
    waterfilling principle, which allocates more power to better channels.

```
Inputs
  * H: The array of channel gains for each subcarrier. Each element represents the gain of a subcarrier. For waterfilling, only the magnitude squared (|H|^2) is relevant.
  * P_total : The total power budget available for allocation across all subcarriers.
  * N0 : The noise power spectral density. Assumed to be constant across all subcarriers.
  * epsilon : Tolerance factor for the binary search algorithm. Defines a small threshold for when binary search stops.

Outputs
  * P_alloc : The power allocated to each subcarrier. This array has the same dimensions as H and contains the power for each subcarrier to maximize the overall channel capacity under the given constraints.
  * water_level : The final water level (lambda) achieved in the waterfilling algorithm. Subcarriers with a channel gain to noise ratio above this level receive power, while others do not.```
```
  
