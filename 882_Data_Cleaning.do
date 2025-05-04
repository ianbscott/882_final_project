clear all
** Import data **
use "/Users/ianscott/Downloads/Resources/MA Paper Ideas/CIS2012_PUMF.DTA"
append using "/Users/ianscott/Downloads/Resources/MA Paper Ideas/CIS2013_PUMF.DTA"
append using "/Users/ianscott/Downloads/Resources/MA Paper Ideas/CIS2014_PUMF.DTA"
append using "/Users/ianscott/Downloads/Resources/MA Paper Ideas/CIS2015_PUMF.DTA"
append using "/Users/ianscott/Downloads/Resources/MA Paper Ideas/CIS2016_PUMF.DTA"
append using "/Users/ianscott/Downloads/Resources/MA Paper Ideas/CIS2017_PUMF.DTA"
append using "/Users/ianscott/Downloads/Resources/MA Paper Ideas/CIS2018_PUMF.DTA"

** Cleaning
destring, replace
replace rppc = . if rppc == 99999996

** Generate identifier for WITB eligible
gen witb = 0

** Binary if eligible under provincial and federal criteria **
** 2012 **
replace witb = 1 if earng < 17477 & year == 2012
replace witb = 1 if earng < 18595 & year == 2012 & prov == 48
replace witb = 1 if earng < 19153 & year == 2012 & prov == 59
replace witb = 0 if prov == 59 & year == 2012 & earng < 4750
replace witb = 0 if prov == 48 & year == 2012 & earng < 2760
replace witb = 0 if earng < 3000 & year == 2012 & prov != 48 & prov != 59

** 2013 **
replace witb = 1 if year == 2013 & earng < 17825
replace witb = 1 if year == 2013 & earng < 19537 & prov == 59
replace witb = 1 if year == 2013 & earng < 18966 & prov == 48
replace witb = 0 if earng < 2760 & prov == 48 & year == 2013 
replace witb = 0 if earng < 4750 & prov == 59 & year == 2013 
replace witb = 0 if earng < 3000 & prov != 59 & prov != 48 & year == 2013 

** 2014 **
replace witb = 1 if year == 2014 & earng < 17986
replace witb = 1 if year == 2014 & earng < 19721 & prov == 59
replace witb = 1 if year == 2014 & earng < 19139 & prov == 48
replace witb = 0 if earng < 2760 & prov == 48 & year == 2014 
replace witb = 0 if earng < 4750 & prov == 59 & year == 2014 
replace witb = 0 if earng < 3000 & prov != 59 & prov != 48 & year == 2014

** 2015 **
replace witb = 1 if year == 2015 & earng < 18292
replace witb = 1 if year == 2015 & earng < 20058 & prov == 59
replace witb = 1 if year == 2015 & earng < 19467 & prov == 48
replace witb = 0 if earng < 2760 & prov == 48 & year == 2015
replace witb = 0 if earng < 4750 & prov == 59 & year == 2015
replace witb = 0 if earng < 3000 & prov != 59 & prov != 48 & year == 2015

** 2016**
replace witb = 1 if year == 2016 & earng < 18529
replace witb = 1 if year == 2016 & earng < 20314 & prov == 59
replace witb = 1 if year == 2016 & earng < 19717 & prov == 48
replace witb = 0 if earng < 2760 & prov == 48 & year == 2016
replace witb = 0 if earng < 4750 & prov == 59 & year == 2016
replace witb = 0 if earng < 3000 & prov != 59 & prov != 48 & year == 2016

** 2017**
replace witb = 1 if year == 2017 & earng < 18791
replace witb = 1 if year == 2017 & earng < 20608 & prov == 59
replace witb = 1 if year == 2017 & earng < 19938 & prov == 48
replace witb = 0 if earng < 2760 & prov == 48 & year == 2017
replace witb = 0 if earng < 4750 & prov == 59 & year == 2017
replace witb = 0 if earng < 3000 & prov != 59 & prov != 48 & year == 2017

** 2018 **
replace witb = 1 if year == 2018 & earng < 19026
replace witb = 1 if year == 2018 & earng < 20918 & prov == 59
replace witb = 1 if year == 2018 & earng < 20284 & prov == 48
replace witb = 0 if earng < 2760 & prov == 48 & year == 2018
replace witb = 0 if earng < 4750 & prov == 59 & year == 2018
replace witb = 0 if earng < 3000 & prov != 59 & prov != 48 & year == 2018

** Eligibility in all years **
replace witb = 0 if agegp < 5
replace witb = 0 if fllprtp == 1

*** Final dataset
gen nonrec = 0
replace nonrec = 1 if witb == 1 & ogovtr == 0
drop if witb == 0
drop pumfid
drop witb
drop cfid
drop efid
drop verdate
drop personid
drop ogovtr
drop efogovtr
drop cfogovtr

*** Export

export delimited using "882_data", replace
