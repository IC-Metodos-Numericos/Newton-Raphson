import numpy as np
import os

import matplotlib.pyplot as plt

def plot_argument(Z):
    plt.figure(figsize=(6, 6))
    plt.imshow(np.angle(Z), extent=[-2, 2, -2, 2], origin='lower', cmap='hsv', alpha=0.8)
    plt.xlabel('Real')
    plt.ylabel('Imaginary')
    plt.title('Complex Plane (Color = Argument)')
    plt.colorbar(label='Argument (radians)')
    plt.grid(True, alpha=0.3)
    return plt

def plot_magnitude(Z):
    plt.figure(figsize=(6, 6))
    plt.imshow(np.abs(Z), extent=[-2, 2, -2, 2], origin='lower', cmap='viridis', alpha=0.8)
    plt.xlabel('Real')
    plt.ylabel('Imaginary')
    plt.title('Complex Plane (Color = Magnitude)')
    plt.colorbar(label='Magnitude')
    plt.grid(True, alpha=0.3)
    return plt

def plot_real_part(Z):
    plt.figure(figsize=(6, 6))
    plt.imshow(np.real(Z), extent=[-2, 2, -2, 2], origin='lower', cmap='coolwarm', alpha=0.8)
    plt.xlabel('Real')
    plt.ylabel('Imaginary')
    plt.title('Complex Plane (Color = Real Part)')
    plt.colorbar(label='Real Part')
    plt.grid(True, alpha=0.3)
    return plt

def plot_imaginary_part(Z):
    plt.figure(figsize=(6, 6))
    plt.imshow(np.imag(Z), extent=[-2, 2, -2, 2], origin='lower', cmap='magma', alpha=0.8)
    plt.xlabel('Real')
    plt.ylabel('Imaginary')
    plt.title('Complex Plane (Color = Imaginary Part)')
    plt.colorbar(label='Imaginary Part')
    plt.grid(True, alpha=0.3)
    return plt

def plot_plane_axes():
    plt.figure(figsize=(6, 6))
    plt.axhline(0, color='black', lw=0.5)
    plt.axvline(0, color='black', lw=0.5)
    plt.xlim(-2, 2)
    plt.ylim(-2, 2)
    plt.xlabel('Real')
    plt.ylabel('Imaginary')
    plt.title('Complex Plane')
    plt.grid(True, alpha=0.3)
    plt.gca().set_aspect('equal', adjustable='box')

def setup_grid():
    x = np.linspace(-2, 2, 400)
    y = np.linspace(-2, 2, 400)
    X, Y = np.meshgrid(x, y)
    Z = X + 1j * Y
    return Z


#save all plots to files
def save_all_plots():
    Z = setup_grid()
    save_dir = r'D:\Users\Enzo HD\Github\Repos\ic-metodos-numericos\Newton-Raphson\2d\python\complexplane\images'
    os.makedirs(save_dir, exist_ok=True)

    # Save argument plot
    plt.figure(figsize=(6, 6))
    plot_argument(Z)
    plt.savefig(os.path.join(save_dir, 'complex_plane_argument.png'))
    print("Saved: complex_plane_argument.png")
    plt.close()

    # Save magnitude plot
    plt.figure(figsize=(6, 6))
    plot_magnitude(Z)
    plt.savefig(os.path.join(save_dir, 'complex_plane_magnitude.png'))
    print("Saved: complex_plane_magnitude.png")
    plt.close()

    # Save real part plot
    plt.figure(figsize=(6, 6))
    plot_real_part(Z)
    plt.savefig(os.path.join(save_dir, 'complex_plane_real_part.png'))
    print("Saved: complex_plane_real_part.png")
    plt.close()

    # Save imaginary part plot
    plt.figure(figsize=(6, 6))
    plot_imaginary_part(Z)
    plt.savefig(os.path.join(save_dir, 'complex_plane_imaginary_part.png'))
    print("Saved: complex_plane_imaginary_part.png")
    plt.close()

    # Save axes plot
    plt.figure(figsize=(6, 6))
    plot_plane_axes()
    plt.savefig(os.path.join(save_dir, 'complex_plane_axes.png'))
    print("Saved: complex_plane_axes.png")
    plt.close()

if __name__ == "__main__":
    save_all_plots()
