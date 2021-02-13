---
title: Congruence relations and modular arithmetic
date: 2021-03-23  
comments: false  
tags: maths
keywords: discrete mathematics, mathematical proof, modular arithmetic, congruence modulo, integers modulo m
---

If you cast your mind back to the blog post on relations, you might remember a concept called equivalence classes. These are a consequence of when we have an equivalence relation of a set, and they partition the set into mutually exclusive subsets.

A very important equivalence relation is the congruence relation. This relation is defined by $a$ being related to $b$ if and only if $a - b$ is a multiple of $m$, where $m$ is some natural number. More formally, $a \mathrel{R} b \iff m \mid (a - b)$. You can rather think of $b$ as what we need to subtract from $a$ in order to make it divisible by $m$, or in other words, $b$ is the remainder if we divided $a$ by $m$. We express this relation as $a \equiv b (\mathrm{mod} m)$, meaning that $a$ and $b$ are congruent modulo $m$. (When they are not congruent modulo $m$, we express this as $a \not\equiv b$.) For example, $9 \equiv 1 (\mathrm{mod} 4)$, because $4 \mid (9 - 1) = 8$.

A special thing about congruence relations is that they divide up the entire set of integers into equivalence classes, called congruence classes modulo $m$. This is written as $\mathbb{Z}_m$.For any congruence relation on $\mathbb{Z}$, there are $m$ congruence classes modulo $m$, each lining up with all of the possible values of $b$ when $a$ is divided by $m$. For example, for $\mathbb{Z}_4$, we have four congruence classes:

$$
\begin{aligned}
[0]_4 &= \{\vdots, -8, -4, 0, 4, 8, \vdots\} \\
[1]_4 &= \{\vdots, -7, -3, 1, 5, 9, \vdots\} \\
[2]_4 &= \{\vdots, -6, -2, 2, 6, 10, \vdots\} \\
[3]_4 &= \{\vdots, -5, -1, 3, 7, 11, \vdots\}
\end{aligned}
$$

You can see that all of the integers in $[0]_4$ are those with the remainder 0 when divided by 4, those in $[1]_4$ are those with the remainder 1 when divided by 4, and so on. For any $m$, the congruence classes will range between $[0]_m$ and $[m - 1]_m$. As discussed in the blog post on relations, all members of a congruence class modulo $m$ are considered equivalent, so $[1]_4$ could also be called $[-7]_4$ or $[9]_4$. However, class names are given based on the smallest positive integer (including 0). It also bears repeating that when values are congruent modulo $m$, they belong to the same congruence class modulo $m$. In the example above, we stated that $9 \equiv 1 (\mathrm{mod} 4)$, and you can see that they indeed belong to the same congruence class $[1]_4$.

## Our first proof

Let's apply these facts to solve our first proof. Let's say we are asked to show that $n \equiv 7 (\mathrm{mod} 12)$ implies $n \equiv 3 (\mathrm{mod} 4)$, and also to check if the converse is true. We can start with our definition of the congruence of integers, which is that if $n \equiv 7 (\mathrm{mod} 12)$, then $12 \mid (n - 7)$, and from there use the definition of divisibility to show that this implies that $n - 7 = 12a$, for some $a \in \mathbb{Z}$. Now, defining $n \equiv 3 (\mathrm{mod} 4)$ in the same way, we get $n - 3 = 4b$, for some $b \in \mathbb{Z}$. So, now we want to algebraically manipulate $n - 7 = 12a$ so we get it in the form $n - 3 = 4b$:

$$
\begin{aligned}
n - 7 &= 12a \\
n &= 12a + 7 \\
&= 12a + 4 + 3 \\
&= 4(3a + 1) + 3 \\
n - 3 &= 4(3a + 1)
\end{aligned}
$$

If we redefine $b = 3a + 1$, then we have $n - 3 = 4b$, as we needed. We then work back from this to get $4 \mid (n - 3)$, and then finally n \equiv 3 (\mathrm{mod} 4). So $n \equiv 7 (\mathrm{mod} 12)$ indeed implies $n \equiv 3 (\mathrm{mod} 4)$.

We now move onto looking at the converse. The easiest way to do this is to check what are some members of the congruence class $[3]_4$, which include $\{\vdots, -5, -1, 3, 7, 11, \vdots\}. If we take any of these values $n$ and substitute it into $12 \mid (n - 7)$, then this will be false (for example, $12 \mid (11 - 7)$ is false). Therefore, the converse is not true.

## Manipulating congruence relations

There are a number of ways in which we can manipulate congruence relations, which come in really handy when solving problems within $Z_m$. Assuming that $m \in \mathbb{N}$ and that $a, b, c$ and $d \in \mathbb{Z}$, where $a \equiv b (\mathrm{mod} m)$ and $c \equiv d (\mathrm{mod} m)$, then:
1. $a + c \equiv b + d (\mathrm{mod} m)$
2. $a - c \equiv b - d (\mathrm{mod} m)$
3. $ac \equiv bd (\mathrm{mod} m)$
4. $ka \equiv kb (\mathrm{mod} m) for every k \in \mathbb{Z}$
5. $a^n \equiv b^n (\mathrm{mod} m) for every n \in \mathbb{N}$

We can use the above to solve our next problem. We need to show that, for all $n \in \mathbb{N}$, $3^{3n + 1} \equiv 3 \cdot 5^n (\mathrm{mod} 11)$ and that $2^{4n + 3} \equiv 8 \cdot 5^n (\mathrm{mod} 11)$. Hence, we then show that for all $n \in \mathbb{N}$, $11 \mid (3^{3n + 1} + 2^{4n + 3})$. 

Let's start with showing that $3^{3n + 1} \equiv 3 \cdot 5^n (\mathrm{mod} 11)$. We'll first simply it to $3 \cdot 3^{3n} \equiv 3 \cdot 5^n (\mathrm{mod} 11)$. We can see that both sides are now multiplied by 3, and working backwards from rule 3 above, the congruence relation will hold if we divide both sides by 3: $3^{3n} \equiv 5^n (\mathrm{mod} 11)$. Simplifying this, we get $27^n \equiv 5^n (\mathrm{mod} 11)$, which then means that both sides are raised to the same power $n$. Again, working backwards from rule 5 above, we can take the $\log{n}$ of both sides, leaving us finally with $27 \equiv 5 (\mathrm{mod} 11)$, which is true ($27 - 5 = 22$, which is divisible by 11).

We can do the same thing with $2^{4n + 3} \equiv 8 \cdot 5^n (\mathrm{mod} 11)$. Let's do it all in one go:

$$
\begin{aligned}
2^{4n + 3} &\equiv 8 \cdot 5^n (\mathrm{mod} 11) \\
2^3 \cdot 2^{4n} &\equiv 8 \cdot 5^n \\
8 \cdot 2^{4n} &\equiv 8 \cdot 5^n \\
2^{4n} &\equiv 5^n \\
16^n &\equiv 5^n \\
16 &\equiv 5
\end{aligned}
$$

We end up with $16 \equiv 5 (\mathrm{mod} 11)$, which is also true ($16 - 5 = 11$, which is obviously divisible by 11!). 

As we've now proven that $3^{3n + 1} \equiv 3 \cdot 5^n$ and $2^{4n + 3} \equiv 8 \cdot 5^n (\mathrm{mod} 11)$ are both true, we can now use the first rule above. We'll add the two congruence relations together, and then manipulate the result so that one of the sides is shown to be divisible by 11.

$$
\begin{aligned}
3^{3n + 1} + 2^{4n + 3} &\equiv 3 \cdot 5^n + 8 \cdot 5^n (\mathrm{mod} 11) \\
&\equiv 5^n(3 + 8) \\
&\equiv 11(5^n) \\
\end{aligned}
$$

We now have $3^{3n + 1} + 2^{4n + 3} \equiv 11(5^n) (\mathrm{mod} 11)$. As 11 is in equivalence class $[0]_11$ in $\mathbb{Z}_11$, it is congruence with 0, so we can simplify the above to $3^{3n + 1} + 2^{4n + 3} \equiv 0(5^n) = 0 (\mathrm{mod} 11)$. Hence for all $n \in \mathbb{N}$, $11 \mid (3^{3n + 1} + 2^{4n + 3})$.

## Modular arithmetic

The final part of this (rather long!) blog post is on arithmetic in $\mathbb{Z}_m$. In the regular integer space, we'd carry out arithmetic operations like so:

$$
2 + 3 &= 5
2 \times 3 &= 6
$$

However, in $\mathbb{Z}_m$, this works a bit differently. Let's take again $\mathbb{Z}_4$ again. How would the above operations look?

$$
2 + 3 &= 5 = 1
2 \times 3 &= 6 = 2
$$

We simplify the results of operations to the base member of their congruence class - in other words, those values between 0 and $m - 1$. We'll use this to solve our next problem. By working modulo 7 ($\mathbb{Z}_7$), we need to prove that $2^{n + 2} + 3^{2n + 1}$ is divisible by 7.

The way to approach this problem is simply to try and simplify each part of the expression in modulo 7. Starting with $2^{n + 2}$, we have:

$$
\begin{aligned}
2^{n + 2} &= 2^2 \cdot 2^n (\mathrm{mod} 7) \\
&= 4 \cdot 2^n
\end{aligned}
$$

This does not simply further in modulo 7. Looking now at $3^{2n + 1}$:

$$
\begin{aligned}
3^{2n + 1} &= 3 \cdot 3^{2n} (\mathrm{mod} 7) \\
&= 3 \cdot 9^n \\
&= 3 \cdot 2^n
\end{aligned}
$$

We now add these two simplified results back together to get:

$$
4(2^n) + 3(2^n) = 7(2^n) (\mathrm{mod} 7) \\
$$

Therefore in modulo 7, we've shown that $2^{n + 2} + 3^{2n + 1}$ is divisible by 7, as required.