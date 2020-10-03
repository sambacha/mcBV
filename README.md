# About

mcBV is a solver for (existential) bit-vector formulas (SMT QF_BV) based on the
[mcSAT framework](http://dblp.org/rec/conf/vmcai/MouraJ13).

The technical aspects and experimental results are described in:
Zeljic, Wintersteiger, Ruemmer: [Deciding Bit-Vector Formulas with mcSAT]
(http://research.microsoft.com/apps/pubs/default.aspx?id=264535).
Proceedings of SAT, Springer, 2016.


# Licence

mcBV is licensed under the MIT licence (see [LICENSE.txt](LICENSE.txt)).


# Requirements

- [Visual Studio](https://www.visualstudio.com/)
- [F#](http://fsharp.org/)
- [Z3](https://github.com/Z3Prover/z3)

# Docker usage

```console
$ docker build -t mcbv .
$ export FILE=`pwd`/tests/concat2.smt2
$ docker run -v $(dirname $FILE):/mcBV/host -it mcbv mono /mcBV/bin/Release/mcBV.exe host/$(basename $FILE)
sat                                                                                                   │                                                                                                     
0.376016 sec.
```

# Contributing

To contribute, you will need to complete a [Contributor License
Agreement](https://cla.microsoft.com/) (CLA). Briefly, this agreement testifies
that you are granting us permission to use the submitted change according to the
terms of the project's license, and that the work being submitted is under
appropriate copyright. 
