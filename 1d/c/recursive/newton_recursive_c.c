#include <stdio.h>

double iterateNewton(double (*f)(double), double (*df)(double), double x, int n){
    if (n == 0){
        return x;
    }
    double xNext = x - ( f(x) / df(x) );
    return iterateNewton(f, df, xNext, n-1);
}

double newtonRecursive(double (*f)(double), double (*df)(double), double x0, int maxIter)
{
    return iterateNewton(f, df, x0, maxIter);
}

double f (double x)
{
        return x*x - 2;
}

double df (double x)
{
    return 2*x;
}

int main()
{
    double x0 = 1.0;
    int maxIter = 10;
    double root = newtonRecursive(f, df, x0, maxIter);
    printf("%.8f",root);
    return 0;
} 