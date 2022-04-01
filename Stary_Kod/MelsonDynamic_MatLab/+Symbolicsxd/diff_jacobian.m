function [ Jacobian ] = diff_jacobian( r, q )
    for i=1:length(r)
        for j=1:length(q)
            Jacobian(i,j) = diff( r(i), q(j) );
        end
    end        
end

