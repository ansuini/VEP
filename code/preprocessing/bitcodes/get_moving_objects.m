function BCS = get_moving_objects()

g = [255, 303, 263, 287, 247, 295, 271, 279];

% slow four objects

BCS(1, :) = g;
BCS(2, :) = g + 2;
BCS(3, :) = g + 4;
BCS(4, :) = g + 6;

% fast four objects

BCS(5, :) = g + 1;
BCS(6, :) = g + 3;
BCS(7, :) = g + 5;
BCS(8, :) = g + 7;



end