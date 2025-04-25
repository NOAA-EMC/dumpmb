
 readmd (module)
================

NCO installation: /apps/ops/prod/nco/intel/19.1.3.304/dumpmb.v1.0.0

Move into desired branch and run:

```bash
clone https://github.com/NOAA-EMC/dumpmb.git
```

```bash
Option 1:
cd dumpmb && cd sorc
INSTALL_PREFIX=/path/where/you/wish/to/install/dumpmb ./build.sh
```

```bash
Option 2:
There is also the option to build and install in your local clone space but install the modulefile elsewhere:

MODULEFILE_INSTALL_PREFIX=/path/where/you/wish/to/install/dumpmb/module ./build.sh
```

