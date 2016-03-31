# CPSP-tools

CPSP is a collection of tools related to the prediction of optimal structures in simple lattice-protein models like the HP-model. We support the standard backbone models as well as side chain models! 

**Motivation**: During the last few years, several new small regulatory RNAs (sRNAs) have been discovered in bacteria. Most of them act as post-transcriptional regulators by base pairing to a target mRNA, causing translational repression or activation, or mRNA degradation. Numerous sRNAs have already been identified, but the number of experimentally verified targets is considerably lower. Consequently, computational target prediction is in great demand. Many existing target prediction programs neglect the accessibility of target sites and the existence of a seed, while other approaches are either specialized to certain types of RNAs or too slow for genome-wide searches.

**Background**: The principles of protein folding and evolution pose problems of very high inherent complexity. Often these problems are tackled using simplified protein models, e.g. lattice proteins. The CPSP-tools package provides programs to solve exactly and completely the problems typical of studies using 3D lattice protein models. Among the tasks addressed are the prediction of (all) globally optimal and/or suboptimal structures as well as sequence design and neutral network exploration.

**Results**: In contrast to stochastic approaches, which are not capable of answering many fundamental questions, our methods are based on fast, non-heuristic techniques. The resulting tools are designed for high-throughput studies of 3D-lattice proteins utilising the Hydrophobic-Polar (HP) model.

**Conclusion**: The CPSP-tools package is the first set of exact and complete methods for extensive, high-throughput studies of non-restricted 3D-lattice protein models. In particular, our package deals with cubic and face centered cubic (FCC) lattices.

## Contribution

Feel free to contribute to this project by wirting [Issues](https://github.com/BackofenLab/CPSP-tools/issues) with feature requests or bug reports.

## Cite
If you use CPSP-tools, please cite our [article](http://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-9-230):
```
doi: 10.1186/1471-2105-9-230
```
