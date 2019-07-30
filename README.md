# py-tensorflow
A FreeBSD port for tensor flow.


The package now builds and works but the Makefiles and patches now need to be cleaned up.

## TODO

This is a current work in progress and still some issues which need to be addressed

- [x] Fix the final linking error.

- [ ] Replace some patch with sed commands in Makefile

- [x] Modify the build system to stop building external componants.

- [x] Add options to set cpu optimisation.

- [ ] Experiment with OpenCL and SYSCL.

- [ ] Enable MKL-DNN support for intel machines.

- [ ] Split the package into python and C framework or rename to just keep as one called tensorflow.

## TEST BUILDS

FreeBSD versions which it has successfully built on:

- [x] FreeBSD 12.0
- [ ] FreeBSD 11.3
- [ ] FreeBSD 11.2
