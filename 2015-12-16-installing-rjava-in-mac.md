---
title: Getting rJava to work in Mac OS X El Capitan: A non-technical guide  
date: 2015-12-16   
comments: false  
tags: R, Programming tips  
keywords:   
---

I recently needed to install the `XLConnect` package in R, which has the dependency `rJava`. Unfortunately rJava is one of **those** R packages which is a real pain to install and required a bit of fiddling. I'll talk you through how I installed it in OSX El Capitan (v. 10.11.2).

## First errors first: the R error messages

I started by trying to install the `XLConnect` package in R:

```r
install.packages("XLConnect")
```

R threw the following error:


	ERROR: dependency ‘rJava’ is not available for package ‘XLConnect’
	* removing ‘/usr/local/lib/R/3.2/site-library/XLConnect’
	Warning in install.packages :
  		installation of package ‘XLConnect’ had non-zero exit status


No problem! I thought. I'll just manually install rJava:

```r
install.packages("rJava")
```

Unfortunately, this didn't work.
	

	configure: error: One or more JNI types differ from the corresponding native type. You may need to use non-standard compiler flags or a different compiler in order to fix this.
	ERROR: configuration failed for package ‘rJava’
	* removing ‘/usr/local/lib/R/3.2/site-library/rJava’
	Warning in install.packages :
  		installation of package ‘rJava’ had non-zero exit status


I'll be the first to admit I am no software engineer, so I had no idea what this meant. Fortunately, my boyfriend is, so I asked him what I should do.

## Setting up Java JDK

He had a look at the [CRAN documentation](https://cran.r-project.org/web/packages/rJava/rJava.pdf) for rJava and said, "Well, you need to install a Java JDK." Off I went to Google and found the latest version of the Java Development Environment and installed it (at the time of this post, this was version 1.8). After installing it, I tried running `install.packages("rJava") in R again. It still didn't work. I went back to my boyfriend, and he told me I hadn't set the Java home to point at where my Java JDK was stored. Oh. He opened up my shell interpreter set the Java home using the following code.

```shell
/usr/libexec/java_home -v 1.8.0
echo $JAVA_HOME
set JAVA_HOME (/usr/libexec/java_home -v 1.8.0)
```
As recommended by several StackOverflow posts ([this](http://stackoverflow.com/questions/26755013/install-xlsx-and-rjava-on-mac), for example), we then ran the following.

```shell
R CMD javareconf
```

I excitedly opened RStudio and ran `install.packages("rJava")` and ... it still didn't work! What the heck? 

## Setting up Java JDK: second attempt

After a bit more rummaging, we found out that R only works with Java 1.6. Oh great. So I go back to Oracle's site to download it, and it's of course not there. We track it down on the [Apple site](https://support.apple.com/kb/dl1572?locale=en_US), install it, and reset Java home to point to this version.

```shell
/usr/libexec/java_home -v 1.6.0
set JAVA_HOME (/usr/libexec/java_home -v 1.6.0)
R CMD javareconf
```
## Success!






