function MatchingFeatures =  FindSingleCorr(SSDrow, threshold)
x =0;
match = 0;
    for i = 1:length(SSDrow)
        if SSDrow(1,i) < threshold
            x = x+1;
            match(1,x) = i;
        end
    end
    for j = 1:length(match)-1
    if SSDrow(match(j)) < SSDrow(match(j+1))
        match = match(j);
    end
    end

    MatchingFeatures = match;
end

