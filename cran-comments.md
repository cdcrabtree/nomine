## Resubmission
This is a resubmission. In this version I have:

- Revised both functions so that they return objects. I had accidentally deleted these lines of code earlier. I know that I am resubmitting too soon, but I wouldn't want people to use the prior version. 

## Test environments
* local OS X install
* ubuntu 12.04 (on travis-ci)
* Visual Studio 2015 (on appveyor)

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs.

## Downstream dependencies
I have also run R CMD check on downstream dependencies of nomine with devtools::revdep_check(). All packages that I could install passed.
