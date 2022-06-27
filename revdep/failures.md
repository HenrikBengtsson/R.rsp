# mdsOpt

<details>

* Version: 0.6-3
* GitHub: NA
* Source code: https://github.com/cran/mdsOpt
* Date/Publication: 2022-06-15 09:20:02 UTC
* Number of recursive dependencies: 193

Run `revdep_details(, "mdsOpt")` for more info

</details>

## In both

*   checking whether package ‘mdsOpt’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/c4/home/henrik/repositories/R.rsp/revdep/checks/mdsOpt/new/mdsOpt.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘mdsOpt’ ...
** package ‘mdsOpt’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c mdsOpt.cpp -o mdsOpt.o
mdsOpt.cpp: In function ‘void mmSph(double*, double*, double*, double*, double*, double*, double*, double*, int*, int*, int*, int*, int*, int*)’:
mdsOpt.cpp:234:120: error: too many arguments to function ‘void dgesvd_(const char*, const char*, const int*, const int*, double*, const int*, double*, double*, const int*, double*, const int*, double*, const int*, int*)’
  234 |    dgesvd_(&jobu, &jobvt, &n, &n, A1, &n, singular_value, U_svd, &n, Vt_svd, &n,work, &lwork, &info,(size_t)n,(size_t)n);
      |                                                                                                                        ^
In file included from /software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include/R.h:80,
...
      |          ^~~~~~
/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include/R_ext/RS.h:77:22: note: in definition of macro ‘F77_CALL’
   77 | # define F77_CALL(x) x ## _
      |                      ^
/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include/R_ext/Lapack.h:348:1: note: in expansion of macro ‘F77_NAME’
  348 | F77_NAME(dgesvd)(const char* jobu, const char* jobvt, const int* m,
      | ^~~~~~~~
make: *** [/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/etc/Makeconf:177: mdsOpt.o] Error 1
ERROR: compilation failed for package ‘mdsOpt’
* removing ‘/c4/home/henrik/repositories/R.rsp/revdep/checks/mdsOpt/new/mdsOpt.Rcheck/mdsOpt’


```
### CRAN

```
* installing *source* package ‘mdsOpt’ ...
** package ‘mdsOpt’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c mdsOpt.cpp -o mdsOpt.o
mdsOpt.cpp: In function ‘void mmSph(double*, double*, double*, double*, double*, double*, double*, double*, int*, int*, int*, int*, int*, int*)’:
mdsOpt.cpp:234:120: error: too many arguments to function ‘void dgesvd_(const char*, const char*, const int*, const int*, double*, const int*, double*, double*, const int*, double*, const int*, double*, const int*, int*)’
  234 |    dgesvd_(&jobu, &jobvt, &n, &n, A1, &n, singular_value, U_svd, &n, Vt_svd, &n,work, &lwork, &info,(size_t)n,(size_t)n);
      |                                                                                                                        ^
In file included from /software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include/R.h:80,
...
      |          ^~~~~~
/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include/R_ext/RS.h:77:22: note: in definition of macro ‘F77_CALL’
   77 | # define F77_CALL(x) x ## _
      |                      ^
/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/include/R_ext/Lapack.h:348:1: note: in expansion of macro ‘F77_NAME’
  348 | F77_NAME(dgesvd)(const char* jobu, const char* jobvt, const int* m,
      | ^~~~~~~~
make: *** [/software/c4/cbi/software/R-4.2.0-gcc10/lib64/R/etc/Makeconf:177: mdsOpt.o] Error 1
ERROR: compilation failed for package ‘mdsOpt’
* removing ‘/c4/home/henrik/repositories/R.rsp/revdep/checks/mdsOpt/old/mdsOpt.Rcheck/mdsOpt’


```
# switchboard

<details>

* Version: 0.1
* GitHub: https://github.com/NA/NA
* Source code: https://github.com/cran/switchboard
* Date/Publication: 2021-10-08 18:00:02 UTC
* Number of recursive dependencies: 7

Run `revdep_details(, "switchboard")` for more info

</details>

## In both

*   checking whether package ‘switchboard’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/c4/home/henrik/repositories/R.rsp/revdep/checks/switchboard/new/switchboard.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘switchboard’ ...
** package ‘switchboard’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: no DISPLAY variable so Tk is not available
** help
*** installing help indices
** building package indices
...
Warning: no DISPLAY variable so Tk is not available
Error: package or namespace load failed for ‘switchboard’:
 .onLoad failed in loadNamespace() for 'switchboard', details:
  call: structure(.External(.C_dotTcl, ...), class = "tclObj")
  error: [tcl] invalid command name "ttk::style".

Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/c4/home/henrik/repositories/R.rsp/revdep/checks/switchboard/new/switchboard.Rcheck/switchboard’


```
### CRAN

```
* installing *source* package ‘switchboard’ ...
** package ‘switchboard’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: no DISPLAY variable so Tk is not available
** help
*** installing help indices
** building package indices
...
Warning: no DISPLAY variable so Tk is not available
Error: package or namespace load failed for ‘switchboard’:
 .onLoad failed in loadNamespace() for 'switchboard', details:
  call: structure(.External(.C_dotTcl, ...), class = "tclObj")
  error: [tcl] invalid command name "ttk::style".

Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/c4/home/henrik/repositories/R.rsp/revdep/checks/switchboard/old/switchboard.Rcheck/switchboard’


```
