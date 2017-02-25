# ==============================================================================
# AMPL coding by Remigijus Paulavicius
# Name:
#   c_2002_02.mod
#
# Original source:
#  - BIPA2 problem in: B. Colson, BIPA(BIlevel Programming with Approximation 
#  	 Methods)(software guide and test problems), Cahiers du GERAD, (2002)
#
# Optimal solution:
#   F* = 17.0
#   f* = 2.0
#   x* = 1.0
#   y* = 0.0
#
# ---------------------------- Problem Properties ------------------------------
#                   n       m       #G     #H       #g      #h
# ------------------------------------------------------------------------------
#                   1       1       0       0       3       0
# ------------------------------------------------------------------------------
# 
# For more information, please visit corresponding website at:
#   http://basblsolver.github.io/test-problems/NLP-NLP/c_2002_02
# ==============================================================================

var x >= 0, <= 10;         # Outer variable
var y >= 0, <= 10;         # Inner variable
var l{1..5} >= 0, <= 10;   # KKT Multipliers

minimize outer_obj: (x - 5)^2 + (2*y + 1)^2;  # Outer objective

subject to
# Inner objective:
    inner_obj: (y - 1)^2 - 1.5*x*y + x^3 = 0;
# Inner constraints
    inner_con1:    -3*x + y + 3 <= 0;
    inner_con2:     x - 0.5*y - 4 <= 0;
    inner_con3:     x + y - 7 <= 0;
# KKT conditions:
    stationarity:      2*(y - 1) - 1.5*x + l[1] - 0.5*l[2] + l[3] - l[4] + l[5] = 0;
    complementarity_1: l[1]*(-3*x + y + 3) = 0;
    complementarity_2: l[2]*(x - 0.5*y -4) = 0;
    complementarity_3: l[3]*(x + y -7) = 0;
    complementarity_4: l[4]*y = 0;
    complementarity_5: l[5]*(y - 10) = 0;