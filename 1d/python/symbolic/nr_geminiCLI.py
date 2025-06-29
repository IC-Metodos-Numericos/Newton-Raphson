"""
# Método de Newton para encontrar raízes de funções
Este script implementa o método de Newton para encontrar raízes de uma função simbólica.
Ele permite ao usuário inserir uma função e um ponto inicial, e exibe as iterações
realizadas, a raiz encontrada e um gráfico da função com as iterações do método de
Newton.

Implementado pelo Gemini CLI
"""

import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
import os

def newton_method(f, x0, tol=1e-6, max_iter=100):
    """
    Implementa o método de Newton para encontrar a raiz de uma função.

    Args:
        f: A função (simbólica, do sympy).
        x0: O ponto inicial.
        tol: A tolerância para a convergência.
        max_iter: O número máximo de iterações.

    Returns:
        Uma tupla contendo a raiz encontrada e a lista de iterações.
    """
    x = sp.symbols('x')
    df = sp.diff(f, x) # Derivada da função
    g = x - f / df # Função de iteração de Newton

    f_lambda = sp.lambdify(x, f, 'numpy') # Função original
    g_lambda = sp.lambdify(x, g, 'numpy') # Função de iteração

    iterations = [x0]
    print("\n--- Tabela de Iterações ---")
    print("{:<10} {:<20} {:<20}".format("Iteração", "Valor de x", "Erro |x_n - x_{n-1}|"))
    print("-" * 50)

    for i in range(max_iter):
        x1 = g_lambda(x0)
        error = abs(x1 - x0)
        iterations.append(x1)
        print("{:<10} {:<20.10f} {:<20.10f}".format(i + 1, x1, error))
        if error < tol:
            return x1, iterations
        x0 = x1
    return x1, iterations

def main():
    """
    Função principal do programa.
    """
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
    
    x = sp.symbols('x')

    # Entrada do usuário
    str_f = input("Digite a função f(x) (ex: x**2 - 2): ")
    try:
        f = sp.sympify(str_f, locals=locals_dict)
    except (sp.SympifyError, SyntaxError):
        print("Função inválida. Por favor, use a sintaxe do Python (ex: x**2 - 4).")
        return

    try:
        x0_str = input("Digite o ponto inicial x0: ")
        x0 = float(x0_str)
    except ValueError:
        print("Ponto inicial inválido. Por favor, insira um número.")
        return

    # Funções de iteração
    df = sp.diff(f, x)
    g_newton = x - f / df

    print("\n--- Funções de Iteração ---")
    print(f"f(x) = {f}")
    print(f"f'(x) = {df}")
    print(f"Função de iteração de Newton, g(x) = {g_newton}")

    # Análise de Convergência
    print("\n--- Análise de Convergência ---")
    print("O método de Newton geralmente oferece convergência quadrática, que é a mais rápida,")
    print("desde que a estimativa inicial esteja suficientemente próxima da raiz e f'(raiz) != 0.")
    g_newton_prime = sp.diff(g_newton, x)
    print(f"A derivada da função de iteração de Newton é g'(x) = {g_newton_prime}")
    print("Para garantir a convergência, o critério é que |g'(x)| < 1 na vizinhança da raiz.")
    print("No caso do método de Newton, g'(x) se aproxima de 0 perto da raiz, o que garante uma convergência muito rápida.")


    # Execução do método de Newton
    raiz, iteracoes = newton_method(f, x0)

    print("\n--- Resultados ---")
    print(f"A raiz encontrada é: {raiz}")
    print("Iterações:", iteracoes)

    # Plotagem do gráfico
    plot_newton(f, raiz, iteracoes)


def plot_newton(f, raiz, iteracoes):
    """
    Plota o gráfico da função e os passos do método de Newton.]

    Args:
        f: A função simbólica.
        raiz: A raiz encontrada pelo método de Newton.
        iteracoes: Lista de iterações realizadas pelo método.
    """
    x = sp.symbols('x')
    f_lambda = sp.lambdify(x, f, 'numpy')
    df_lambda = sp.lambdify(x, sp.diff(f, x), 'numpy')

    x_vals = np.linspace(min(iteracoes) - 1, max(iteracoes) + 1, 400)
    y_vals = f_lambda(x_vals)

    plt.figure(figsize=(10, 6))
    plt.plot(x_vals, y_vals, label=f'f(x) = {str(f)}')
    plt.axhline(0, color='black', linewidth=0.5)
    plt.axvline(0, color='black', linewidth=0.5)

    # Plota as iterações
    for i in range(len(iteracoes) - 1):
        xi = iteracoes[i]
        yi = f_lambda(xi)
        # Linha da tangente
        tangent_x = np.array([xi, iteracoes[i+1]])
        tangent_y = np.array([yi, 0])
        plt.plot(tangent_x, tangent_y, 'r--')
        plt.plot(xi, yi, 'ro') # Ponto na curva
        plt.plot(iteracoes[i+1], 0, 'go') # Ponto no eixo x

    plt.plot(raiz, f_lambda(raiz), 'b*', markersize=10, label=f'Raiz: {raiz:.4f}')
    plt.title("Método de Newton")
    plt.xlabel("x")
    plt.ylabel("f(x)")
    plt.legend()
    plt.grid(True)
    filename = "grafico_newton.png"
    base, ext = os.path.splitext(filename)
    counter = 1
    while os.path.exists(filename):
        filename = f"{base}_{counter}{ext}"
        counter += 1
    plt.savefig(filename)
    print(f"\nO gráfico foi salvo como {filename}")
    plt.show()


if __name__ == "__main__":
    main()

    
