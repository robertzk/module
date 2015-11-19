Namespacing in R [![Build Status](https://travis-ci.org/robertzk/module.svg?branch=master)](https://travis-ci.org/robertzk/module) [![Coverage Status](https://coveralls.io/repos/robertzk/module/badge.svg?branch=master)](https://coveralls.io/r/robertzk/module) [![Documentation](https://img.shields.io/badge/rocco--docs-%E2%9C%93-blue.svg)](http://robertzk.github.io/module/)
============

Typical modularization of R code is done through [packages](http://r-pkgs.had.co.nz/).
However, packages have a few design limitations that prevents
their widespread use by developers.

  1. Packages do not solve the problem of hierarchical namespacing.
     In particular, languages like Ruby have good support for
     a primitive called a [module](http://ruby-doc.org/core-2.2.0/Module.html) and
     C++ has a primitive termed a [namespace](https://en.wikipedia.org/wiki/Namespace);
     R, despite being a functional language with roots to the [LISP](https://en.wikipedia.org/wiki/LISP)
     currently does not have a good hierachical namespacing system.
  2. Hierarchical file structures and exports. In particular, R packages
     are limited to flat directory structures for historical reasons
     decided by the R core team.

Both of these limitations are legitimate problems because organizing
large codebases managed by teams of dozens or hundreds of developers
is difficult or unpleasant without a sane hierarchical namespacing system.

**Modules** aim to partially allay this problem by building a hierarchical
namespacing mechanism on top of [environments](http://adv-r.had.co.nz/Environments.html),
a well-defined and well-understood primitive data structure in R.

