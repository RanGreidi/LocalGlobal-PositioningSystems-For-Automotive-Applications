car_loc = [10 15];
grid_size = 0.02;  %length of the box to grid search at
Num_of_cars = 2;
resulotion = 0.01;

init_car_loc = [car_loc(1)-grid_size/2 car_loc(2)-grid_size/2];
v  = repmat(init_car_loc,1,Num_of_cars);
ready = false;
while ~ready
  % use v here
  P = reshape(v,[2,Num_of_cars])';
  disp(P)
  
  
%                   %-------------------------------                        
%                   %liklyhood function calculation
%                   
%                   %first_sum
%                   first_sum = 0;
%                   for i= in_cluster
%                       GPS_loc = [G(i,1) G(i,3)];
%                       first_sum = first_sum + ((norm(p-GPS_loc))^2)/sigma_i;
%                   end
%                   
%                   %second sum
%                   second_sum = 0;
%                   for i=1:length(G) 
%                       for j=1:length(G)
%                       second_sum = second_sum + 0;                           
%                       end
%                   end
%                   ML_p = 0 ;
%                   if ML_p < min_ML
%                       argmin_ML = p;
%                       min_ML = ML_p;
%                   end
%                   
  
  
  %---calc new P for grid search---
  ready = true;       % Assume that the WHILE loop is ready
  for k = 1:1:length(v)
    v(k) = v(k) + resulotion;
    if mod(k,2) ~= 0 %x axis for boundry
         if v(k) <= init_car_loc(1)+grid_size
          ready = false;  % WHILE loop is not ready now
          break;          % v(k) increased successfully, leave "for k" loop
        end       
    end    
    
    if mod(k,2) == 0 %y axis for boundry
        if v(k) <= init_car_loc(2)+grid_size
          ready = false;  % WHILE loop is not ready now
          break;          % v(k) increased successfully, leave "for k" loop
        end
    end

    
    if mod(k,2) ~= 0
        v(k) = init_car_loc(1);
    end
    if mod(k,2) == 0
        v(k) = init_car_loc(2);
    end    
    %v(k) = grid_loc;  % v(k) reached the limit, reset it and iterate v(k-1)
  end
end
