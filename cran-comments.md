## Resubmission
This is a resubmission. In this version I have:

- Addressed enclosed software names in single quotes.
- Added an URL for the API in my description.
- Removed the extra line between YEAR and COPYRIGHT HOLDER in the LICENSE file.
- Fixed the VignetteBuilder issue.
- Resolved an empty URL problem.

## Test environments
* local OS X install
* ubuntu 12.04 (on travis-ci)
* Visual Studio 2015 (on appveyor)

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs.

## Downstream dependencies
I have also run R CMD check on downstream dependencies of nomine with devtools::revdep_check(). All packages that I could install passed.
