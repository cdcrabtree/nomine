---
  title: 'Nomine: Functions to classify names based on 6 U.S. ethnicities or 39 leaf nationalities.'
  tags:
    - name classifier
    - API access
    - ethnicity
    - nationality
  authors:
   - name: Charles Crabtree
     orcid: 0000-0001-5144-8671
     affiliation: 1
   - name: Volha Chykina
     orcid: 0000-0002-7612-9180
     affiliation: 2
   - name: Micah Gell-Redman
     orcid: 0000-0002-4427-0630
     affiliation: 3
  affiliations:
   - name: University of Michigan
     index: 1
   - name: Pennsylvania State University
     index: 2
   - name: University of Georgia
     index: 3
  date: 1 October 2017
  bibliography: paper.bib
---

# Summary

Large social science literatures are devoted to examining the role of an individual's ethnicity or nationality on a host of behaviors and circumstances (e.g., [@Adida2016], [@Habyarimana2009], [@Hochschild1996], [@Mcconnaughy2010]). This means that researchers often want to know the ethnicities or nationalities of individuals. Not all pre-existing datasets contain this information, though, and it can be difficult for scholars to locate that data if they work with exotic samples. Even if reseachers do not have information about the ethnicity or nationality of individuals, though, they often know their names. Thanks to recent developments in machine learning, these names can be used to probabilistically identify the ethnic or national origins of their bearers. These exciting advancements can potentially catalyze existing research programs on race, ethnicity, and coethnicity.

Unfortunately, most of the available name classifiers are very costly to use. While some allow free access, they typically impose extremely restrictive limits on the number of names that can be classified in a period, such as 100 per month (see [NamSor](http://www.namsor.com/)). One free tool with a generous limit is [NamePrism](http://name-prism.com/) [@Ye2017], a non-commercial program intended to support academic research. At the time of this writing, NamePrism provides users with an accessible web-based interface that can classify names one at a time. Researchers who want to classify more than one name at a time can, in theory, use the publicly available [API](http://name-prism.com/api). In contrast to other tools and services, NamePrism allows up to 1000 API requests per day.

In order to classify names in bulk, however, researchers would need to write code to automatically query the API. That could be a significant barrier to use, though, as many scholars likely lack the requisite programming experience. The `nomine` package addresses that problem by providing two functions that make the task of quering NameSor's API trivally easy. The first, `get_ethnicities`, takes a vector of names and returns a data frame that contains the predicted probability that each name bearer belongs to one of 6 U.S. ethnicities. The second, `get_nationalities`, performs the same function but for 39 lead nationalities instead. See [http://name-prism.com/about](http://name-prism.com/about) for more information about the specific ethnicities and nationalities covered by NameSor.


### References

