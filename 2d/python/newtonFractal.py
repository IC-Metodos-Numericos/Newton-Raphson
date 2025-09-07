import numpy as np
import matplotlib.pyplot as plt

def newton_fractal_plot(f, df, roots=None, xlim=(-2, 2), ylim=(-2, 2), resolution=400, max_iter=30, tol=1e-6, axiss=True, color_map='tab10'):
    
    x = np.linspace(xlim[0], xlim[1], resolution)
    y = np.linspace(ylim[0], ylim[1], resolution)
    X, Y = np.meshgrid(x, y)
    Z = X + 1j * Y

    # Initialize arrays to store root indices and iteration counts
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
    cmap = plt.get_cmap(color_map)
    rgb_colors = np.array([cmap(i % 10)[:3] for i in range(num_roots)])


    fractal = np.zeros(Z.shape + (3,))
    for j in range(1, num_roots + 1):
        mask = (root_ind == j) # Mask for points converging to root j
        color = rgb_colors[j - 1]
        brightness = 0.9 - (iters / max_iter)
        
        # selects the 2d slice for each color channel and applies the mask
        for k in range(3):
            fractal[..., k][mask] = color[k] * brightness[mask]
    fractal[root_ind == 0] = 0 # white for non-converged points

    plt.figure(figsize=(8, 8))
    if axiss:
        plt.axhline(0, color='black', linewidth=0.5, linestyle='solid')
        plt.axvline(0, color='black', linewidth=0.5, linestyle='solid')
    plt.imshow(fractal, extent=(xlim[0], xlim[1], ylim[0], ylim[1]), origin='lower')
    plt.title("Newton's Method Fractal")
    plt.xlabel('Re(z)')
    plt.ylabel('Im(z)')
    plt.show()
