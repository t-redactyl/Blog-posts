---
title: Proof by mathematical induction: strong induction  
date: 2021-02-01  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, proof by induction
---

This blog post caps off our series on mathematical induction by discussing another type of induction: proof by strong induction. This is a type of induction that we need to use it doesn't make sense to start from our base case. Instead, we have to establish a number of base cases before we have enough evidence to solve the $k + 1$ case. Let's have a look with a concrete example.

## Motivating example

Let's say that we need to prove that for all positive integers, we want to show that $x_n = 3^{n + 1} - 2^n$. So far, so familiar. However, let's say that we're told that $x_1 = 7$, $x_2 = 23$, and for $n \geq 3$, $x_n = 5x_{n - 1} - 6x_{n - 2}$. Ah. This is a bit different. Not only do we need to establish the truth of $x_1$ and $x_2$ with the information we know, we also have an equation involving $x_{n - 1}$ and $x_{n - 2}$. 

Let's start with the easy part. In the basis step, we show that for $x_1$ and $x_2$, we get the above results using $x_n = 3^{n + 1} - 2^n$. For $x_1$:
$$
\begin{aligned}
x_1 &= 3^{1 + 1} - 2^1 \\
&= 3^2 - 2 \\
&= 7
\end{aligned}
$$

and for $x_2$:

$$
\begin{aligned}
x_2 &= 3^{2 + 1} - 2^2 \\
&= 3^3 - 4 \\
&= 23
\end{aligned}
$$

As always, the basis step was easy. Let's now move onto the inductive step. This is very similar to how we set up this step for regular induction. As we have already established the truth of $x_1$ and $x_2$, we assume:
$$3^{k + 1} - 2^k = 5x_{k - 1} - 6x_{k - 2}$$
to be true, and use this fact to prove that the next statement in the sequence:
$$3^{k + 2} - 2^{k + 1} = 5x_k - 6x_{k - 1}$$
is also true.

You can see that the righthand side of this equation contains two terms, $x_k$ and $x_{k -1}$. We can define these and substitute them into $5x_k - 6x_{k - 1}$ in order to solve our equation, in much the same way we did for regular induction. We already know the definition of $x_k$ from the problem statement:
$$x_k = 3^{k + 1} - 2^k$$
$x_{k - 1}$ is a matter of shifting back one in the sequence, using the same logic we use when shifting one forwards with $x_{k + 1}$:
$$x_{k - 1} = 3^k - 2^{k - 1}$$

From here, it's pretty familiar territory. We set up our equation $x_{k + 1}$, subsitute in the definitions of $x_k$ and $x_{k + 1}$, and then solve algebraically.

$$
\begin{aligned}
x_{k + 1} &= 5x_k - 6x_{k - 1} \\
&= 5(3^{k + 1} - 2^k) - 6(3^k - 2^{k - 1}) \\
&= 5 \cdot 3(3^k) - 6(3^k) - 5(2^k) + 3 \cdot 2(2^{k -1}) \\
&= 5 \cdot 3(3^k) - 6(3^k) - 5(2^k) + 3(2^k) \\
&= 9(3^k) - 2(2^k) \\
&= 3^{k + 2} - 2^{k + 1}
\end{aligned}
$$

And we've arrived at our definition of $x_n$. Having already proven this for $x_1$ and $x_2$, and now, $n \geq 3$, we've shown that $x_n = 3^{n + 1} - 2^n$ for all positive integers.

## A more formal example

As with the other posts, we'll round off by showing how to set out a strong induction proof formally.

Let's say we've been asked to prove, for all positive integers, that $x_n = 3 \cdot 2^{n - 1} + 2(-1)^n$. This sequences is defined by $x_1 = 1$, $x_2 = 8$ and $x_n = x_{n - 1} + 2x_{n - 2}$ for $n \geq 3$.

Proof.  
(1) **Basis step** We first need to verify the results for the cases n = 1 and n = 2. When n = 1, 
$$3 \cdot 2^{1 - 1} + 2(-1)^1 = 3 \cdot 2^0 - 2 = 1$$ 
which is indeed $x_1$, and when n = 2, 
$$3 \cdot 2^{2 - 1} + 2(-1)^2 = 3 \cdot 2 + 2 = 8$$ 
which is $x_2$. As such, the definition of $x_n$ holds for $n = 1$ and $n = 2$.

(2) **Inductive step** Let $k \in \mathbb{N}$ with $k \geq 2$, and suppose that $3 \cdot 2^{n - 1} + 2(-1)^n$ is true for $n = 1, 2, \ldots, k$. In particular, $x_k = 3 \cdot 2^{k - 1} + 2(-1)^k$ and $x_{k - 1} = 3 \cdot 2^{k - 2} + 2(-1)^{k - 1}$. Then:

$$
\begin{aligned}
x_{k + 1} &= x_k + 2x_{k - 1} \\
&= 3 \cdot 2^{k - 1} + 2(-1)^k + 2(3 \cdot 2^{k - 2} + 2(-1)^{k - 1}) \\
&= 3 \cdot 2^{k - 1} + 2(-1)^k + 3 \cdot 2 \cdot 2k^{k - 2} + 2 \cdot 2(-1)^{k - 1} \\
&= 3 \cdot 2^{k - 1} + 3 \cdot 2^{k - 1} + 2(-1)^k + 2 \cdot 2(-1)^{k - 1} \\
&= 3(2^{k - 1} + 2^{k - 1}) + 2((-1)^k + 2(-1)^{k - 1}) \\
&= 3(2 \cdot 2^{k - 1}) + 2((-1)^k + (-1)^{-1} \cdot 2(-1)^k) \\
&= 3(2^k) + 2((-1)^k(1 + 2(-1)^{-1})) \\
&= 3(2^k) + 2((-1)^k(1 + 2(-1))) \\
&= 3(2^k) + 2((-1)^k(-1)^1) \\
&= 3(2^k) + 2((-1)^{k + 1})
\end{aligned}
$$

Thus $3 \cdot 2^{n - 1} + 2(-1)^n$ holds for n = k + 1, therefore by strong induction, it follows that it is true for all positive integers.

That concludes our short series on mathematical induction. I hope this has been a useful explanation for those of you who might have been stuck, and you now feel empowered to tackle this powerful form of proofs.