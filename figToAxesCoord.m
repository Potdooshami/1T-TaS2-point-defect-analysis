function p_ax = figToAxesCoord(ax, p_fig)
    % FIGTOAXESCOORD Converts a point from normalized figure coordinates to axes coordinates.
    % 
    % INPUT:
    %   ax   - Handle to the axes.
    %   p_fig - 1x2 vector [x, y] in normalized figure coordinates.
    %
    % OUTPUT:
    %   p_ax - 1x2 vector [x, y] in axes coordinates.
    %
    % Get the axes position in normalized figure units
    ax_pos = get(ax, 'Position');
    
    % Convert figure normalized coordinates to normalized axes coordinates
    norm_x = (p_fig(1) - ax_pos(1)) / ax_pos(3);
    norm_y = (p_fig(2) - ax_pos(2)) / ax_pos(4);
    
    % Convert normalized axes coordinates to axes data coordinates
    xlim = get(ax, 'XLim');
    ylim = get(ax, 'YLim');
    p_ax(1) = norm_x * (xlim(2) - xlim(1)) + xlim(1);
    p_ax(2) = norm_y * (ylim(2) - ylim(1)) + ylim(1);
end