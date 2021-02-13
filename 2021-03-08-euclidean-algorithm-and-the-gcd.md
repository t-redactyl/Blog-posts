---
title: The greatest common divisor and the Euclidean algorithm
date: 2021-03-08  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, euclidean algorithm, gcd, greatest common divisor
---

In this blog post, we're going to explore some properties of division of integers, and more specifically, a concept called the greatest common divisor. The greatest common divisor, or $\gcd$, is the largest positive integer that divides a pair of integers. For example, take the pair 16 and 24. One method of finding their common divisor is to find the divisors of each integer, and then see which is the largest one they have in common. So the divisors of 16 are $\{-16, -8, -4, -2, -1, 1, 2, 4, 8, 16\}. Likewise for 24, we have $\{-24, -12, -8, -6, -4, -3, -2, -1, 1, 2, 3, 4, 6, 8, 12, 24\}$. Just from eyeballing these two sets, it's obvious that the $\gcd(24, 16)$ is 8. 

However, what do we do when the numbers are large and the set of divisors is not so manageable? We can calculate it using something called the Euclidean algorithm. The way it works is like so. We first need to consider the formal definition of division, which states that $a = bq + r$, where $0 \leq R < B$. What this means is that we take some integer $a$, divide it by $b$ (the divisor) $q$ (quotient) times, and have some remainder $r$ which is always smaller than the divisor $b$. It turns out that these numbers are related by their greatest common divisors, where $\gcd(a, b) = \gcd(b, r)$. So if we want to find the $\gcd(a, b)$, we can use the fact that it is equivalent to $\gcd(b, r)$ to find it. This is still a bit abstract, so let's see how it works using an example.

Let's say we want to find $\gcd(2406, 654)$. Then we first divide 2406, working out the quotient and the remainder:
$$2406 = 654 \cdot 3 + 444$$

So we have $a = 2406$, $b = 654$, $q = 3$ and $r = 444$. We know that $\gcd(2406, 654) = \gcd(654, 444)$, so we can now try to solve for the latter:
$$654 = 444 \cdot 1 + 210$$

Now you can see that we've substituted in $\gcd(b, r)$ for $\gcd(a, b)$, and we now solve for this. We can continue doing this until we end up with a remainder of 0, which means we've found our $\gcd(a, b)$:

$$
\begin{align*}
2406 &= 654 \times 3 + 444 &\Rightarrow gcd(2406, 654) &= gcd(654, 444) \\
654 &= 444 \times 1 + 210 &\Rightarrow gcd(2406, 654) &= gcd(444, 210) \\
444 &= 210 \times 2 + 24 &\Rightarrow gcd(2406, 654) &= gcd(210, 24) \\
210 &= 24 \times 8 + 18 &\Rightarrow gcd(2406, 654) &= gcd(24, 18) \\
24 &= 18 \times 1 + 6 &\Rightarrow gcd(2406, 654) &= gcd(18, 6) \\
18 &= 6 \times 3 &\Rightarrow gcd(2406, 654) &= gcd(6, 0) = 6
\end{align*}
$$

We can see that when we get to $\gcd(18, 6)$ we have a remainder of 0, therefore $\gcd(2406, 654) = 6$

We can abstract the form of this equation as follows:

$$
\begin{aligned}
a = bq_1 + r_1
b = r_1q_2 + r_2
r_1 = r_2q_3 + r_3
r_2 = r_3q_4 + r_4
\vdots
r_{k-4} = r_{k-3}q_{k-2} + r_{k-2}
r_{k-3} = r_{k-2}q_{k-1} + r_{k-1}
r_{k-2} = r_{k-1}q_k
\end{aligned}
$$

## Representing the gcd as a linear combination

As you've seen above, the Euclidean algorithm is a simple way of calculating the gcd of a pair of integers. It turns out to have other applications as well. It turns out the the gcd of any pair of integers can be represented as a linear combination, in the form $d = ma + nb$, where $d$ is our gcd, $a$ and $b$ are the integers we found the gcd of, and $m$ and $n$ are integers we must multiply them by in order to get the gcd. For our example above, we'd be looking for $6 = 2406m + 654n$. But how do we find $m$ and $n$? Well, we can use the results of the calculation above to get the values we need.

Above, we defined that each line can be defined according to the values of $r$ and $q$ in the previous lines in the sequence. We can use this pattern to work out the values of $m$ and $n$, by starting from the second last line and working our way to the top.

Looking at the second last line, $24 = 18 \times 1 + 6$ can be defined as $r_{k - 3} = r_{k - 2}q_{k - 1} + r_{k - 1}$, where $r_{k - 3} = 24$, $r_{k - 2} = 18$, $q_{k - 1} = 1$ and $r_{k - 1} = 6$. Well $r_{k - 1} = 6$ is our $\gcd(2406, 654)$, which is equal to $d$. So we can rearrange the equation to solve for $r_{k - 1}$:

$$
\begin{aligned}
r_{k - 3} &= r_{k - 2}q_{k - 1} + r_{k - 1} \\
r_{k - 3} - r_{k - 1} &= r_{k - 2}q_{k - 1} \\
-r_{k - 1} &= r_{k - 2}q_{k - 1} - r_{k - 3} \\
r_{k - 1} &= -r_{k - 2}q_{k - 1} + r_{k - 3}
\end{aligned}
$$

We can rewrite this is the form $r_{k - 1} = m'r_{k - 2} + n'r_{k - 3}$ by taking $m' = -q_{k - 1}$ and $n' = 1$ (we use $m'$ and $n'$ as we're going to have to calculate a number of $m$s and $n$s, and we need to differentiate them). We're now on our way to representing the equation in the form $d = ma + nb$. 

Having solved for line $k-1$, we now move to the next line $k-2$. We can rearrange this line so that we go from $r_{k-4} = r_{k-3}q_{k-2} + r_{k-2}$ to $r_{k-2} = r_{k-4} - r_{k-3}q_{k-2}$. We can now substitute this into our current equation for $r_{k - 1}$:

$$
\begin{aligned}
r_{k - 1} &= m'r_{k - 2} + n'r_{k - 3} \\
&= m'(r_{k-4} - r_{k-3}q_{k-2}) + n'r_{k - 3} \\
&= m'_{k-4} - m'r_{k-3}q_{k-2} + n'r_{k - 3} \\
&= m'_{k-4} - r_{k-3}(m'q_{k-2} + n')
\end{aligned}
$$

We can now represent $m'q_{k-2} + n'$ as $m''$ and $m'$ as $n''$. We then repeat these steps until we get to a form that contains $a$ and $b$. You can see this in the table below:

<div>
<table class="table table-bordered">
  <thead>
    <tr style="text-align: right;">
      <th style="text-align:center"><b>Iteration</b></th>
      <th style="text-align:center"><b>Raw calculation</b></th> 
      <th style="text-align:center"><b>Rewritten calculation</b></th> 
      <th style="text-align:center"><b>$m$</b></th> 
      <th style="text-align:center"><b>$n$</b></th> 
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:center">1</td>
      <td style="text-align:center">$r_{k-3}-r_{k-2}q_{k-1}$</td>
      <td style="text-align:center">$m'r_{k-2}+n'r_{k-3}$</td>
      <td style="text-align:center">$-q_{k-1}$</td>
      <td style="text-align:center">1</td>
    </tr>
    <tr>
      <td style="text-align:center">2</td>
      <td style="text-align:center">$m'(r_{k-4}-r_{k-3}q_{k-2})+n'r_{k-3}$</td>
      <td style="text-align:center">$m''r_{k-3}+n''r_{k-4}$</td>
      <td style="text-align:center">$n'-m'q_{k-2}$</td>
      <td style="text-align:center">$m'$</td>
    </tr>
    <tr>
      <td style="text-align:center">3</td>
      <td style="text-align:center">$m''(r_{k-5}-r_{k-4}q_{k-3})+n''r_{k-4}$</td>
      <td style="text-align:center">$m'''r_{k-4}+n'''r_{k-5}$</td>
      <td style="text-align:center">$n''-m''q_{k-3}$</td>
      <td style="text-align:center">$m''$</td>
    </tr>
    <tr>
      <td style="text-align:center">4</td>
      <td style="text-align:center">$m'''(b-r_{k-5}q_{k-4})+n'''r_{k-5}$</td>
      <td style="text-align:center">$m''''r_{k-5}+n''''b$</td>
      <td style="text-align:center">$n'''-m'''q_{k-4}$</td>
      <td style="text-align:center">$m'''$</td>
    </tr>
    <tr>
      <td style="text-align:center">5</td>
      <td style="text-align:center">$m''''(a-bq_{k-5})+n''''b$</td>
      <td style="text-align:center">$m'''''b+n'''''a$</td>
      <td style="text-align:center">$n''''-m''''q_{k-5}$</td>
      <td style="text-align:center">$m''''$</td>
    </tr>
  </tbody>
</table>
</div>

Let's now apply this to our problem. To make it easier, let's first get every value of $r$ and $q$ we'll need to work with:

<div>
<table class="table table-bordered">
  <thead>
    <tr style="text-align: right;">
      <th style="text-align:center"><b>Line</b></th>
      <th style="text-align:center"><b>$r$</b></th> 
      <th style="text-align:center"><b>$q$</b></th> 
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:center">$k-1$</td>
      <td style="text-align:center">6</td>
      <td style="text-align:center">1</td>
    </tr>
    <tr>
      <td style="text-align:center">$k-2$</td>
      <td style="text-align:center">18</td>
      <td style="text-align:center">8</td>
    </tr>
    <tr>
      <td style="text-align:center">$k-3$</td>
      <td style="text-align:center">24</td>
      <td style="text-align:center">2</td>
    </tr>
    <tr>
      <td style="text-align:center">$k-4$</td>
      <td style="text-align:center">210</td>
      <td style="text-align:center">1</td>
    </tr>
    <tr>
      <td style="text-align:center">$k-5$</td>
      <td style="text-align:center">444</td>
      <td style="text-align:center">3</td>
    </tr>
  </tbody>
</table>
</div>

We can then solve for $m$ and $n$ like so:

<div>
<table class="table table-bordered">
  <thead>
    <tr style="text-align: right;">
      <th style="text-align:center"><b>Iteration</b></th>
      <th style="text-align:center"><b>Raw calculation</b></th> 
      <th style="text-align:center"><b>Rewritten calculation</b></th> 
      <th style="text-align:center"><b>$m$</b></th> 
      <th style="text-align:center"><b>$n$</b></th> 
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:center">1</td>
      <td style="text-align:center">$24-18\times1$</td>
      <td style="text-align:center">$-1\times18+1\times24$</td>
      <td style="text-align:center">-1</td>
      <td style="text-align:center">1</td>
    </tr>
    <tr>
      <td style="text-align:center">2</td>
      <td style="text-align:center">$-1(210 - 24\times8)+1\times24$</td>
      <td style="text-align:center">$19\times24+-1\times210$</td>
      <td style="text-align:center">$9$</td>
      <td style="text-align:center">$-1$</td>
    </tr>
    <tr>
      <td style="text-align:center">3</td>
      <td style="text-align:center">$9(444-210\times2)+-1(210)$</td>
      <td style="text-align:center">$-19\times210+9\times444$</td>
      <td style="text-align:center">$-19$</td>
      <td style="text-align:center">$9$</td>
    </tr>
    <tr>
      <td style="text-align:center">4</td>
      <td style="text-align:center">$-19(654-444\times1)+9(444)$</td>
      <td style="text-align:center">$28\times444+-19\times654$</td>
      <td style="text-align:center">$28$</td>
      <td style="text-align:center">$19$</td>
    </tr>
    <tr>
      <td style="text-align:center">5</td>
      <td style="text-align:center">$28(2406-654\times3)+-19(654)$</td>
      <td style="text-align:center">$-103\times654 + 28\times2406$</td>
      <td style="text-align:center">$-103$</td>
      <td style="text-align:center">$28$</td>
    </tr>
  </tbody>
</table>
</div>

Which gives us our solution to $d$:

$$d = 28 \times 2406 + (-103) \times 654$