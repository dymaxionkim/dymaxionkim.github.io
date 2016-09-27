S1 = 10;
S2 = 50;
S3 = 2*S2;

// Cylinder
Point(1) = {0, 0, 0, 1.0};
Point(2) = {85, 85, 0, 1.0};
Point(3) = {85, -85, 0, 1.0};
Point(4) = {-85, 85, 0, 1.0};
Point(5) = {-85, -85, 0, 1.0};
Circle(1) = {4, 1, 5}; Transfinite Line {1} = S1 Using Progression 1;
Circle(2) = {5, 1, 3}; Transfinite Line {2} = S1 Using Progression 1;
Circle(3) = {3, 1, 2}; Transfinite Line {3} = S1 Using Progression 1;
Circle(4) = {2, 1, 4}; Transfinite Line {4} = S1 Using Progression 1;

// Chanel
Point(7) = {0, 1000, 0, 1.0};
Point(8) = {1000, 1000, 0, 1.0};
Point(9) = {1000, 0, 0, 1.0};
Point(10) = {1000, -1000, 0, 1.0};
Point(11) = {0, -1000, 0, 1.0};
Point(12) = {-1000, -1000, 0, 1.0};
Point(13) = {-1000, 0, 0, 1.0};
Point(14) = {-1000, 1000, 0, 1.0};
Point(15) = {5000, 1000, 0, 1.0};
Point(16) = {5000, 0, 0, 1.0};
Point(17) = {5000, -1000, 0, 1.0};
Line(5) = {8, 2}; Transfinite Line {5} = S2 Using Progression 1;
Line(6) = {3, 10}; Transfinite Line {6} = S2 Using Progression 1;
Line(7) = {5, 12}; Transfinite Line {7} = S2 Using Progression 1;
Line(8) = {4, 14}; Transfinite Line {8} = S2 Using Progression 1;
Line(9) = {14, 8}; Transfinite Line {9} = S1 Using Progression 1;
Line(10) = {8, 10}; Transfinite Line {10} = S1 Using Progression 1;
Line(11) = {10, 12}; Transfinite Line {11} = S1 Using Progression 1;
Line(12) = {12, 14}; Transfinite Line {12} = S1 Using Progression 1;
Line(13) = {8, 15}; Transfinite Line {13} = S3 Using Progression 1;
Line(14) = {15, 17}; Transfinite Line {14} = S1 Using Progression 1;
Line(15) = {17, 10}; Transfinite Line {15} = S3 Using Progression 1;

// Surfs
Line Loop(16) = {8, -12, -7, -1};
Plane Surface(17) = {16};
Transfinite Surface {17};
Recombine Surface {17};

Coherence;
Line Loop(18) = {2, 6, 11, -7};
Plane Surface(19) = {18};
Transfinite Surface {19};
Recombine Surface {19};

Coherence;
Line Loop(20) = {3, -5, 10, -6};
Plane Surface(21) = {20};
Transfinite Surface {21};
Recombine Surface {21};

Coherence;
Line Loop(22) = {4, 8, 9, 5};
Plane Surface(23) = {22};
Transfinite Surface {23};
Recombine Surface {23};

Coherence;
Line Loop(24) = {10, -15, -14, -13};
Plane Surface(25) = {24};
Transfinite Surface {25};
Recombine Surface {25};


// Pysical Groups
Physical Line("Inlet") = {12};
Physical Line("Outlet") = {14};
Physical Line("Top") = {9, 13};
Physical Line("Bot") = {11, 15};
Physical Line("Cylinder") = {1, 2, 3, 4};
Physical Surface("Surf") = {17, 19, 21, 23, 25};
