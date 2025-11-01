"""
Implementação do método de Newton-Raphson de forma recursiva.
"""
def newton_recursive(f, df, x0, max_iter):
    return iterateNewton(f, df, x0, max_iter)

def iterateNewton(f, df, x, n):
    if n == 0:
        return x
    x_next = x - f(x) / df(x)
    return iterateNewton(f, df, x_next, n - 1)

f = lambda x: x**2 - 2
df = lambda x: 2*x


x0 = 1.0
max_iter = 10

root = newton_recursive(f, df, x0=x0, max_iter=max_iter)
print("Raiz aproximada:", root)