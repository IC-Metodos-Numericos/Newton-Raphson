import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

def newton_fractal_frame(f, df, roots, xlim, ylim, resolution, max_iter, tol):
    x = np.linspace(xlim[0], xlim[1], resolution)
    y = np.linspace(ylim[0], ylim[1], resolution)
    X, Y = np.meshgrid(x, y)
    Z = X + 1j * Y

    roots = np.array(roots)
    root_ind = np.zeros(Z.shape, dtype=int)
    iters = np.zeros(Z.shape, dtype=int)
    converged = np.zeros(Z.shape, dtype=bool)

    for i in range(1, max_iter + 1):
        Z = Z - f(Z) / df(Z)
        for j, r in enumerate(roots):
            mask = (np.abs(Z - r) < tol) & (~converged)
            root_ind[mask] = j + 1
            iters[mask] = i
            converged[mask] = True
        if converged.all():
            break

    num_roots = len(roots)
    cmap = plt.get_cmap('tab10')
    rgb_colors = np.array([cmap(i % 10)[:3] for i in range(num_roots)])

    fractal = np.zeros(Z.shape + (3,))
    for j in range(1, num_roots + 1):
        mask = (root_ind == j)
        color = rgb_colors[j - 1]
        brightness = 0.9 - (iters / max_iter)
        for k in range(3):
            fractal[..., k][mask] = color[k] * brightness[mask]
    fractal[root_ind == 0] = 0
    return fractal

def animate_newton_fractal(f, df, roots, xlim=(-2,2), ylim=(-2,2), resolution=400, max_iter=30, tol=1e-6):
    fig, ax = plt.subplots(figsize=(8,8))
    img = ax.imshow(np.zeros((resolution, resolution, 3)), extent=(xlim[0], xlim[1], ylim[0], ylim[1]), origin='lower')
    ax.set_title("Newton's Method Fractal (Animated)")
    ax.set_xlabel('Re(z)')
    ax.set_ylabel('Im(z)')
    ax.axhline(0, color='black', linewidth=0.5, linestyle='solid')
    ax.axvline(0, color='black', linewidth=0.5, linestyle='solid')

    def update(frame):
        fractal = newton_fractal_frame(f, df, roots, xlim, ylim, resolution, frame, tol)
        img.set_data(fractal)
        ax.set_title(f"Newton's Method Fractal - Iterações: {frame}")
        return [img]

    ani = FuncAnimation(fig, update, frames=np.arange(2, max_iter+1), interval=200, blit=True)
    plt.show()
    return ani

# Exemplo de uso:
f = lambda z: z**3 - 1
df = lambda z: 3*z**2
roots = [1, -0.5 + 0.86602540378j, -0.5 - 0.86602540378j]  # Raízes do polinômio z^3 - 1
ani = animate_newton_fractal(f, df, roots)
animate_newton_fractal(f, df, roots)
