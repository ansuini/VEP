function code = get_code_from_area(area)

switch area
    
   case 'V1b'
       
        code=0;
        
   case 'LM'
       
        code=1;
        
        
   case 'AL'
        
        code=2;
        
   case 'LI'
       
        code=3;
           
   case 'LL'
        
        code=4;
        
   case 'LLb'
        
        code=5;
        
    
   case 'AM'
       
        code=6;
        
        
    case 'LM?'
        
        code=7;
        
    otherwise
       
      code=-1;
      
      fprintf(area);
      fprintf('\n');
      fprintf('Warning : non-existing area ! \n');
      
end

end

