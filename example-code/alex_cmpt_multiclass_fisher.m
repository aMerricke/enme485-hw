function fscore=cmpt_multiclass_fisher(X,y)
    uniclass = unique(y);

    
    for k = 1:2

            idxk = find( y==uniclass(k) ); nk = length(idxk);
            Xk = X(idxk,:);
            
            num(k,:) = nk.*( mean(Xk) - mean(X) ).^2;
            den(k,:) = nk.*(var(Xk) );

    end
    
    fscore = sum(num) ./ sum(den);

end