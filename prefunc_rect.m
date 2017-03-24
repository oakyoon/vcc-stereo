function voidmap = prefunc_rect(voidmap, params)
%PREFUNC_RECT Adds margins around occupied area for placing a rectangle shape.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_RECTS.

	[radius, ratio, tilt] = pretina_params(params, [], 1, 0);

	kernel_rect = mk_shape( ...
		map_rectangular( ...
			ceil(sqrt(sum((radius ./ [1, ratio]) .^ 2)) * 2), ...
			[], ratio, tilt ...
			), ...
		radius ...
		);
	bumpmap = ones(size(voidmap) + 2);
	bumpmap(2:(end - 1), 2:(end - 1)) = 1 - voidmap;
	bumpmap = min(1, filter2(kernel_rect, bumpmap, 'same'));
	voidmap = 1 - bumpmap(2:(end - 1), 2:(end - 1));
end