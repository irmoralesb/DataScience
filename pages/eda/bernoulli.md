# Bernoulli Trials

You can think of a Bernoulli trial as a flip of a possibly biased coin. Specifically, each coin flip has a probability **p** of landing heads (success) and probability <img style="transform: translateY(0.1em); background: white;" src="../../svg/pkwVrpJLxe.svg"> of landing tails (failure). In this exercise, you will write a function to perform n Bernoulli trials, perform_bernoulli_trials(n, p), which returns the number of successes out of n Bernoulli trials, each of which has probability p of success.


```python
def perform_bernoulli_trials(n, p):
    """Perform n Bernoulli trials with success probability p
    and return number of successes."""
    # Initialize number of successes: n_success
    n_success = 0

    # Perform trials
    for i in range(n):
        # Seed will be set outside this funcion
        random_number = np.random.random()

        # If less than p, it's a success so add one to n_success
        if random_number < p:
            n_success = n_success + 1

    return n_success
```