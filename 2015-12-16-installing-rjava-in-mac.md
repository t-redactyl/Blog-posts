---
title: Installing rJava in OS X  
date: 2015-12-16   
comments: false  
tags: R, Programming tips  
keywords:   
---

set JAVA_HOME (/usr/libexec/java_home -v 1.6.0)
echo $JAVA_HOME
R CMD javareconf
/usr/libexec/java_home -v 1.6.0