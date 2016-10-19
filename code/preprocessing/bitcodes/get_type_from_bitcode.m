function type = get_type_from_bitcode(b)

if (b <= 3 )
   type = 'wBlank'; %0
end

if ( (b > 3 ) && ( b <= 6) )
   type = 'bBlank'; %1
end

if ( (b > 6 ) && ( b <= 22) )
   type = 'grats_Stat'; %2
end

if ( (b > 22 ) && ( b <= 50) )
   type = 'bars_Stat'; %3
end

if ( (b > 50 ) && ( b <= 166) )
   type = 'obj_Stat'; %4
end

if ( (b > 166 ) && ( b <= 230) )
   type = 'grats_Mov'; %5
end

if ( (b > 230 ) && ( b <= 246) )
   type = 'bars_Mov'; %6
end

if ( (b > 246 ) && ( b <= 310) )
   type = 'obj_Mov'; %6
end

if ( (b > 310 ) && ( b <= 342) )
   type = 'dots_Mov'; %6
end





end