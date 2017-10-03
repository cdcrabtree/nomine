[![Build Status](https://travis-ci.org/cdcrabtree/nomine.svg?branch=master)](https://travis-ci.org/cdcrabtree/nomine) [![Build status](https://ci.appveyor.com/api/projects/status/github/cdcrabtree/nomine?svg=true)](https://ci.appveyor.com/api/projects/status/github/cdcrabtree/) [![DOI](https://zenodo.org/badge/105415000.svg)](https://zenodo.org/badge/latestdoi/105415000) [![status](http://joss.theoj.org/papers/d8c61f24d1d5f325d856acd2aea9e42c/status.svg)](http://joss.theoj.org/papers/d8c61f24d1d5f325d856acd2aea9e42c/)

# nomine: Functions to classify names based on 6 U.S. ethnicities or 39 leaf nationalities.

Large social science literatures are devoted to examining the role of an individual's ethnicity or nationality on a host of behaviors and circumstances (e.g., Adida et al 2016; Habyarimana et al 2009; Hochschild 1996; McConnaughy et al 2010). This means that researchers often want to know the ethnicities or nationalities of individuals. Not all pre-existing datasets contain this information, though, and it can be difficult for scholars to locate that data if they work with exotic samples. Even if reseachers do not have information about the ethnicity or nationality of individuals, though, they often know their names. Thanks to recent developments in machine learning, these names can be used to probabilistically identify the ethnic or national origins of their bearers. These exciting advancements can potentially catalyze existing research programs on race, ethnicity, and coethnicity.

Unfortunately, most of the available name classifiers are very costly to use. While some allow free access, they typically impose extremely restrictive limits on the number of names that can be classified in a period, such as 100 per month (see '[NamSor](http://www.namsor.com/)'). One free tool with a generous limit is '[NamePrism](http://name-prism.com/)' (Ye et al. 2017), a non-commercial program intended to support academic research. At the time of this writing, NamePrism provides users with an accessible web-based interface that can classify names one at a time. Researchers who want to classify more than one name at a time can, in theory, use the publicly available [API](http://name-prism.com/api). In contrast to other tools and services, 'NamePrism' allows up to 1000 API requests per day.

In order to classify names in bulk, however, researchers would need to write code to automatically query the API. That could be a significant barrier to use, though, as many scholars likely lack the requisite programming experience. The `nomine` package addresses that problem by providing two functions that make the task of quering NameSor's API trivally easy. The first, `get_ethnicities`, takes a vector of names and returns a data frame that contains the predicted probability that each name bearer belongs to one of 6 U.S. ethnicities. The second, `get_nationalities`, performs the same function but for 39 leaf nationalities instead. See [http://name-prism.com/about](http://name-prism.com/about) for more information about the specific ethnicities and nationalities covered by NamePrism.

## Package Installation
The latest development version (0.5.0) is on GitHub can be installed using devtools.

```
if(!require("ghit")){
    install.packages("ghit")
}
ghit::install_github("cdcrabtree/nomine")
```

## Support or Contact
Please use the issue tracker for problems, questions, or feature requests. If you would rather email with questions or comments, you can contact [Charles Crabtree](mailto:ccrabtr@umich.edu) and he will try to address the issue.

If you would like to contribute to the package, that is great! We welcome pull requests and new developers.

## Tests
Users and potential contributors can test the software with the example code provided in the documentation for each function.

## Thanks
Thanks to [Karl Broman](https://github.com/kbroman) and [Hadley Wickham](http://hadley.nz/) for providing excellent free guies to building R packages.

### References
- Adida, Claire L., David D. Laitin, and Marie-Anne Valfort. 2016. _Why Muslim integration fails in Christian-heritage societies_. Harvard University Press.
- Habyarimana, James, Macartan Humphreys, Daniel N. Posner, and Jeremy M. Weinstein. 2009. _Coethnicity: diversity and the dilemmas of collective action_. Russell Sage Foundation.
- Hochschild, Jennifer L. 1996. _Facing up to the American dream: Race, class, and the soul of the nation_. Princeton University Press.
- McConnaughy, Corrine M., Ismail K. White, David L. Leal, and Jason P. Casellas. 2010. "A Latino on the ballot: Explaining coethnic voting among Latinos and the response of White Americans." _The Journal of Politics_ 72(4): 1199-1211.
- Ye, Junting, Shuchu Han, Yifan Hu, Baris Coskun, Meizhu Liu, Hong Qin, and Steven Skiena. 2017. "Nationality Classification Using Name Embeddings." _arXiv preprint arXiv:1708.07903_.
