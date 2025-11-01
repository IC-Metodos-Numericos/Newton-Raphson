import numpy as np

def newton_iter(f, df, x0, max_iter):
    x = x0
    for i in range(max_iter):
        fx = f(x)
        dfx = df(x)
        x_next = x - fx / dfx
        x = x_next
    return x

f = lambda x: x**2 - 2
df = lambda x: 2*x


x0 = 1.0
max_iter = 10
root = newton_iter(f, df, x0=x0, max_iter=max_iter)
print("Raiz aproximada:", root)