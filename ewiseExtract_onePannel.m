%[text] Maybe in Loop
V = 1000*map.vm;
ax = gca;
[vv, vi] = min(abs(V-Vfcs));
views(Gfcs(:,:,vi))
climsc([-2 2]).Standard
SoD.draw(xyT.xyDS(iCr,:),sclSoD,thtSoD,1)
colormap('bone')
xticks([]);yticks([])
resizeAxesToSquare(ax);
insert_valtage(ax,V(vi))
%%
function insert_valtage(ax,V)
str = string(V)+"mV";
xywh = ax.Position;
annotation("textbox",xywh, ...
    "EdgeColor","none", ...
    "String",str, ...
    "HorizontalAlignment","right", ...
    "VerticalAlignment","top", ...
    "Color",[1 1 1]*.3);
end

function resizeAxesToSquare(ax)
    % Validate input
    if nargin < 1 || ~isgraphics(ax, 'axes')
        error('Input must be a valid axes handle.');
    end

    % Get current axes position
    originalUnits = ax.Units;
    ax.Units = 'pixels';
    axPosition = ax.Position;

    % Determine the minimum dimension
    minDimension = min(axPosition(3:4));

    % Calculate new position to maintain center alignment
    newX = axPosition(1) + (axPosition(3) - minDimension) / 2;
    newY = axPosition(2) + (axPosition(4) - minDimension) / 2;

    % Set new position
    ax.Position = [newX, newY, minDimension, minDimension];

    % Restore original units
    ax.Units = originalUnits;
end


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
