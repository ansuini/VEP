function BCS = get_static_objects()

g = [51, 55, 59, 63, 67]; % ent size transformations
BCS.size(:, 1) = g';
BCS.size(:, 2) = g' + 1 ;
BCS.size(:, 3) = g' + 2;
BCS.size(:, 4) = g' + 3;

BCS.position = [];
BCS.azimuth = [];




end

