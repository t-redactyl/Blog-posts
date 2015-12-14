---
title: Getting rJava to work in OS X El Capitan: A non-technical guide  
date: 2015-12-16   
comments: false  
tags: R, Programming tips  
keywords:   
---

I recently needed to install the `XLConnect` package in R, which has the dependency `rJava`. Unfortunately rJava is one of **those** R packages which is a real pain to install and required a bit of fiddling. I'll talk you through how I installed it in OS X El Capitan (for reference, I'm currently using version 10.11.2).

## First errors first: RStudio

I started by trying to install the `XLConnect` package in RStudio:

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


I'll be the first to admit I am no software engineer, so I had no idea what this meant. Fortunately, my boyfriend **is** a software engineer, so I asked him what I should do.

## Setting up the JDK

He had a look at the [CRAN documentation](https://cran.r-project.org/web/packages/rJava/rJava.pdf) for rJava and said, "Well, you need to install a JDK." I went to Google, found the latest version of the JDK (or Java Development Kit) and installed it (at the time of this post, this was version 1.8). After installing it, I tried running `install.packages("rJava")` in R again. It still didn't work. I went back to my boyfriend, and he told me I hadn't set Java home to point at where my JDK was stored. Oh. He opened up my [Fish](http://fishshell.com/) shell interpreter set the Java home using the following code.

```shell
/usr/libexec/java_home -v 1.8.0
echo $JAVA_HOME
set JAVA_HOME (/usr/libexec/java_home -v 1.8.0)
```

If you are using bash, you can use the alternative code:

```shell
/usr/libexec/java_home -v 1.8.0
echo $JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`
```

As recommended by several StackOverflow posts ([this](http://stackoverflow.com/questions/26755013/install-xlsx-and-rjava-on-mac), for example), we then ran the following R command that reconfigures Java.

```shell
R CMD javareconf
```

I excitedly opened RStudio and ran `install.packages("rJava")` and ... it still didn't work! What the heck? 

## Setting up the JDK: second attempt

After a bit more rummaging, we found out that R only works with Java 1.6. Oh great. (This is despite the instructions in the [rJava documentation](https://cran.r-project.org/web/packages/rJava/rJava.pdf) that indicates you can use any version from 1.2 upwards.) So I went back to Oracle's site to download it, and it's of course not there. We track it down on the [Apple site](https://support.apple.com/kb/dl1572?locale=en_US), install it, and tried to reset Java home to point to this version.

```shell
/usr/libexec/java_home -v 1.6.0
set JAVA_HOME (/usr/libexec/java_home -v 1.6.0)
/usr/libexec/java_home
```

It still wouldn't change the path, so we found this [handy little Fish function](http://stackoverflow.com/questions/21964709/how-to-set-or-change-the-default-java-jdk-version-on-os-x) on StackOverflow:

```shell
function jhome
    set JAVA_HOME (/usr/libexec/java_home $argv)
    echo "JAVA_HOME:" $JAVA_HOME
    echo "java -version:"
    java -version
end
```

The [same user](http://stackoverflow.com/questions/21964709/how-to-set-or-change-the-default-java-jdk-version-on-os-x) also provided an alternative script for bash:

```shell
#!/bin/bash

jhome () {
  export JAVA_HOME=`/usr/libexec/java_home $@`
  echo "JAVA_HOME:" $JAVA_HOME
  echo "java -version:"
  java -version
}
```

You then execute the function as below:

```shell
jhome -v 1.6
```

## Success!

I went back to RStudio for the fourth time and ran:

```r
install.packages("rJava")
```

And it finally worked! I was then able to smoothly install `XLConnect` and extract my Excel data. Whew!