#!/usr/bin/env python
# coding: utf-8

# In[20]:


import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import plotly.graph_objects as go
import plotly.express as px
import kaleido as kld
import os


# In[21]:


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
        result : dict
            Dictionary containing:
            - 'root': float or None - Approximation of the root found (None if failed)
            - 'iterations': list - List of x values at each iteration
            - 'converged': bool - Whether the method converged
            - 'error_message': str or None - Error message if method failed
            - 'final_iteration': int - Number of iterations performed
    """
    x = x0
    iterations = [x0]
    result = {
        'root': None,
        'iterations': iterations,
        'converged': False,
        'error_message': None,
        'final_iteration': 0
    }

    for i in range(max_iter):  # Changed from max_iter-1 to max_iter
        try:
            fx = f(x)
            dfx = df(x)

            if dfx == 0:
                result['error_message'] = "Derivada zero. Método falhou."
                result['final_iteration'] = i + 1  # Changed to i + 1
                return result

            x_new = x - fx / dfx

            if np.isnan(x_new) or np.isinf(x_new):
                result['error_message'] = "Divergência numérica."
                result['final_iteration'] = i + 1  # Changed to i + 1
                return result

            iterations.append(x_new)

            if abs(x_new - x) < tol:
                result['root'] = x_new
                result['converged'] = True
                result['final_iteration'] = i + 1
                return result

            x = x_new

        except Exception as e:
            result['error_message'] = f"Erro durante cálculo: {str(e)}"
            result['final_iteration'] = i + 1  # Changed to i + 1
            return result

    result['error_message'] = "Número máximo de iterações atingido."
    result['root'] = x  # Return last computed value even if not converged
    result['final_iteration'] = max_iter
    return result


# In[50]:


def plot_newton_plotly(f, f_expr, raiz, iteracoes, xLimit=None, yLimit=None, showTitle=True):
    """
    Plots the Newton-Raphson iterations using Plotly.

    Parameters:
        f : function
            The numerical function to plot.
        f_expr : sympy expression
            The symbolic expression of the function for display.
        raiz : float or None
            The root found by the Newton-Raphson method.
        iteracoes : list of float
            The list of x values at each iteration.
        xLimit : tuple, optional
            The limits for the x-axis (min, max). If None, auto-scaling is
            applied.
        yLimit : tuple, optional
            The limits for the y-axis (min, max). If None, auto-scaling is
            applied.
    Returns:
        None: Displays the plot in a web browser.
    """

    import numpy as np
    import plotly.graph_objects as go
    import sympy as sp

    # Handle case where there's only one iteration
    if len(iteracoes) < 2:
        print("Insufficient iterations to plot.")
        return

    x_vals = np.linspace(min(iteracoes) - 1, max(iteracoes) + 1, 4000)
    y_vals = f(x_vals)

    fig = go.Figure()

    # Plot the function
    fig.add_trace(go.Scatter(x=x_vals, y=y_vals, mode='lines', name='f(x)', line=dict(color='blue', width=2)))

    # Plot x and y axes
    fig.add_trace(go.Scatter(x=[min(x_vals), max(x_vals)], y=[0, 0],
                             mode='lines', line=dict(color='black', width=1), showlegend=False))
    fig.add_trace(go.Scatter(x=[0, 0], y=[min(y_vals), max(y_vals)],
                             mode='lines', line=dict(color='black', width=1), showlegend=False))

    # Plot iterations and tangents with gradient colors
    n_iterations = len(iteracoes) - 1
    if n_iterations > 0:
        # Define start and end colors
        start_color = [1.0, 0.0, 0.0]  # Red
        end_color = [0.0, 0.0, 1.0]    # Blue

        for i in range(n_iterations):
            xi = iteracoes[i]
            yi = f(xi)

            # Calculate gradient color for this iteration
            if n_iterations == 1:
                ratio = 0.5  # Middle color if only one iteration
            else:
                ratio = i / (n_iterations - 1)

            # Interpolate between start and end colors
            r = start_color[0] * (1 - ratio) + end_color[0] * ratio
            g = start_color[1] * (1 - ratio) + end_color[1] * ratio
            b = start_color[2] * (1 - ratio) + end_color[2] * ratio

            # Convert to hex color
            color_hex = f'rgb({int(r*255)},{int(g*255)},{int(b*255)})'

            # Plot tangent line
            fig.add_trace(go.Scatter(x=[xi, iteracoes[i+1]], y=[yi, 0],
                                     mode='lines', line=dict(color='rgb(255,0,144)', dash='dash', width=2), 
                                     showlegend=False))

            # Plot iteration point on curve with gradient color
            fig.add_trace(go.Scatter(x=[xi], y=[yi], mode='markers',
                                     marker=dict(color=color_hex, size=10, 
                                               line=dict(color='black', width=1)),
                                     name=f'Iter {i+1}' if i < 3 or i == n_iterations-1 else None,
                                     showlegend=(i < 3 or i == n_iterations-1)))

            # Plot projection on x-axis with same gradient color but smaller
            fig.add_trace(go.Scatter(x=[iteracoes[i+1]], y=[0],
                                     mode='markers', 
                                     marker=dict(color=color_hex, size=8, symbol='diamond',
                                               line=dict(color='black', width=1)), 
                                     showlegend=False))

    # Plot root if it exists
    if showTitle:
        if raiz is not None:
            fig.add_trace(go.Scatter(x=[raiz], y=[f(raiz)], mode='markers',
                                    marker=dict(color='gold', size=15, symbol='star',
                                              line=dict(color='black', width=2)),
                                    name=f'Root: {raiz:.4f}'))
            title_str = f"Newton-Raphson Method: Root at x = {raiz:.4f}"
        else:
            title_str = "Newton-Raphson Method: No root found"
    else:
        title_str = ""

    # Render symbolic expression as LaTeX
    latex_expr = sp.latex(f_expr)

    fig.update_layout(
        title=f"{title_str}<br>Function: {latex_expr}",
        xaxis_title="x",
        yaxis_title="f(x)",
        legend=dict(yanchor="top", y=0.99, xanchor="left", x=0.01),
        width=1200,
        height=850,
        xaxis=dict(range=xLimit) if xLimit is not None else None,
        yaxis=dict(range=yLimit) if yLimit is not None else None
    )
    fig.show()


# In[23]:


def calc_error(iterations, known_root=None):
    """
    Calculates the absolute error at each iteration of the Newton-Raphson method.

    Parameters:
        iterations (list): List of x values at each iteration.
        known_root (float, optional): The known root to compute error against. If None, computes |x_{n+1} - x_n|.

    Returns:
        errors (list): List of absolute errors.
    """
    if known_root is not None:
        errors = [abs(x - known_root) for x in iterations]
    else:
        errors = [abs(iterations[i+1] - iterations[i]) for i in range(len(iterations)-1)]
    return errors


# In[24]:


def plot_nr_error(errors):
    """
    Plots the absolute error of the Newton-Raphson iterations.
    Parameters:
        errors (list): List of absolute errors.
    Returns:
        None: Displays the error plot.
    """

    fig = px.line(
        x=list(range(1, len(errors) + 1)),
        y=errors,
        markers=True,
        labels={'x': 'Iteration', 'y': 'Absolute Error'},
        title='Newton-Raphson Absolute Error per Iteration',
        log_y=True
    )
    fig.update_layout(width=800, height=500)
    fig.show()


# In[25]:


def runNRM(f,x0, know_root = None, tol=1e-6, max_iter=100, xLimit=None, yLimit=None,showTitle=True, plotError=False):
    """
    Runs the Newton-Raphson Method interactively.

    Prompts the user to input a mathematical function and an initial guess,
    then computes the root using the Newton-Raphson method, displays the
    function, its derivative, and plots the iterations.

    Returns:
        result (dict): Dictionary containing root, iterations, convergence status, and error information.
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
    f_prime = sp.diff(f, x)

    # Exibe a função e sua derivada
    f_num = sp.lambdify(x, f, 'numpy')
    f_prime_num = sp.lambdify(x, f_prime, 'numpy')

    # Solicita o ponto inicial
    x0 = x0
    result = newton_raphson(f_num, f_prime_num, x0, tol=tol, max_iter=max_iter)

    errors = []
    if know_root is not None:
        errors = calc_error(result['iterations'], know_root)

    print(f"Função: {f_expr}, \n Derivada: {f_prime}, \n Ponto Inicial (x0): {x0}")

    # Plot even if root is None, as long as there are iterations
    if len(result['iterations']) > 1:
        plot_newton_plotly(f=f_num, f_expr=f_expr, raiz=result['root'], iteracoes=result['iterations'], xLimit=xLimit, yLimit=yLimit, showTitle=showTitle)
    if plotError and errors:
        plot_nr_error(errors)

    # Display results
    if result['converged']:
        print(f"✓ Convergiu! Quantidade De Iterações: {result['final_iteration']}, Raiz: {result['root']:.4f}")
    else:
        print(f"✗ Não convergiu. Iterações realizadas: {result['final_iteration']}")
        if result['error_message']:
            print(f"Erro: {result['error_message']}")
        if result['root'] is not None:
            print(f"Último valor calculado: {result['root']:.4f}")

    # Display iterations
    for i in range(len(result['iterations'])):
        try:
            f_val = f_num(result['iterations'][i])
            print(f"Iteração {i+1}: x = {result['iterations'][i]:.17f}, f(x) = {f_val:.17f}")
        except:
            print(f"Iteração {i+1}: x = {result['iterations'][i]:.17f}, f(x) = [erro no cálculo]")

    if errors:
        print("\nErros Absolutos:")
        for i, error in enumerate(errors):
            print(f"Iteração {i+1}: Erro = {error:.17f}")

    return result


# In[26]:


# use this command to convert the notebook to a script 
#jupyter nbconvert --to script nrdef.ipynb


# In[ ]:




