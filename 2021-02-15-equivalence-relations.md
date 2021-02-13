---
title: Mathematical relations and equivalence classes  
date: 2021-02-15  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, equivalence relations, reflexive, symmetric, transitive, equivalence classes
---

An important way of thinking about a set is seeing how the elements are related to each other. For example, some elements of a set might be less than others, some might be equal, and some might belong together because they are even. 

For example, let's say we have the set of all natural numbers, $\mathbb{N}$. Some of the elements of $\mathbb{N}$ are related because $xy = 18$ (also known as the factors of 18). If we list them out, we get:
$$\{(1, 18), (2, 9), (3, 6), (6, 3), (9, 2), (18, 1)\}$$

You probably immediately noticed a number of things about this group. Firstly, this is a set; specifically, a subset of $\mathbb{N}$. Secondly, it consists of all of the ordered pairs of $x \in \mathbb{N}$ that satisfy the rule $xy = 18$. This concept is called a relation, which in informal terms is just a set of ordered pairs of all of the members of our set of interest that conform to some rule or relationship or function. In more formal terms, for $x, y \in$ set $X$, the relation $\mathrel{R}$ includes all members of $X$ where $x\mathrel{R}y$. 

## Properties of relations

Relations have a number of properties. The first is that a relation $\mathrel{R}$ can be **reflexive**. This means that for a set $A$, a $\mathrel{R}$ is reflexive if $x\mathrel{R}x$ is true for all elements of $A$. Some examples of this are the equality relation, where $x = x$ is true, and the relation where the addition of the members is even, where $x + x$ will be even if $x$ is even.

The second property is that a relation can be **symmetric**. This means that if $x\mathrel{R}y$ is true, then $y\mathrel{R}x$ is also true. Some examples of this are $x + y$, where $y + x$ is also true, and $x \cdot y$, where $y \cdot x$ is also true.

The final property is that a relation can be **transitive**. This means that if $x\mathrel{R}y$ and $y\mathrel{R}z$ is true, then $x\mathrel{R}z$ is also true. Some examples of this is the less than relation, where if $x < y$ and $y < z$, then $x < z$, and similarly, the more than relation, where $x > y$ and $y > z$, then $x > z$. 

## Equivalence classes

When a relation satisfies all three properties above: reflexivity, symmetry and transitivity, it is known as an equivalence relation. Equivalence relations have the special property in that they partition up the entire reference set into mutually exclusive groups called **equivalence classes**. More formally, the union of two equivalence classes is the empty set, so  $[a_1] \cap [a_2] = \emptyset$, and the intersection of every equivalence class in a reference set $A$ is $A$ itself, so $[a_1] \cup [a_2] \cup \ldots \cup [a_n] = A$. This is because if we have a relation $x\mathrel{R}y$ on a set $A$, then every member within an equivalence class will be $\mathrel{R}$-related to each other, and moreover, an equivalence class contains every member of $A$ that is $\mathrel{R}$-related. 

This is quite abstract, so let's look at a more concrete example. Let's make our reference set all prime numbers under 11, so: 
$$\{2, 3, 5, 7, 9, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97\}$$ 
and define our relation $x\mathrel{R}y$ as $x$ and $y$ having the same final digit. So 7 and 37 would be related, for instance. 

We first need to check whether this is an equivalence relation. $\mathrel{R}$ is reflexive, because every number has the same final digit as itself. It's also symmetric, as if $x$ has the same final digit as $y$, then $y$ has the same final digit as $x$. Finally, it's transitive, as if $x$ has the same final digit as $y$, and $y$ has the same final digit as $z$, then $x$ of course has the same final digit as $z$. All three properties being satisfied, we know that $\mathrel{R}$ is an equivalence relation.

Let's start defining the equivalence classes. We'll start with all of the pairs that end with 1. Our relation is $P_1 = \{(11, 31), (11, 41), (11, 61), (11, 71), (31, 41), \ldots, (71, 61)\}$, and the corresponding equivalence class is $C_1 = \{11, 31, 41, 61, 71\}$, or the subset of the elements of our reference set that are $\mathrel{R}$-related. There are six possible digits that these prime numbers can end in, and we can make equivalence classes for them all:

$$C_2 = \{2\}, \quad C_3 = \{3, 13, 23, 43, 53, 73, 83\}, \quad C_5 = \{5\},$$
$$C_7 = \{7, 17, 37, 47, 67, 97\}, \quad C_9 = \{19, 29, 59, 79, 89\}$$


You can see that each of these subsets are mutally exclusive, and each element within each subset has the same final digit. However, we're not quite there yet. The notation for naming equivalence classes is $[x]$, where $[x]$ is simply the equivalence class that contains $x$. So instead of calling our equivalence class containing those prime numbers ending in 1 $C_1$, we could call it $[11]$. In fact, there is nothing special about 11. It would be equally valid to call this equivalence class $[31]$, $[41]$, $[61]$ or $[71]$. As long as the name references one of the elements of the equivalence class, this is fine. This also means that $[11] = [31] = [41] = [61] = [71]$, as they all reference the same equivalence class $\{11, 31, 41, 61, 71\}$.

## A more exotic example

Let's finish up this post by looking at a more in-depth example. I'll first lay out the question, then we'll break it down and start solving it.

----------

Define the relation $\mathrel{R}$ on the set $\mathbb{N}$ by $x\mathrel{R}y$ if and only if there is some $n \in \mathbb{Z}$ such that $x = 2^ny$. Prove that $\mathrel{R}$ is an equivalence relation. What are its equivalence classes?

-----------

The first thing we need to note is that our reference set for the relation is $\mathbb{N}$, the set of all natural numbers, and that the relation $\mathrel{R}$ is defined by $x = 2^ny$. This means that for every $x$ in the natural numbers, there is some $y$ that can be multiplied by $2^n$ to get that number. Moreover, the $n$ in $2^n$ comes from the integers $\mathbb{Z}$, so can use any integer from negative infinity to positive infinity. Some examples of this relation would be $24 = 2^3 \cdot 3$ and $8 = 2^{-2} \cdot 32$. So in this problem, we need to find some $n \in \mathbb{Z}$ that will allow us to satisfy each of the properties that make up an equivalence relation.

Starting with reflexivity, we need to show that $x = 2^nx$ for some $n \in \mathbb{Z}$. It's clear that the only $n$ that will make this true is 0, as this will convert $2^n$ to 1, so that $x = 2^0 \cdot x = 1 \cdot x = x$. So when $n = 0$, $\mathrel{R}$ is reflexive.

Turning to symmetry, we want to show that if $x\mathrel{R}y$ is $x = 2^ny$, then $y\mathrel{R}x$ is $y = 2^mx$, where both $n$ and $m$ are integers. Notice that we don't need to use the same integer for $x\mathrel{R}y$ and $y\mathrel{R}x$; it just needs to be some number that meets the criteria for being an integer. To get $y\mathrel{R}x$, we solve $x = 2^ny$ for $y$:

$$
\begin{aligned}
x &= 2^ny \\
2^{-n} \cdot 2^n \cdot y &= 2^{-n}x \\
2^{n - n}y &= 2^{-n}x \\
2^0y &= 2^{-n}x \\
1 \cdot y &= 2^{-n}x \\
y &= 2^{-n}x
\end{aligned}
$$

We now have $-n$ as our integer power for $y\mathrel{R}x$, and as $-n = -1 \cdot n$, it is also an integer. To make the leap to $y = 2^mx$, we simply need to define $m = -n$, and we have our proof. Therefore, $\mathrel{R}$ is also reflexive.

Finally, we need to show that $\mathrel{R}$ is transitive. Here, we assume that $x\mathrel{R}y$ and $y\mathrel{R}z$, and we want to show that $x\mathrel{R}z$. This means that we know that $x = 2^ny$ and $y = 2^mz$, and we want to show that $x = 2^kz$, where $n, m$ and $k$ are all integers. Again, note that these are not the same integers for each of the expressions. To solve this, we can substitute in our definition of $y$ into $x = 2^ny$, and simplify this:

$$
\begin{aligned}
x &= 2^ny \\
&= 2^n(2^mz) \\
&= 2^{m + n}z
\end{aligned}
$$

We now have $m + n$ as our integer power for $x\mathrel{R}z$, which as the sum of two integers is also an integer. Again, all we need to do to get to $x = 2^kz$ is define $k = m + n$. We've now shown that if $x\mathrel{R}y$ and $y\mathrel{R}z$, then $x\mathrel{R}z$, so $\mathrel{R}$ is also transitive.

Finally, to get our equivalence classes on $\mathbb{N}$, we define $n$ as the only integer that satisfied all three properties, 0. When $n = 0$, $x = y$, which is the same as the equality relation. As such every $a \in \mathbb{N}$ forms an equivalence class all by itself, i.e., $[a] = \{a\}$. For example, $[2] = \{2\}$, and $[64] = \{64\}$.

A lot of the material in this post was based on the book [Discrete Mathematics by Norman L. Biggs](https://global.oup.com/booksites/content/9780198507185/), whose excellent Chapter 7 gives a very clear overview of relations.