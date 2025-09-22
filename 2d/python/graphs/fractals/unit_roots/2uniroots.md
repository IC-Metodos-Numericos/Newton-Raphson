# Fractal: 2 Unit Root's

## input

```python
n = number_of_roots
f = lambda z: z**n - 1
df = lambda z: n*z**(n-1)
roots = np.array([np.exp(2j * np.pi * k / n) for k in range(n)]) 
newton_fractal_plot(f=f, df = df,roots=roots, resolution=500, axiss=False, tol=1e-6 )
```

## graphs

### n = 2

![Gráfico do resultado para f(x) = arctg(x)](unitroot2.png)

### n = 3

![Gráfico do resultado para f(x) = arctg(x)](unitroot3.png)

### n = 4

![Gráfico do resultado para f(x) = arctg(x)](unitroot4.png)

### n = 5

![Gráfico do resultado para f(x) = arctg(x)](unitroot5.png)

### n = 8

![Gráfico do resultado para f(x) = arctg(x)](unitroot8.png)

### n = 20

![Gráfico do resultado para f(x) = arctg(x)](unitroot20.png)
### observations

