---
title: A quick introduction to equivalence relations  
date: 2021-02-15  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, equivalence relations
---

An important way of considering a set is how the elements are related to each other. For example, some elements of a set might be less than others, some might be equal, some might belong together because they are even. 

For example, let's say we have the set of all natural numbers, $\mathbb{N}$. Some of the elements of $\mathbb{N}$ are related because $xy = 18$ (also known as the factors of 18). If we list them out, we get:
$$\{(1, 18), (2, 9), (3, 6), (6, 3), (9, 2), (18, 1)\}$$

You probably immediately noticed a number of things about this group. Firstly, this is a set; specifically, a subset of $\mathbb{N}$. Secondly, it consists of all of the ordered pairs of $x \in \mathbb{N}$ that satisfy the rule $xy = 18$. This concept is called a relation, which in informal terms is just a set of ordered pairs of all of the members of our set of interest that conform to some rule or relationship or function. In more formal terms, for $x, y \in$ set $X$, the relation $\mathrel{R}$ includes all members of $X$ where $x\mathrel{R}y$. 

## Properties of relations

Relations have a number of properties. The first is that a relation $\mathrel{R}$ can be **reflexive**. This means that for a set $A$, a $\mathrel{R}$ is reflexive if $x$\mathrel{R}x$ is true for all elements of $A$. Some examples of this are the equality relation, where $x = x$ is true, and the relation where the addition of the members is even, where $x + x$ will be even if $x$ is even.

The second property is that a relation can be **symmetric**. This means that if $x\mathrel{R}y$ is true, then $y\mathrel{R}x$ is also true. Some examples of this are $x + y$, where $y + x$ is also true, and $x \cdot y$, where $y \cdot x$ is also true.

The final property is that a relation can be **transitive**. This means that if $x\mathrel{R}y$ and $y\mathrel{R}z$ is true, then $x\mathrel{R}z$ is also true. Some examples of this is the less than relation, where if $x < y$ and $y < z$, then $x < z$, and similarly, the more than relation, where $x > y$ and $y > z$, then $x > z$. 

## Equivalence classes

When a relation satisfies all three properties above: reflexivity, symmetry and transitivity, it is known as an equivalence relation. Equivalence relations have the special property in that they partition up the entire reference set into mutually exclusive groups called equivalence classes. More formally, the union of two equivalence classes is the empty set, so  $\[a_1\] \cap \[a_2\] = \emptyset$, and the intersection of every equivalence class in a reference set $A$ is $A$ itself, so $\[a_1\] \cup \[a_2\] \cup \ldots \cup \[a_n\] = A$. This is because if we have a relation $x\mathrel{R}y$ on a set $A$, then ever member in an equivalence class will be $\mathrel{R}$-related, and moreover, an equivalence class contains every member of $A$ that is $\mathrel{R}$-related. 

This is quite abstract, so let's look at a more concrete example. Let's make our reference set all prime numbers under 11, so $\{2, 3, 5, 7, 9, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97\}$, and our relation $x\mathrel{R}$ that $x$ and $y$ have the same final digit. So 7 and 37 would be related, for instance. 

We first need to check whether this is an equivalence relation. $\mathrel{R}$ is reflexive, because every number has the same final digit as itself. It's also symmetric, as if $x$ has the same final digit as $y$, then $y$ has the same final digit as $x$. Finally, it's transitive, as if $x$ has the same final digit as $y$, and $y$ has the same final digit as $z$, then $x$ of course has the same final digit as $z$. All three properties being satisfied, we know that $\mathrel{R}$ is an equivalence relation.

Let's start defining the equivalence classes. We'll start with all of the pairs within $P$ that end with 1. Our relation is $P_1 = \{(11, 31), (11, 41), (11, 61), (11, 71), (31, 41), \ldots, (61, 71)\}$, and the corresponding equivalence class is $C_1 = {11, 31, 41, 61, 71}$, or the subset of the elements of our reference set that are $\mathrel{R}$-related. There are six possible digits that these prime numbers can end in, and we can make equivalence classes for them all:
$$
C_2 = \{2\}, \quad C_3 = \{3, 13, 23, 43, 53, 73, 83\}, \quad C_5 = \{5\},
C_7 = \{7, 17, 37, 47, 67, 97\}, \quad C_9 = \{19, 29, 59, 79, 89\}
$$

However, we're not quite there yet. Equivalence classes 

## A more exotic example