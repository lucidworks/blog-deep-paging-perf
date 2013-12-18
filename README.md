blog-deep-paging-perf
=====================

Deep-Paging performance comparison, classic vs [SOLR-5463](https://issues.apache.org/jira/browse/SOLR-5463)

[Full Writeup at SearchHub.org](http://searchhub.org/2013/12/12/coming-soon-to-solr-efficient-cursor-based-iteration-of-large-result-sets/)

- - - - - - - - - - - -

[notes.txt](notes.txt) shows the steps taken in creation of the data and running the various tests.  It should include enough information to reproduce.


Initial tests (see tag "blog_2013_12_12") were conducted using Solr trunk (as of r1549701) with code and example configs as modified by this patch...

https://issues.apache.org/jira/secure/attachment/12617920/SOLR-5463__straw_man.patch


Updated scripts & graphs (see tag "blog_2013_12_18_update") were conducted using Solr trunk (as of r1551642) with code as modified by this patch...

https://issues.apache.org/jira/secure/attachment/12619201/SOLR-5463.patch


