function [c, r] = castAndRound(points, k, intClass)

if ~isobject(points)
    c = cast(round(points(k,1)), intClass);
    r = cast(round(points(k,2)), intClass);
else
    c=0;
    r=0;
end