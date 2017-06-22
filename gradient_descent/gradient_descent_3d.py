import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

class Regression(object):
    def __init__(self, file):
        self._seed = np.random.rand()
        self.

    def compute_cost_val(self, x, y, w):
        P = len(y)
        cost = 0

        # run over all data points and weights and compute total error
        for p in range(P):
            x_p = x[p]
            y_p = y[p]
            cost += (w[0] + np.dot(x_p, w[1:]) - y_p) ** 2
        return cost

    def compute_gradient(self, x, y, w):
        P = len(y)
        grad = 0
        for p in range(P):
            x_p = np.array([1, x[p]])
            x_p.shape = (len(x_p), 1)
            y_p = y[p]
            temp = np.dot(x_p * x_p.T, w) - x_p * y_p
            grad += 2 * temp
        return grad

    # gradient descent loop
    def grad_descent(self, x, y, alpha, K, w0):
        w = w0

        # create container to record weights
        whist = []

        # descent loop
        for k in range(K):
            # record current weight
            whist.append(w)

            # compute derivative
            grad = compute_gradient(x, y, w)

            # take descent step
            w = w - alpha * grad

        return whist
