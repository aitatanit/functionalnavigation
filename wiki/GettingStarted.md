To try out the framework in MATLAB, download the source code and run the script `demo.m`. There is also a C++ framework, but it lacks demonstration components.

The current version of the framework requires MATLAB `R2009a` or later. Some components additionally require the `Image Processing Toolbox` or the `Genetic Algorithm and Direct Search (GADS) Toolbox`.

### Next Steps ###

The framework comes with a few default examples of components that can be selected by editing DemoConfig.m. In addition, here is a list of downloadable components created by others to demonstrate more system configurations:
  * [PointBasedMeasure](https://github.com/dddvision/functionalnavigation/tree/master/components/%2BPointBasedMeasure) - The University of Central Florida has assembled a state-of-the-art visual measure that employs David Nister's five-point Structure From Motion (SFM) algorithm. In a calibrated framework, the algorithm finds SURF point correspondence between pairs of images, computes the essential matrix, decomposes it into camera rotation and translation, and then triangulates each set of point correspondences in order to obtain the 3D structure of the scene. This measure depends on OpenCV, Sparse Bundle Adjustment (SBA), and LAPACK.

### Layer Diagram for Embedded Systems ###

<img src='https://github.com/dddvision/functionalnavigation/blob/master/wiki/LayerDiagramForEmbeddedSystems.png'>

<h3>Layer Diagram for Developers</h3>

<img src='https://github.com/dddvision/functionalnavigation/blob/master/wiki/LayerDiagramForDevelopers.png'>

<h3>Class Diagram</h3>

<img src='https://github.com/dddvision/functionalnavigation/blob/master/wiki/SimpleClassDiagram.png'>

<h3>Class Diagram Notation (from Design Patterns)</h3>

<img src='https://github.com/dddvision/functionalnavigation/blob/master/wiki/classDiagramNotation.png'>
