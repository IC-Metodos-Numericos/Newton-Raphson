import numpy as np
import matplotlib.pyplot as plt



def newton_raphson(f, df, x0, tol=1e-5, max_iter=100):
    """
    Newton-Raphson method for finding roots of a function.
    
    Parameters:
    f : callable
        The function for which we want to find the root.
    df : callable
        The derivative of the function f.
    x0 : float
        Initial guess for the root.
    tol : float
        Tolerance for convergence.
    max_iter : int
        Maximum number of iterations.
    
    Returns:
    float
        Approximation of the root.
    """
    x = x0
    iterations = [x0]
    for i in range(max_iter):
        fx = f(x)
        dfx = df(x)
        
        if dfx == 0:
            raise ValueError("Derivative is zero. No solution found.")
        
        x_new = x - fx / dfx


        iterations.append(x_new)
        
        if abs(x_new - x) < tol:
            return x, iterations
        
        print(f" Step: {i} -- Current approx.: {x} -- F(x): {fx} -- diff: {dfx}")
        x = x_new
        
        

    
    raise ValueError("Maximum number of iterations reached. No solution found.")

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
    x_vals = np.linspace(min(iterations) - 1, max(iterations) + 1, 400)
    y_vals = f(x_vals)
    
    plt.plot(x_vals, y_vals, label='f(x)')
    plt.axhline(0, color='black', lw=0.5, ls='--')
    
    for i in range(len(iterations) - 1):
        plt.plot([iterations[i], iterations[i + 1]], [f(iterations[i]), f(iterations[i + 1])], 'ro-')
    
    plt.title('Newton-Raphson Method Iterations')
    plt.xlabel('x')
    plt.ylabel('f(x)')
    plt.legend()
    plt.grid()
    plt.show()




if __name__ == "__main__":
    f_num = lambda x: x**2 - 2
    f_prime_num = lambda x: 2*x
    x, iterations = newton_raphson(f_num, f_prime_num, x0=1.0)
    plot_iterations(f_num,1, iterations)