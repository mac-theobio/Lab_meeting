I disagree with [Gelman's stance on power analysis](https://statmodeling.stat.columbia.edu/2019/03/04/yes-design-analysis-no-power-no-sample-size-calculations), but I'm a little afraid to disagree publicly.

Gelman's take on power analysis seems analogous to the Language Log folks' objection to Strunk and White and Orwell's "Politics and the English Language" Is S&W's grammar advice bogus? Yes. Is the usage advice that S&W/Orwell give ("Omit needless words",  "Write with nouns and verbs, not with adjectives and adverbs") [oversimplified](http://itre.cis.upenn.edu/~myl/languagelog/archives/001905.html)?  Maybe.

**But**: is this kind of usage advice useful for college students who use too many long and fancy words thinking it makes their writing better? Absolutely.

 Moving on to power analysis: is focusing on false positives/false negatives in the *narrow sense* misguided?  Do scientists dichotomize too much into "significant/nonsignificant" (or "clear/unclear")? Yes. Are power analyses based on pilot studies that are themselves super-noisy/underpowered?  Yes. Are many researchers abusing statistical significance filters and wandering in the garden of forking paths?

**But**: Is it good for scientists to spend some time thinking about whether the experiment/observation they are planning to do has a reasonable chance of clearly seeing what's intended -- or, if nothing is seen clearly, being able to put reasonable upper bounds on the magnitude of the effect? Yes.

Reading Gelman's post again, he's more nuanced than I initially gave him credit for (the commenters might not be).  After reviewing the Gelman and Carlin ["Type S/Type M" design analysis paper](https://doi.org/10.1177/1745691614551642) he refers to, I have two comments/complaints:

1. the type S/type M errors (sign and magnitude) are conditional on statistical significance. That is, the possible outcomes of an experiment are: (1) unclear; (2A) clear, correct sign (2B) clear, incorrect sign. (Also, (3) clear, how much is the magnitude exaggerated by conditioning on clarity?)

That is, it seems like S/M or 'retropower' the way they're framed are more about pushing back against underpowered studies that have been statistical significance filtered than about doing studies the right way in the first place.

2. Gelman and Carlin talk about the difficulties of deciding on an effect size for power analysis.  They (reasonably) criticize basing power analysis on estimates from pilot studies, which are likely to be very noisy.  However, they also criticize power analyses that "assum[e] an effect size deemed to be substantively important or more specifically the minimum effect that would be substantively important".  They say only that this approach "... can also lead to specifying effect sizes that are larger than what is likely to be the true effect".

IMO doing power analysis this way (i.e., based on the smallest substantively important effect size) seems exactly right: it will mean that in general unclear results will correspond to CIs around zero that are narrow enough to assert that the effects are small.

  What am I missing?
