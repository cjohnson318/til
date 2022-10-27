# Bayes Theorem

In general we have,

$$ \Pr(H|E) = \dfrac{\Pr(E|H)\Pr(H)}{\sum\Pr(E)} $$

For the case of two events, $E$ and $\neg E$

$$ \Pr(H|E) = \dfrac{\Pr(E|H)\Pr(H)}{\Pr(E|H)\Pr(H) + \Pr(E| \neg H)\Pr(\neg H)} $$

**Explanation:**
We're interested in the probability that that something happened, H, given that we have evidence, E, that it happened.
So, we're interested in $\Pr(H|E)$.
However, we also need an estimates of $\Pr(H)$, $\Pr(E|H)$ and $Pr(E|\neg H)$.

**Example:**
For a totally made up example, say H is the case that you have Covid-19, and E is a negative test result.
So we want to know the probability that we have Covid-19, given that we've tested negative.
Let's assume that you've been on a flight, but you wore a mask the whole time, so $\Pr(H) = 0.3$.
You *probably* don't have Covid-19, but maybe you do.

The probability that you test negative, given that you are negative is 

$$ \Pr(E|\neg H) = 0.985 $$

The probability that you test negative, given that you are positive is 

$$ \Pr(E|H) = 0.015 $$

Here is the confusion matrix for Covid-19 take home tests.

**************************************
*                  Actual            *
*               Pos.     Neg.        *
*            +---------+---------+   *
*            |  84.6%  |  15.4%  |   * 
*       Pos. |         |         |   *
*            |   TP    |   FP    |   *
*  TEST      +---------+---------+   *
*            |   1.5%  |  98.5%  |   *
*       Neg. |         |         |   *
*            |   FN    |   TN    |   *
*            +---------+---------+   *
**************************************

Then we have, 

$$ \Pr(E|H)\Pr(H) = (0.015)(0.3) = 0.0045 $$ and $$ \Pr(E|\neg H) = (0.985)(0.7) = 0.6895 $$

Therefore,

$$ \Pr(H|E) = \dfrac{0.0045}{0.0045 + 0.6895} = 0.00648 $$

There's a very low chance you have Covid-19, given that you test negative, taking into account that there's a decent chance, 30%, that you were exposed.
The grat thing about Bayes' Theorem is that you can provide additional information, like what you believe your exposure was over your trip.

