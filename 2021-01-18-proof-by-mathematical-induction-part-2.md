---
title: Proof by mathematical induction: summation formulae  
date: 2021-01-18  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, proof by induction
---

In the previous blog post, we talked about how to prove statements using mathematical induction. In this post, we'll continue exploring mathematical induction, this time concentrating on statements expressed as summation formulae. 

## What are summation formulae?

A summation formula is simply an alternative way of expressing an sum of values to $n$. We've already seen such expressions in the previous blog post, where we were dealing with $1 + 2 + 3 + \ldots + n$ and $ar^{1-1} + ar^{2-1} + ar^{3-1} + \ldots + ar^{n-1}$. If we use the summation formula, we could express the first expression as:

$$1 + 2 + 3 + \ldots + n = \sum_{s=1}^{n} s$$

which simply expresses that we want to add every number $s$ between 1 and $n$. Similarly, the second expression can be rewritten using the summation formula as:

$$ar^{1-1} + ar^{2-1} + ar^{3-1} + \ldots + ar^{n-1} = \sum_{s=1}^{n} ar^{s-1}$$

which indicates that we want to add $ar^{s-1}$ for every number $s$ between 1 and $n$. You can see that we'll be doing the exact same thing as with the examples in our previous post, except working with expressions in a different format. Let's kick off again with a motivating example that we'll go through step-by-step.

## Motivating example

Let's say we want to prove, for all $n \in \mathbb{N}$, the statement:
$$\sum_{r=1}^{n} r^2 = \frac{1}{6}n(n + 1)(2n + 1)$$

Remember, the lefthand side of the equation is equivalent to $1^2 + 2^2 + 3^2 + \ldots + n^2$. Let's first prove our basis step, $n = 1$:
$$
\begin{aligned}
1^2 &= \frac{1}{6} \cdot 1 \cdot (1 + 1)(2 \cdot 1 + 1) \\
1 &= \frac{1}{6} \cdot 1 \cdot 2 \cdot 3 \\
&= 1
\end{aligned}
$$

Let's now consider the inductive step. We know that:
$$\sum_{r=1}^{k} r^2 = \frac{1}{6}k(k + 1)(2k + 1)$$
and we want to use this fact to show that:
$$\sum_{r=1}^{k + 1} r^2 = \frac{1}{6}(k + 1)((k + 1) + 1)(2(k + 1) + 1)$$

As above, we can think of $\sum_{r=1}^{k + 1} r^2$ as $1^2 + 2^2 + 3^2 + \ldots + k^2 + (k + 1)^2$. As $\sum_{r=1}^{k} r^2 = 1^2 + 2^2 + 3^2 + \ldots + k^2$, then we can rewrite this as $\sum_{r=1}^{k} r^2 + (k + 1)^2$. What we now need to solve is:
$$\sum_{r=1}^{k} r^2 + (k + 1)^2 = \frac{1}{6}(k + 1)((k + 1) + 1)(2(k + 1) + 1)$$

This should be now looking familiar from the previous blog post. We now have the ability to subsitute in our definition for $\sum_{r=1}^{k} r^2$ from our first statement, $\frac{1}{6}n(n + 1)(2n + 1)$, and from here, solve algebraically as per the examples in the last post:

$$
\begin{aligned}
\sum_{r=1}^{k} r^2 + (k + 1)^2 &= \frac{1}{6}(k + 1)((k + 1) + 1)(2(k + 1) + 1) \\
\frac{1}{6}k(k + 1)(2k + 1) + (k + 1)^2 &= \frac{1}{6}(k + 1)((k + 1) + 1)(2(k + 1) + 1) \\
\end{aligned}
$$

We're going to concentrate on rearranging the lefthand side to equal the righthand side. As such, let's flip them around to make it a bit neater when presenting the equation. 

$$
\begin{aligned}
\frac{1}{6}(k + 1)((k + 1) + 1)(2(k + 1) + 1) &= \frac{1}{6}k(k + 1)(2k + 1) + (k + 1)^2 \\
&= \frac{1}{6}(k(k + 1)(2k + 1) + 6(k + 1)^2) \\
&= \frac{1}{6}(2k^3 + 3k^2 + k + 6k^2 + 12k + 6) \\
&= \frac{1}{6}(2k^3 + 9k^2 + 13k + 6) \\ 
&= \frac{1}{6}(k + 2)(2k^2 + 5k + 3) \\ 
&= \frac{1}{6}(k + 2)(2k + 3)(k + 1) \\ 
&= \frac{1}{6}(k + 1)((k + 1) + 1)(2(k + 1) + 1)
\end{aligned}
$$

I first expanded the expression, and then used cubic factorisation in order to get it to look like what was already on the lefthand side. With a bit more rearrangement, we have the left and righthand sides of the equation equal, and we're proven by induction that our original statement is true.

## A more formal example

As with the last post, let's end by laying out the proof formally with another example. This time, we want to prove by induction, that for all $n \in \mathbb{N}$, $\sum_{i=1}^{n} \frac{1}{i(i + 1)} = \frac{n}{n + 1}$. As we're dealing with $n \in \mathbb{N}$, our basis will be $n = 1$, but the summation formula makes this clear by giving the starting index $i$ as 1 as well.

(1) **Basis step.** Observe that when $n = 1$:
$$
\begin{aligned}
\frac{1}{1(1 + 1)} &= \frac{1}{1 + 1} \\
\frac{1}{2} &= \frac{1}{2}
\end{aligned}
$$

which is obviously true.

(2) **Inductive step.** Let $k \geq 1$. We use direct proof to show that if:  
$$\sum_{i = 1}^{k} \frac{1}{i(i + 1)} = \frac{k}{k + 1}$$
then:  
$$\sum_{i = 1}^{k + 1} \frac{1}{i(i + 1)} = \frac{k + 1}{(k + 1) + 1}$$

Suppose $\sum_{i = 1}^{k} \frac{1}{i(i + 1)} = \frac{k}{k + 1}$. Then:
$$
\begin{aligned}
\sum_{i = 1}^{k + 1} \frac{1}{i(i + 1)} &= \sum_{i = 1}^{k} \frac{1}{i(i + 1)} + \frac{1}{(k + 1)((k + 1) + 1)} \\
&= \frac{k}{k + 1} + \frac{1}{(k + 1)(k + 2)} \\
&= \frac{k(k + 1)(k + 2) + k + 1}{(k + 1)^2(k + 2)} \\
&= \frac{k^3 + 3k^2 + 3k + 1}{(k + 1)^2(k + 2)} \\
&= \frac{(k + 1)^3}{(k + 1)^2(k + 2)} \\
&= \frac{k + 1}{k + 2} \\
&= \frac{k + 1}{(k + 1) + 1}
\end{aligned}
$$

It follows by induction that $\sum_{i=1}^{n} \frac{1}{i(i + 1)} = \frac{n}{n + 1}$ for all $n \in \mathbb{N}$.

I hope that this and the previous blog post have helped to demystify proof by induction. In the final post in this series, we'll tackle a special case of mathematical induction, proof by strong induction.