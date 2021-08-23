%% 入参为D50光源下，ProPhotoRGB空间的RGB转XYZ矩阵
%% 获得修正后的D50光源下，ProPhotoRGB空间的RGB转XYZ矩阵
function colorSpace = ColorSpace_setMatrixToPCS(M)
% colorSpace = ColorSpace_setMatrixToPCS(M)
% Author: JesseChen

W1 = M * [1.0; 1.0; 1.0];
W2 = PCStoXYZ();
% [1.0,1.0,1.0]对应的XYZ坐标，与D50白点的XYZ坐标间相差的放大倍数。 啥含义？？应该都是1吧
s0 = W2(1) / W1(1);
s1 = W2(2) / W1(2);
s2 = W2(3) / W1(3);

S = [s0 0 0; 0 s1 0; 0 0 s2];
colorSpace.fMatrixToPCS = S * M;
colorSpace.fMatrixFromPCS = inv(colorSpace.fMatrixToPCS);


%% 返回D50光源下，白色物体的XYZ坐标
function xyz = PCStoXYZ()
% xyz = PCStoXYZ()
% Author: JesseChen

D50_xy = [0.3457; 0.3585];
xyz = XYtoXYZ(D50_xy);
