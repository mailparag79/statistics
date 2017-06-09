import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import math


%matplotlib inline
fig = plt.figure()

def plot_derivatives(n, plot_vals):
    w = np.linspace(-10,10,n-1).tolist()
    g = math.sin(w) + 0.1*(w**2)
    plt.plot(w,g)
    plt.plot(w,plot_vals,c = 'r')

def derivative_fun_1(v):
    return 4*(v**3) + 2*v + 10

def derivative_fun(v):
    return math.cos(v) + (0.1*2)*v

def gradient_desc(f, w0, k, alpha, max_step=100000):
    plot_vals = []
    prev = w0
    next = 1
    itr = 1
    while itr <= max_step and abs(next) >= k:
        plot_vals.append(prev)
        next = prev - (alpha * f(prev))
        prev = next
        itr += 1

    return next, itr, plot_vals

g = lambda w: w**4 + (w**2) + 10*w
g1 = lambda w: math.sin(w) + 0.1*(w**2)

next, itr, plot_vals = gradient_desc(f = derivative_fun, w0 = 0.5, k = 0.005, alpha = 0.001)
print next, itr, len(plot_vals)

plt.plot(plot_vals)
plt.show()


