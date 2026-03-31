#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t ft_strlen(const char *s);

// strlen
void test_strlen()
{
    printf("\nft_strlen:\n");
    printf("%zu\n", ft_strlen("hello"));
    printf("%zu\n", ft_strlen(""));
    printf("%zu\n", ft_strlen("hello world!"));
    printf("\nstrlen:\n");
    printf("%zu\n", strlen("hello"));
    printf("%zu\n", strlen(""));
    printf("%zu\n", strlen("hello world!"));
}

int main(void)
{
    test_strlen();
    return 0;
}
