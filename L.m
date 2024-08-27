function [Lgf] = L(f,g)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Lgf=jacobian(g)*f;
end