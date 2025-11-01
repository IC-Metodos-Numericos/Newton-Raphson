import sympy as sp
import numpy as np
import os
import matplotlib.pyplot as plt

def newton_raphson(f, df, x0, tol=1e-6, max_iter=100):
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

def plot_iterations(f, root, iterations):
    """
    Plot the function and the iterations of the Newton-Raphson method.
    
    Parameters:
    f : callable
        The function to plot.
    root : float
        The root found by the method.
    iterations : list
        List of x values where the iterations occurred.
    """
    x_vals = np.linspace(min(iterations) - 1, max(iterations) + 1, 4000)
    y_vals = f(x_vals)

    plt.plot(x_vals, y_vals, label='f(x)')
    plt.axhline(0, color='black', lw=0.5, ls='--')
    
    for i in range(len(iterations) - 1):
        plt.plot([iterations[i], iterations[i + 1]], [f(iterations[i]), f(iterations[i + 1])], 'ro-')
    
    
    
    plt.plot(root, f(root), 'b*', markersize=10, label=f'Raiz: {root:.4f}')
    if f_expr is not None:
        # Se for expressão simbólica, converte para string formatada simples
        if isinstance(f_expr, sp.Basic):
            title_str = f"Função: {sp.simplify(f_expr)}"
        else:
            title_str = f"Função: {f_expr}"
    else:
        title_str = "Método de Newton"
    plt.title(title_str)
    plt.xlabel("x")
    plt.ylabel("f(x)")
    plt.legend()
    plt.grid(True)
    # Salvar na pasta 'graphs'
    output_dir = "1d/python/py/graphs"
    os.makedirs(output_dir, exist_ok=True)
    filename = "grafico_newton.png"
    base, ext = os.path.splitext(filename)
    filepath = os.path.join(output_dir, filename)
    counter = 1
    while os.path.exists(filepath):
        filename = f"{base}_{counter}{ext}"
        filepath = os.path.join(output_dir, filename)
        counter += 1
    plt.savefig(filepath)
    print(f"\nO gráfico foi salvo como {filepath}")
    plt.show()

if __name__ == "__main__":

    x = sp.symbols('x')
    func_input = input("Digite a função em x (ex: x**3 - 2*x**2 + 1): ")
    f_expr = sp.sympify(func_input)
    f_prime_expr = sp.diff(f_expr, x)  

    print(f"Função: {f_expr}, Derivada: {f_prime_expr}")

    x0 = float(input("Digite o chute inicial (x0): "))

    # Convertendo as expressões simbólicas para funções numéricas
    f_num = sp.lambdify(x, f_expr, 'numpy')
    f_prime_num = sp.lambdify(x, f_prime_expr, 'numpy')
    x1, iterations = newton_raphson(f_num, f_prime_num, x0)
    plot_iterations(f_num, x1, iterations)