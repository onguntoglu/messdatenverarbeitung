function reply=HM8150_query(s,command)
    fprintf(s,command);
    reply = fscanf(s);
end