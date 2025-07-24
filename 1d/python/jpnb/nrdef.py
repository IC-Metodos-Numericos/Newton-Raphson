#!/usr/bin/env python
# coding: utf-8

# In[7]:


import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
import plotly.graph_objects as go
import kaleido as kld
import os


# In[8]:


def newton_raphson(f, df, x0, tol=1e-6, max_iter=100):
    """
    Implements the Newton-Raphson method to find the root of a function.

    Parameters:
        f : function
            Function for which the root is to be found.
        df : function
            Derivative of the function f.
        x0 : float
            Initial guess for the iteration.
        tol : float, optional
            Tolerance for the stopping criterion (default: 1e-6).
        max_iter : int, optional
            Maximum number of iterations (default: 100).

    Returns:
        root : float
            Approximation of the root found.
        iterations : list
            List of x values at each iteration.

    Raises:
        ZeroDivisionError:
            If the derivative is zero at any point.
        ValueError:
            If numerical divergence occurs or the maximum number of iterations is reached.
    """
    x = x0
    iterations = [x0]

    for i in range(max_iter):
        fx = f(x)
        dfx = df(x)

        if dfx == 0:
            raise ZeroDivisionError("Derivada zero. Método falhou.")

        x_new = x - fx / dfx

        if np.isnan(x_new) or np.isinf(x_new):
            raise ValueError("Divergência numérica.")

        iterations.append(x_new)

        if abs(x_new - x) < tol:
            return x_new, iterations

        x = x_new

    raise ValueError("Número máximo de iterações atingido.")



# In[9]:


def plot_newton_plotly(f, f_expr, raiz, iteracoes):
    """
    Plots the Newton-Raphson iterations using Plotly.

    Parameters:
        f : function
            The numerical function to plot.
        f_expr : sympy expression
            The symbolic expression of the function for display.
        raiz : float
            The root found by the Newton-Raphson method.
        iteracoes : list of float
            The list of x values at each iteration.
    Returns:
        None: Displays the plot in a web browser.
    """

    import numpy as np
    import plotly.graph_objects as go
    import sympy as sp

    x_vals = np.linspace(min(iteracoes) - 1, max(iteracoes) + 1, 4000)
    y_vals = f(x_vals)

    fig = go.Figure()

    # Plot the function
    fig.add_trace(go.Scatter(x=x_vals, y=y_vals, mode='lines', name='f(x)'))

    # Plot x and y axes
    fig.add_trace(go.Scatter(x=[min(x_vals), max(x_vals)], y=[0, 0],
                             mode='lines', line=dict(color='black', width=1), showlegend=False))
    fig.add_trace(go.Scatter(x=[0, 0], y=[min(y_vals), max(y_vals)],
                             mode='lines', line=dict(color='black', width=1), showlegend=False))

    # Plot iterations and tangents
    for i in range(len(iteracoes) - 1):
        xi = iteracoes[i]
        yi = f(xi)
        fig.add_trace(go.Scatter(x=[xi, iteracoes[i+1]], y=[yi, 0],
                                 mode='lines', line=dict(color='red', dash='dash'), showlegend=False))
        fig.add_trace(go.Scatter(x=[xi], y=[yi], mode='markers',
                                 marker=dict(color='red', size=8), showlegend=False))
        fig.add_trace(go.Scatter(x=[iteracoes[i+1]], y=[0],
                                 mode='markers', marker=dict(color='green', size=8), showlegend=False))

    # Plot root
    fig.add_trace(go.Scatter(x=[raiz], y=[f(raiz)], mode='markers',
                             marker=dict(color='blue', size=12, symbol='star'),
                             name=f'Root: {raiz:.4f}'))

    # Render symbolic expression as LaTeX
    latex_expr = sp.latex(f_expr)

    fig.update_layout(
        title=f"Newton-Raphson Method: Root at x = {raiz:.4f}<br>Function: {latex_expr}",
        xaxis_title="x",
        yaxis_title="f(x)",
        legend=dict(yanchor="top", y=0.99, xanchor="left", x=0.01),
        width=800,
        height=500
    )
    fig.show()


# In[14]:


def runNRM(f,x0, tol=1e-6, max_iter=100):
    """
    Runs the Newton-Raphson Method interactively.

    Prompts the user to input a mathematical function and an initial guess,
    then computes the root using the Newton-Raphson method, displays the
    function, its derivative, and plots the iterations.

    Returns:
        root (float): The root found by the Newton-Raphson method.
        iterations (list): List of x values at each iteration.
    """

    # Dicionario de funções matemáticas
    locals_dict = {
    "pi": sp.pi,
    "e": sp.E,
    "ln": sp.log,
    "log": sp.log,
    "sin": sp.sin,
    "cos": sp.cos,
    "tan": sp.tan,
    "exp": sp.exp,
    "sqrt": sp.sqrt,
    }   

    print("Método de Newton-Raphson")

    # Define a variável simbólica
    x = sp.symbols('x')

    # Solicita a função ao usuário
    f = f

    # Converte a string da função em uma expressão simbólica
    f_expr = sp.sympify(f, locals=locals_dict)

    # Calcula a derivada da função
    f_prime = sp.diff(f_expr, x)

    # Exibe a função e sua derivada
    f_num = sp.lambdify(x, f, 'numpy')
    f_prime_num = sp.lambdify(x, f_prime, 'numpy')


    # Solicita o ponto inicial
    x0 = x0
    root, iterations = newton_raphson(f_num, f_prime_num, x0, tol=tol, max_iter=max_iter)


    print(f"Função: {f_expr}, \n Derivada: {f_prime}, \n Ponto Inicial (x0): {x0}")
    plot_newton_plotly(f_num, f_expr, root, iterations)

    print(f"Quantidade De Iterações: {len(iterations)}, Raiz: {root:.4f}")

    for i in range(len(iterations)):
        print(f"Iteração {i+1}: x = {iterations[i]:.17f}, f(x) = {f_num(iterations[i]):.17f}")
    return root, iterations
# %%


# In[11]:


#jupyter nbconvert --to script nrdef.ipynb


