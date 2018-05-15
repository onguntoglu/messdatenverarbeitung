function exportKoeff(coeff)
    % string constants
    ordDef   = '#define FILTER_ORD';
    coeffDef = '#define FIR_COEFF';

    % open file
    fid = fopen('filter_coeff.h','w');
    
    % write filter order to file
    fprintf(fid,'%s %i\n',ordDef,length(coeff));
    
    % write coefficients to file
    fprintf(fid,'%s %i',coeffDef,coeff(1));
    fprintf(fid,',%i',coeff(2:end));
    
    % close file
    fclose(fid);
end