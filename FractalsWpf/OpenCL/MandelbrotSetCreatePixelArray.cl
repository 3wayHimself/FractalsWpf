﻿kernel void MandelbrotSetCreatePixelArray(
	float minReal,
	float minImaginary,
	float realDelta,
	float imaginaryDelta,
	int maxIterations,
	global int *results)
{
	int gid0 = get_global_id(0);
	int gid1 = get_global_id(1);
	int width = get_global_size(1);

	float zr = 0.0f;
	float zi = 0.0f;

	float cr = minReal + (realDelta * gid1);
	float ci = minImaginary + (imaginaryDelta * gid0);

	int iter = 0;

	for (; iter < maxIterations; ++iter)
	{
		float zrNext = ((zr * zr) - (zi * zi)) + cr;
		float ziNext = (2 * zr * zi) + ci;

		if (zrNext * zrNext + ziNext * ziNext >= 4.0f) break;

		zr = zrNext;
		zi = ziNext;
	}

	results[gid0 * width + gid1] = iter;
}