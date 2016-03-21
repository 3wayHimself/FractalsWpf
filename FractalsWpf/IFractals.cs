﻿using System.Numerics;

namespace FractalsWpf
{
    public interface IFractals
    {
        int[] CreatePixelArray(
            Complex constant,
            Complex c1,
            Complex c2,
            int maxIterations,
            int numWidthDivisions,
            int numHeightDivisions);
    }
}
