function gaussianmat = mk_gaussian(varargin)
%MK_GAUSSIAN Converts a matrix using a Gaussain function.
%
%   GAUSSIANMAT = MK_GAUSSIAN(PIXELMAP, SD [,X0]) returns a matrix with the
%   same size as PIXELMAP. Elements in the PIXELMAP are transformed using a
%   Gaussian function with a standard deviation of SD and a mean of X0. Output
%   values are not scaled: the value is 1 at the center of the Gaussian.
%
%   Arguments:
%      PIXELMAP - an image matrix, usually generated by MAP_* functions.
%      SD       - the standard deviation of a Gaussian.
%      X0       - the mean of a Gaussian, 0 if empty or not provided.
%
%   Example:
%      <a href="matlab:imshow(mk_gaussian(map_radial(200), 25));">imshow(mk_gaussian(map_radial(200), 25));</a>
%
%   See also MAP_RADIAL, MAP_LINEAR.

	pixelmap = pretina_arg(varargin, 1, mfilename, 'pixelmap', [], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan'});
	sd       = pretina_arg(varargin, 2, mfilename, 'sd',       [], {'numeric'}, {'scalar', 'real', 'finite', 'nonnan', 'positive'});
	x0       = pretina_arg(varargin, 3, mfilename, 'x0',       0,  {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});

	gaussianmat = exp(-.5 * ((pixelmap - x0) / sd) .^ 2);
end