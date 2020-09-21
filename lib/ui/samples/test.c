#include <stdio.h>

void main()
{
    float l, w, p, a;

    scanf("%f", &l);
    scanf("%f", &w);

    a = l * w;
    p = (l+w) * 2;

    printf("%f\n", a);
    printf("%f", p);
}