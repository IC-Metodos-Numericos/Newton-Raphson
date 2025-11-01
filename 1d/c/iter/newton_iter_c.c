#include <stdio.h>

double newtonIter(double (*f)(double),double (*df)(double), double x0, int maxIter)
{
    int x = x0;
    for (int i = 0; i <= maxIter; i++){
        double fx = f(x);
        double dfx = df(x);
        double xNext = x - fx / dfx;
        x = xNext;
    }
    return x;
}

double f(double x){
    return x*x - 2;   
}

double df(double x){
    return 2*x;   
}


int main()
{
    double x0 = 1.0;
    int maxIter = 10;
    double root = newtonIter(f, df, x0, maxIter);
    printf("%.8f",root);
    return 0;
}