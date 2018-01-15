function validPoints = extractValidPoints(points, idx)
if isnumeric(points)
    validPoints = points(idx,:);
else    
    if isempty(coder.target)
        validPoints = points(idx);
    else
        validPoints = getIndexedObj(points, idx);
    end
end
end
