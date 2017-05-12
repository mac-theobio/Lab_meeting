# Mac-Theobio Lab Meetings

- Fridays at 10:30AM (Toronto time)
- LSB-216 or [Google hangout](http://tinyurl.com/theobio-lab-meeting)


## Current
### May 12

- [Multivariate responses paper from Ian](https://www.ncbi.nlm.nih.gov/pubmed/23356616)

## Upcoming Meetings

### May 19

- [Infectious Disease Dynamics Inferred from Genetic Data via Sequential Monte Carlo](https://academic.oup.com//mbe/article/3200416/Infectious-Disease-Dynamics-Inferred-from-Genetic)

## Proposed Readings and meeting topics

- [The PTRSB Theme issue on ecology and evolution of parasite transmission](http://rstb.royalsocietypublishing.org/content/372/1719)

- [Lotka-Volterra pairwise modeling fails to capture diverse pairwise microbial interactions](https://elifesciences.org/content/6/e25051)

- multiple comparisons and false discovery rates, e.g. [here](http://www.biostathandbook.com/multiplecomparisons.html) (basic but not silly)
	* Nobody owns this, so we might not do it.

- [FEED ME](https://media.giphy.com/media/pBj0EoGSYjGms/giphy.gif)

## Short Agenda Items

## Past readings and agenda items

- Current: May 5

	- [CRISPR/phage predator/prey dynamics](http://rsif.royalsocietypublishing.org/content/14/127/20160905.long). Nice modeling exercise, but didn't seem relevant to our interests.

	- Frog crystals

- 28 April Ethics stuff related to JD current work, new from Lipsitch:
[Vaccine testing for emerging infections (JME online first)](http://jme.bmj.com/content/early/2017/04/10/medethics-2015-103220)
	* [Mac libaccess link](http://jme.bmj.com.libaccess.lib.mcmaster.ca/content/early/2017/04/10/medethics-2015-103220)

- 21 April [Leggett virulence](http://rstb.royalsocietypublishing.org/content/372/1719/20160094)
- 11 Apr spatially explicit capture-recapture analysis: [Borchers et al 2014 J Am Stat Assoc](http://www.tandfonline.com/doi/full/10.1080/01621459.2014.893884) ("As it involves a distance-based detection function, SECR (spatially explicit capture-recapture) is closer to DS (distance sampling) than [it] is [to] traditional CR (capture-recapture) ...")
	- Other (less useful I think) readings:
         - [Stevenson et al 2014 Meth Ecol Evol](http://onlinelibrary.wiley.com/doi/10.1111/2041-210X.12291/full) "A general framework for animal density estimation from acoustic detections across a fixed microphone array"
         - Earlier paper (not dealing with time-of-arrival etc.) [Efford et al 2009 Ecology](https://www.ncbi.nlm.nih.gov/pubmed/19886477) "Population density estimated from locations of individuals on a passive detector array"
         - [Borchers and Fewster 2016 Statistical Science](http://projecteuclid.org/euclid.ss/1464105039) "Spatial Capture–Recapture Models"

- 4 Apr [Antonovics review](http://rstb.royalsocietypublishing.org/content/372/1719/20160087) from [the PTRSB Theme issue on ecology and evolution of parasite transmission](http://rstb.royalsocietypublishing.org/content/372/1719)

- Mar 28: problems with detection of causality by cross-convergent mapping ("does influenza cause humidity?"): [Baskerville and Cobey PNAS](http://www.pnas.org/content/early/2017/03/14/1700369114.full)
	- Read related articles (Sugihara's and theirs in PLoS ONE) if you have time

- Mar 21: [Fundamental Theorems of Evolution](http://www.journals.uchicago.edu/doi/full/10.1086/690937)

- Mar 14: *Two* papers (split your time between them as you like):
    - [Effects of contact structure on the transient evolution of
HIV virulence](readings/park_bolker_hiv.pdf)
    - [A transmission-virulence evolutionary trade-off explains attenuation of HIV-1 in Uganda](https://elifesciences.org/content/5/e20492)

- Mar 7: Scale-dependent parameter estimation
    - [Cornulier ISEC presentation](readings/CORNULIER_VCR6.pdf)
	- [A possible background paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2575822/) – BB says don't get bogged down in it.
	- [A weird contribution by al. et JD](https://nature.berkeley.edu/kremenlab/wp-content/uploads/2014/02/Testing-Simple-Indices-of-Habitat-Proximity.pdf): is it OK to snoop if you don't find anything?
- Feb 28: Read from the [GUSTA ME](https://sites.google.com/site/mb3gustame/constrained-analyses/rda) website for 45 minutes, focusing on:
	- Dissimilarity based methods
	- constrained analyses
	- indirect gradient analysis
	
	- Some other resources:
		- Learn the basics of PCoA. Can anyone suggest a reading?
			- This isn't a full solution: it doesn't help with the inference/why we would do one or the other, but it does explain the geometry pretty nicely ... [PCA and PCoA explained](http://occamstypewriter.org/boboh/2012/01/17/pca_and_pcoa_explained/), from Bob Carpenter
		- Mike suggests we cover all the variants: (PCA, PCoA, CPC (common principal components), Factor analysis, CVA (canonical variate analysis), Non-negative matrix factorization) (the [CANOCO](http://www.canoco5.com/index.php/canoco5-overview) web page lists: DCA, CA, CCA, DCCA, PCA, and RDA ...)
		- There's also [NMDS](https://jonlefcheck.net/2012/10/24/nmds-tutorial-in-r/), which is very popular among microbiome people. (JCSz) That link says something I don't understand about NMDS: 
			- "NMDS requires a distance matrix, or a matrix of dissimilarities. Raw Euclidean distances are not ideal for this purpose: they’re sensitive to total abundances, so may treat sites with a similar number of species as more similar, even though the identities of the species are different." This shouldn't be true, should it? If each species gets its own axis...
		
	- BB proposed inviting Steve Walker to talk to us if he has time.


- Feb 7: [Mandal et al., Analysis of Composition of Microbes: A novel method for studying microbial composition](http://www.microbecolhealthdis.net/index.php/mehd/article/view/27663)
	- [The supp is apparently more relevant than the article](http://www.microbecolhealthdis.net/index.php/mehd/rt/suppFiles/27663/0)

- Jan 24:  [Phillips et al., _JID_, 2016: Identifying Key Drivers of the Impact of an HIV Cure Intervention in Sub-Saharan Africa](http://jid.oxfordjournals.org/content/214/1/73)

- Jan 9: How to construct R-packages [BB's slides](https://github.com/bbolker/compstatsR/blob/master/session4.rmd)

- Nov 14: [Probert *et al* (2016): Decision-making for foot-and-mouth disease control: objectives matter.  Epidemics 15: 10-19](http://dx.doi.org/10.1016/j.epidem.2015.11.002)
    - from Katriona Shea's lab: "Results illustrate how control actions change across both the base metric used to measure management success and across the statistic used to rank control actions according to said metric. This work represents a first step towards reconciling the extensive modelling work on disease control problems with frameworks for structured decision making. This work represents a first step towards reconciling the extensive modelling work on disease control problems with frameworks for structured decision making."

- _All Hallows' Eve_ [Retention of Adult Patients on Antiretroviral Therapy in Low- and Middle-Income Countries: Systematic Review and Meta-analysis 2008-2013](https://www.ncbi.nlm.nih.gov/pubmed/25942461)

- Oct 24: [Callahan *et al.* (2016): DADA2: High-resolution sample inference
from Illumina amplicon data](http://www.nature.com/nmeth/journal/v13/n7/full/nmeth.3869.html)
    - JCSz: stuff with McMurdie's name on it can sometimes be sloppy, so I'm interested in people's opinions on this method.
	- So what did you-all think of this one anyway?

- Oct 17: [Wilson *et al* (2016 arxiv):  Good Enough Practices in Scientific Computing](http://arxiv.org/pdf/1609.00037v1.pdf)
- Oct 3: [Trapman *et al* (2016): Inferring R0 in emerging epidemics—the effect of common population structure is small](http://rsif.royalsocietypublishing.org/content/13/121/20160288)
	- [The bus waiting-time paradox and multiplying by 1+C^2](http://science.sciencemag.org/content/304/5671/684.3.full?_ga=1.101519745.1672006810.1453387049)

- Sep 26: [Delva *et al* (2016): Connecting the dots: network data and models in HIV epidemiology.](http://www.ncbi.nlm.nih.gov/pubmed/27314176)
- (22 Sep) [Ye and Sugihara (2016): Information leverage in interconnected ecosystems: Overcoming the curse of dimensionality](http://science.sciencemag.org/content/353/6302/922)
	- for what it's worth these methods are available in an [R package](https://github.com/ha0ye/rEDM) ...
- Sep 15: Skyline plots
	- [Pybus et al Genetics 155: 1429–1437](http://www.genetics.org/content/155/3/1429.short) (Original paper, July 2000) 
	- [Drummond et al 2005doi:10.1093/molbev/msi103](http://mbe.oxfordjournals.org/content/22/5/1185.short) (Cool Bayesian stuff)
