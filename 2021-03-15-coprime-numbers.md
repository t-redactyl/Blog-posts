---
title: Coprime numbers
date: 2021-03-15  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, gcd, greatest common divisor, coprime pairs
---

In the last blog post, we talked about divisibility and the greatest common divisor, or $\gcd$. You might have been wondering already in that post what happens when two integers don't have any common divisors? Well, in this case, as 1 divides every divisor, their $\gcd$ is equal to 1. Such pairs of numbers are called coprime, and they have applications in other areas of mathematics (such as modular arithmetic). In this post, we'll have a look at a couple of ways of determining if pairs of numbers are coprime, and we'll also have a look at a proof involving coprime integers.

## Definition of a coprime pair

From the previous post, we know that when we have $d = \gcd(a, b)$, then we can represent $d$ as a linear combination of $a$ and $b$, such that $am + bn = d$. This holds true also for coprime pairs, however, this time, $am + bn = 1$. But how do we connect these two facts? We can use the following elegant proof below.

Let's say that we have a pair of natural numbers, $a$ and $b$, and integers $m$ and $n$. We know that $am + bn = 1$. What we need to now show is that these numbers are coprime, that is, that the $\gcd(a, b) = 1$. As we're trying to find the $\gcd(a, b)$, let's suppose there is some common divisor of the two which we'll call $c$ (where $c \in \mathbb{Z}$). As $c$ is a divisor of both $a$ and $b$, this means that $c \mid a$ and $c \mid b$, and by the definition of divisibility, $a = cd$ and $b = cf$ for some $d, f \in \mathbb{Z}$. We now have some new definitions of $a$ and $b$, and we can substitute them into the linear equation we were given above:

$$
\begin{aligned}
am + bn &= 1 \\
cdm + cfn &= 1 \\
c(dm + fn) &= 1
\end{aligned}

As $dm + fn$ is a linear combination of integers, it is also an integer, so let's redefine it as $g = dm + fn$, where $g \in \mathbb{Z}$. So our equation above becomes $1 = cg$, indicating that $c \mid 1$. As $c \in \mathbb{Z}$, then the only possible values of $c$ are $\pm 1$. However, as $a$ and $b$ are both in $\mathbb{N}$, $c$ cannot be a negative number, so $c = 1$. This means that as the only common divisor of $a$ and $b$, $c$ is also the $\gcd(a, b)$, meaning $\gcd(a, b) = 1$ and that $a$ and $b$ are coprime.

## Another way of defining coprime pairs

Let's move onto a more complicated example. Let's say that we've been asked to show that for all $n \in \mathbb{N}$, the numbers $9n + 8$ and $6n + 5$ are coprime. This time the simplest path forward is to revisit the Euclidean algorithm that we discussed in the last post. We start with the idea that we're trying to find the $\gcd(9n + 8, 6n + 5)$. We start as per usual with the Euclidean algorithm, where we divide the larger number $9n + 8$ by the smaller number $6n + 5$:

$$
9n + 8 = 6n + 5 \times 1 + 3n + 3
$$

We now have $\gcd(b, r)$, in this case $\gcd(6n + 5, 3n + 3)$. We can proceed as normal with the Euclidean algorithm, using the fact that $\gcd(a, b) = \gcd(b, r)$ to seed each successive line until we get to our common divisor:

$$
\begin{align*}
9n + 8 &= 6n + 5 \times 1 + 3n + 3 &\Rightarrow gcd(9n + 8, 6n + 5) &= gcd(6n + 5, 3n + 3) \\
6n + 5 &= 3n + 3 \times 1 + 3n + 2 &\Rightarrow gcd(6n + 5, 3n + 3) &= gcd(3n + 3, 3n + 2) \\
3n + 3 &= 3n + 2 \times 1 + 1 &\Rightarrow gcd(3n + 3, 3n + 2) &= gcd(3n + 2, 1)
\end{align*}
$$

Quickly ducking out of our Euclidean algorithm, we can now simplify the equation to get rid of $3n# from both sides:

$$
\begin{align*}
3n + 3 = 3n + 2 \times 1 + 1 \\
3 = 2 \times 1 + 1
\end{align*}
$$

Continuing on, we get:

$$
\begin{align*}
3 &= 2 \times 1 + 1 &\Rightarrow gcd(3, 2) &= gcd(2, 1) \\
2 &= 1 \times 1 + 1 &\Rightarrow gcd(2, 1) &= gcd(1, 1) \\
1 &= 1 \times 1 + 0 &\Rightarrow gcd(1, 1) &= gcd(1, 0)
\end{align*}
$$

And with this, we've found that the $\gcd(9n + 8, 6n + 5) = 1$, meaning that these integers are coprime for every $n \in \mathbb{N}$.

## A proof using coprime pairs

We'll end this post by showing how we can exploit what we know about coprime pairs to complete a proof. Suppose that $a, b \in \mathbb{N}$ and that $gcd(a, b) = 1$. Suppose also that $a \mid r$ and $b \mid r$. What we need to show is that $ab \mid r$.

Given that $a$ and $b$ are coprime, we know right away that $am + bn = 1$ for some $m, n \in \mathbb{Z}$. We also know that $a \mid r$ and $b \mid r$, so by the definition of divisibility, $r = ax$ and $r = by$ for some $x, y \in mathbb{Z}$. We're trying to show that $ab \mid r$, so ideally we want some equation where $r = abz$, where $z$ is some integer. We can exploit the fact that if we multiply $am + bn = 1$ by some value, the righthand side will now equal that value. Let's try this with $r$:

$$
\begin{aligned}
r(am + bn) &= r \\
ram + rbn &= r
\end{aligned}
$$

Ah ha! We have half of the problem solved, where we now have $r$ on one side of the equation. How do we get $ab$ as a common factor on the lefthand side? Well, we still have the fact that $r = ax$ and $r = by$. We can subsitute these into our lefthand side, but we can be a little clever and use the definition that involves $a$ in with $bn$ and the definition that involves $b$ with $am$:

$$
\begin{aligned}
ram + rbn &= r \\
by \cdot am + ax \cdot bn &= r \\
abmy + abnx &= r \\
ab(my + nx) &= r
\end{aligned}
$$

We're almost there. The last step is to define $z = my + nx$, where we know that $my + nz$ is in $\mathbb{Z}$ as a linear combination of integers, giving us $r = abz$. Rewriting this, $ab \mid r$, as required.