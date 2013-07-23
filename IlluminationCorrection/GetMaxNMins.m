function minNmax = GetMaxNMins(FlAv, AFAv, BGAv, poly)

%Create the estimated meshes
[ X,Y ] = meshgrid(1:1:size(FlAv,1),1:1:size(FlAv,2));
Z = [ X(:).^4 Y(:).^4 X(:).*Y(:).^3 X(:).^3.*Y(:) X(:).^2.*Y(:).^2  ... 4th
    X(:).^3 Y(:).^3 X(:).*Y(:).^2 X(:).^2.*Y(:)                     ... 3rd
    X(:).^2 Y(:).^2 X(:).*Y(:)                                      ... 2nd
    X(:) Y(:) ];                                                    %   1st
    ZAF = Z-repmat(poly(2).meanInd,[size(Z,1) 1]);
ZAF = ZAF./repmat(poly(2).normInd,[size(ZAF,1) 1]);
% ZAF = exp((ZAF*WAF).*repmat(normAFVal,[length(ZAF) 1]));
ZAF = ZAF*poly(2).coeffs';%.*normAFVal+repmat(meanAFVal,[length(ZAF) 1]);
ZAF = reshape(ZAF,size(X,1),size(X,2));

ZFl = Z-repmat(poly(1).meanInd,[size(Z,1) 1]);
ZFl = ZFl./repmat(poly(1).normInd,[size(ZFl,1) 1]);
% ZFl = exp((ZFl*WFl).*repmat(normFlVal,[length(ZFl) 1]));
ZFl = ZFl*poly(1).coeffs';%.*normFlVal+repmat(meanFlVal,[length(ZFl) 1]);
ZFl = reshape(ZFl,size(X,1),size(X,2));
ZFl = (ZFl+ZAF)./2;

ZBG = Z-repmat(poly(3).meanInd,[size(Z,1) 1]);
ZBG = ZBG./repmat(poly(3).normInd,[size(ZBG,1) 1]);
% ZBG = exp((ZBG*WBG).*repmat(normBGVal,[length(ZBG) 1]));
ZBG = ZBG*poly(3).coeffs';%.*normBGVal+repmat(meanBGVal,[length(ZBG) 1]);
ZBG = reshape(ZBG,size(X,1),size(X,2));

%Figure out the places in the image where the max and the min for the polys
%are located and get corresponding image values
FlAv = log(FlAv);
AFAv = log(AFAv);
BGAv = log(BGAv);

AFMaxInd = GetDialatedMinMaxIndices( ZAF, 1 );
AFMax = GetTenPCMinMaxVals( AFMaxInd, AFAv, 1 );
AFMinInd = GetDialatedMinMaxIndices( ZAF, 0 );
AFMin = GetTenPCMinMaxVals( AFMinInd, AFAv, 0 );

FlMaxInd = GetDialatedMinMaxIndices( ZFl, 1 );
FlMax = GetTenPCMinMaxVals( FlMaxInd, FlAv, 1 );
FlMinInd = GetDialatedMinMaxIndices( ZFl, 0 );
FlMin = GetTenPCMinMaxVals( FlMinInd, FlAv, 0 );

BGMaxInd = GetDialatedMinMaxIndices( ZBG, 1 );
BGMax = GetTenPCMinMaxVals( BGMaxInd, BGAv, 1 );
BGMinInd = GetDialatedMinMaxIndices( ZBG, 0 );
BGMin = GetTenPCMinMaxVals( BGMinInd, BGAv, 0 );
%Very noisy use AF range
% BGMin = BGMax-(AFMax-AFMin);

minNmax = struct;
minNmax(1).min = FlMin;
minNmax(1).max = FlMax;
minNmax(2).min = AFMin;
minNmax(2).max = AFMax;
minNmax(3).min = BGMin;
minNmax(3).max = BGMax;

end  