
function posType = mainFindCheckers()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    whiteCheckerImage = removeNoiseWhiteCheckers();
    whiteCheckerImage = distanceTransform(whiteCheckerImage);
    whiteCenters = findCenter(whiteCheckerImage,'w');
    redCheckerImage = removeNoiseRedCheckers();
    redCheckerImage = distanceTransform(redCheckerImage);
    redCenters = findCenter(redCheckerImage, 'r');
    posType= [whiteCenters;redCenters];
    saveInFile('test.txt',posType);
end

