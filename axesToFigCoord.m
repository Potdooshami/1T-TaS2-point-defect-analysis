function p_fig = axesToFigCoord(ax, p_ax)
    % AXESTOFIGCOORD Converts a point from axes coordinates to normalized figure coordinates.
    % 
    % INPUT:
    %   ax   - Handle to the axes.
    %   p_ax - 1x2 vector [x, y] in axes coordinates.
    %
    % OUTPUT:
    %   p_fig - 1x2 vector [x, y] in normalized figure coordinates.
    %
    % Get the axes position in normalized figure units
    ax_pos = get(ax, 'Position');
    
    % Convert axes coordinates to normalized position within the axes
    xlim = get(ax, 'XLim');
    ylim = get(ax, 'YLim');
    norm_x = (p_ax(1) - xlim(1)) / (xlim(2) - xlim(1));
    norm_y = (p_ax(2) - ylim(1)) / (ylim(2) - ylim(1));
    
    % Convert normalized axes coordinates to figure normalized coordinates
    p_fig(1) = ax_pos(1) + norm_x * ax_pos(3);
    p_fig(2) = ax_pos(2) + norm_y * ax_pos(4);
end