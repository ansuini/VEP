function bitcodes = get_organized_bitcodes()

% to complete !

% static

bcBlanks = get_blanks();
bcBlanks = bcBlanks';

bcStatGrats = reshape(get_static_gratings(), 4*4, 1); 

% to organize positionally

bcStatBars = reshape(get_static_bars(), 28, 1); 
bcStatObj = reshape([51:1:166], 116, 1);

bcStatic = [bcBlanks; bcStatGrats; bcStatBars; bcStatObj];


% motion 

% moving gratings : organized with contiguous directions

bcMovingGrats = reshape(get_moving_gratings(), 8*8,1);
bcMovingBars = reshape(get_moving_bars(), 2*8 , 1);
bcMovingObjs = reshape(get_moving_objects(), 8*8 , 1);
bcMovingDots = reshape(get_moving_dots(), 4*8,1);

% all


bitcodes.blanks = bcBlanks;
bitcodes.static_gratings = bcStatGrats;
bitcodes.static_bars = bcStatBars;
bitcodes.static_objects = bcStatObj;

bitcodes.moving_gratings = bcMovingGrats;
bitcodes.moving_dots = bcMovingDots;
bitcodes.moving_bars = bcMovingBars;
bitcodes.moving_objs = bcMovingObjs;


bcMoving = [bcMovingGrats; bcMovingDots; bcMovingBars; bcMovingObjs];


bitcodes.bitcodes = [bcStatic; bcMoving];



end