[![Build Status](https://travis-ci.org/cdcrabtree/nomine.svg?branch=master)](https://travis-ci.org/cdcrabtree/nomine) [![Build status](https://ci.appveyor.com/api/projects/status/github/cdcrabtree/nomine?svg=true)](https://ci.appveyor.com/api/projects/status/github/cdcrabtree/)
![](http://www.r-pkg.org/badges/version/nomine) ![](http://cranlogs.r-pkg.org/badges/grand-total/nomine) ![](http://cranlogs.r-pkg.org/badges/nomine)
[![DOI](https://zenodo.org/badge/105415000.svg)](https://zenodo.org/badge/latestdoi/105415000)[![Rdoc](http://www.rdocumentation.org/badges/version/nomine)](http://www.rdocumentation.org/packages/nomine)

# nomine: Functions to classify names based on gender, 6 U.S. ethnicities, or 39 leaf nationalities.

Large social science literatures are devoted to examining the role of an individual's gender, ethnicity, or nationality on a host of behaviors and circumstances. This means that researchers often want to know these characteristics of individuals. Not all pre-existing datasets contain this information, though, and it can be difficult for scholars to locate, particularly if they work with exotic samples. 

Even if reseachers do not have data on these theoretically important covariates for individuals, though, there in many cases in which they know individual names. Thanks to recent developments in machine learning, these names can be used to probabilistically identify the gender, ethnicity, leaf nationality, or origin of their bearers. These exciting advancements can potentially catalyze existing research programs on gender, race, ethnicity, coethnicity, and national origins.

Unfortunately, most of the available name classifiers are very expensive to use. Thankfully, there are at two free or cheap-to-use tools. One is '[NamePrism](http://name-prism.com/)', a non-commercial program intended to support academic research. See [Ye et al 2017](https://arxiv.org/abs/1708.07903) for more information about its algorithm. 'NamePrism' freely provides users with up to 60 API requests per minute (an [API access token](http://www.name-prism.com/api) is required).

The other is '[NamSor](http://www.namsor.com/)', an application widely used across companies, non-governmental organizations, and government agencies. See [https://github.com/namsor/namsor-api](https://github.com/namsor/namsor-api) for more information about its algorithm. 'NamSor' freely provides users with up to 1000 API requests per month.

At the time of this writing, 'NamePrism' and 'NamSor' provides users with web-based interfaces to classifies names. To classify names in bulk with either service, though, researchers would need to write code that automatically queries the service's API. That could be a significant barrier to use, though, as many scholars likely lack the requisite programming experience. The `nomine` package addresses that problem by providing several functions that make the task of quering these APIs trivally easy. 

One, `get_ethnicities`, takes a vector of names along with API keys and returns a data frame that contains the predicted probability that each name bearer belongs to one of 6 U.S. ethnicities. Another, `get_nationalities`, performs the same function but for 39 leaf nationalities instead. See [http://name-prism.com/about](http://name-prism.com/about) for more information about the specific ethnicities and nationalities covered by NamePrism. The third function, `get_gender`, takes given and family names along with API keys, queries [NamSor](http://www.namsor.com/)'s API, and returns a data frame that contains a gender scale score for each name along with a binary male/female classification. This scale score ranges from -1 to 1, with higher values denoting more 'female' names.  

## Package Installation
The latest development version (1.0.1) is on GitHub can be installed using devtools.

```
if(!require("devtools")){
    install.packages("devtools")
}
devtools::install_github("cdcrabtree/nomine")
```

## Support or Contact
Please use the issue tracker for problems, questions, or feature requests. If you would rather email with questions or comments, you can contact [Charles Crabtree](mailto:ccrabtr@umich.edu) or [Christian Chacua](mailto:christian-mauricio.chacua-delgado@u-bordeaux.fr) and they will try to address the issue.

If you would like to contribute to the package, that is great! We welcome pull requests and new developers.

## Tests
Users and potential contributors can test the software with the example code provided in the documentation for each function.

## Thanks
Thanks to [Karl Broman](https://github.com/kbroman) and [Hadley Wickham](http://hadley.nz/) for providing excellent free guies to building R packages.
