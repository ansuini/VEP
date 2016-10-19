function type_electrode = get_type_electrode(experiment)

switch experiment
    case 'shape_and_motion'
        type_electrode = '4_shank_32';
    otherwise
        type_electrode = '1_shank_32';
end

end