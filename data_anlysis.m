ratio_gps_x_mat = [];
ratio_gps_y_mat = [];
ratio_aprox_x_mat = [];
ratio_aprox_y_mat = [];
    

for i = 1:length(Vehicles)
    vehicles_i = Vehicles(i);
    vehicles_id = vehicles_i.id;
    true_pos_vec = vehicles_i.logger.position;
    true_pos_vec = true_pos_vec(2:end-1,:);
    true_pos_vec(:,[2]) = [];
    aprox_pos_vec = vehicles_i.logger.self_aprox;
    gps_vec = vehicles_i.logger.GPS;
    gps_vec = gps_vec(2:end-1,:);
    gps_vec(:,[2]) = [];
    ratio_gps = gps_vec./ true_pos_vec;
    ratio_gps_x = ratio_gps(:,1);
    ratio_gps_y = ratio_gps(:,2);
    ratio_aprox =  aprox_pos_vec./ true_pos_vec;
    ratio_aprox_x = ratio_aprox(:,1);
    ratio_aprox_y = ratio_aprox(:,2);
    
    ratio_gps_x_mat = [ratio_gps_x_mat ratio_gps_x];
    ratio_gps_y_mat = [ratio_gps_y_mat ratio_gps_y];
    ratio_aprox_x_mat = [ratio_aprox_x_mat ratio_aprox_x];
    ratio_aprox_y_mat = [ratio_aprox_y_mat ratio_aprox_y];
end

max_ratio_gps_x = max(ratio_gps_x_mat,[],2);
max_ratio_gps_y = max(ratio_gps_y_mat,[],2);
max_ratio_aprox_x = max(ratio_aprox_x_mat,[],2);
max_ratio_aprox_y = max(ratio_aprox_y_mat,[],2);

figure; 
plot(max_ratio_gps_x,'DisplayName','ratio gps x')
hold on
plot(max_ratio_aprox_x,'DisplayName','ratio aprox x')
legend

figure; 
plot(max_ratio_gps_y,'DisplayName','ratio gps y')
hold on
plot(max_ratio_aprox_y,'DisplayName','ratio aprox y')
legend