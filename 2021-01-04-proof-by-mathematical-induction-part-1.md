---
title: Proof by mathematical induction: introduction 
date: 2021-01-04  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, proof by induction
---

I'm currently studying abstract mathematics for my maths degree, which involves learning how to [prove all sorts of statements](https://en.wikipedia.org/wiki/Mathematical_proof). One type of proof I really struggled with  initially was proof by [mathematical induction](https://en.wikipedia.org/wiki/Mathematical_induction). However, after being recommended the wonderful [Book of Proof by Richard Hammack](https://www.people.vcu.edu/~rhammack/BookOfProof/), this method of proving statements finally clicked for me. As such I decided to create a few blog posts to hopefully help anyone who is similarly stuck (and help me to remember myself!).

## Motivating example

Let's say that we wish to prove that the sum $1 + 2 + 3 + 4 + \ldots + n$ is equal to $\frac{n^2 + n}{2}$ for every positive integer $n$. Where do we start? We could break down this statement for each case of $n$ like so:

<div>
<table class="table table-bordered">
  <thead>
    <tr style="text-align: right;">
      <th style="text-align:center"><b>$$S_n$$</b></th>
      <th style="text-align:center"><b>$$\textrm{Sum of first } n \textrm{ positive numbers}$$ </b></th> 
      <th style="text-align:center"><b>$$\frac{n^2 + n}{2}$$</b></th> 
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:center">$$S_1$$</td>
      <td style="text-align:center">$$1$$</td>
      <td style="text-align:center">$$1$$</td>
    </tr>
    <tr>
      <td style="text-align:center">$$S_2$$</td>
      <td style="text-align:center">$$1 + 2$$</td>
      <td style="text-align:center">$$3$$</td>
    </tr>
    <tr>
      <td style="text-align:center">$$S_3$$</td>
      <td style="text-align:center">$$1 + 2 + 3$$</td>
      <td style="text-align:center">$$6$$</td>
    </tr>
    <tr>
      <td style="text-align:center">$$S_4$$</td>
      <td style="text-align:center">$$1 + 2 + 3 + 4$$</td>
      <td style="text-align:center">$$10$$</td>
    </tr>
    <tr>
      <td style="text-align:center">$$S_5$$</td>
      <td style="text-align:center">$$1 + 2 + 3 + 4 + 5$$</td>
      <td style="text-align:center">$$15$$</td>
    </tr>
  </tbody>
</table>
</div>

We can see that the statement is true for the first 5 cases, but the problem is that we have to prove this for all positive numbers, which is an infinite set. Even if we had the time and inclination to go through and prove each case individually, we'd never be able to reach the end! We need to instead come up with some sort of rule that will generalise to every statement $S_n$. 

This is exactly what proof by induction is designed to do. What we do first is to prove the first possible statement. In our case, we are dealing with positive integers, so the first possible case is $S_1$. We've already done this in the table above, showing that $1 =\frac{ (1^2 + 1)}{2} = \frac{2}{2} = 1$. This is called the **basis step**. 

We can now move onto proving that all $S_n$ are true, using what is called the **inductive step**. This step uses the fact that we know one statement to be true (in our case, $S_1$), and shows that this implies the next statement to be true. To do so, we generalise our basis step $S_1$ to $S_k$, use the fact we know it is true, and prove that if $S_k$ is true, then $S_{k + 1}$ is also true $[S_k \Rightarrow S_{k + 1}](https://simple.wikipedia.org/wiki/Implication_(logic))$. This results in a sort of domino effect, where if the first pair of $S_k \Rightarrow S_{k + 1}$ is true, then this means that $S_{k + 1} \Rightarrow S_{k + 2}$ is also true, and so on, covering all possible statements $S_n$. 

In our example, this means that if:
$$
1 + 2 + 3 + \ldots + k = \frac{k^2 + k}{2}
$$
then: 
$$
1 + 2 + 3 + \ldots + k + (k + 1) = \frac{(k + 1)^2 + (k + 1)}{2}
$$. 

We now know one fact, that our first statement above is true. We must now prove the second one by showing that the lefthand side is equivalent to the righthand side. This looks like quite a sticky algebraic problem. However, we can use what we already know to our advantage to simplify the expression. The lefthand part of the equation is comprised of $(1 + 2 + 3 + \ldots + k) + ((k + 1))$. As we know that $1 + 2 + 3 + \ldots + k$ is the same as $\frac{k^2 + k}{2}$, we can substitute in this expression. The rest is now a simple case of using algebraic simplification to show the two sides of the equation are indeed equivalent:

$$
\begin{aligned}
1 + 2 + 3 + \ldots + k + (k + 1) &= \frac{(k + 1)^2 + (k + 1)}{2} \\
\frac{k^2 + k}{2} + (k + 1) &= \frac{(k + 1)^2 + (k + 1)}{2} \\
k^2 + k + 2(k + 1) &= (k + 1)^2 + (k + 1) \\
&= k^2 + 2k + 1 + k + 1 \\
&= k^2 + k + 2(k + 1)
\end{aligned}
$$

And voilà! We have shown that, if we assume our first statement $S_k$ to be true, then the subsequent statement $S_{k + 1}$ is also true.

## A more formal example

Let's round off this blog post by showing how a proof by induction could be laid out. We'll take a new problem. Let us say that we wish to prove that the sum $a + ar + ar^2 + \ldots + ar^{n - 1}$ is equal to $a\frac{1 - r^n}{1-r}$, where $r \neq 1$ and $n \in \mathbb{N}$. As $n \in \mathbb{N}$, this is exactly the same as the previous example, where $n$ is in the positive integers. This means our basis step will be the smallest element of that set, 1. Let's get started with laying out the proof.

Proof:  
(1) **Basis step.** Observe that when $n = 1$, then:
$$
\begin{aligned}
ar^{1 - 1} &= a\frac{1 - r^1}{1 - r} \\
a^0 &= a \cdot \frac{1 - r}{1 - r} \\
a &= a
\end{aligned}
$$

(2) **Inductive step.** Say that $k \geq 1$. We will use direct proof to show that if:
$$ar^{1-1} + ar^{2-1} + ar^{3-1} + \ldots + ar^{k-1} = a\frac{1 - r^k}{1 - r}$$
then:
$$ar^{1-1} + ar^{2-1} + ar^{3-1} + \ldots + ar^{k-1} + ar^{(k + 1) - 1} = a\frac{1 - r^{k + 1}}{1 - r}$$.

Suppose that $ar^{1-1} + ar^{2-1} + ar^{3-1} + \ldots + ar^{k-1} = a\frac{1 - r^k}{1 - r}$. Then:

$$
\begin{aligned}
ar^{1-1} + ar^{2-1} + ar^{3-1} + \ldots + ar^{k-1} + ar^{(k + 1) - 1}  &= a\frac{1 - r^{k + 1}}{1 - r} \\
a\frac{1 - r^k}{1 - r} + ar^{(k + 1) - 1} &= a\frac{1 - r^{k + 1}}{1 - r} \\
\frac{1 - r^k}{1 - r} + r^k &= \frac{1 - r^{k + 1}}{1 - r} \\
1 - r^k + r^k(1 - r) &= 1 - r^{k + 1} \\
1 - r^k + r^k - r^{k + 1} &= 1 - r^{k + 1} \\
1 - r^{k + 1} &= 1 - r^{k + 1}
\end{aligned}
$$

It follows by induction that $ar^{1-1} + ar^{2-1} + ar^{3-1} + \ldots + ar^{n-1} = a\frac{1 - r^n}{1 - r}$ for each $n \in \mathbb{N}$. 

And that's it! It takes a bit of practice to get used to the steps, but the core of mathematical induction is proving the statement $S_k \Rightarrow S_{k+1}$, which usually ends up being a relatively straightforward direct proof. In the next blog post, I'll cover how to prove by induction when the statement is written as a summation formula.