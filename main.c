#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t ft_strlen(const char *s);
char  *ft_strcpy(char *dest, const char *src);

// strlen
void test_strlen()
{
    printf("\n=== ft_strlen ===\n");
    printf("%zu\n", ft_strlen("hello"));
    printf("%zu\n", ft_strlen(""));
    printf("%zu\n", ft_strlen("hello world!"));
    printf("\n=== strlen ===\n");
    printf("%zu\n", strlen("hello"));
    printf("%zu\n", strlen(""));
    printf("%zu\n", strlen("hello world!"));
}

void test_strcpy(void)
{
    char buf1[50];
    char buf2[50];

    printf("\n=== ft_strcpy ===\n");
    printf("returned: %s\n", ft_strcpy(buf1, "hello"));
    printf("returned: %s\n", ft_strcpy(buf1, ""));
    printf("returned: %s\n", ft_strcpy(buf1, "hello world!"));

    printf("\n=== strcpy ===\n");
    printf("returned: %s\n", strcpy(buf2, "hello"));
    printf("returned: %s\n", strcpy(buf2, ""));
    printf("returned: %s\n", strcpy(buf2, "hello world!"));
}

int main(void)
{
    test_strlen();
    test_strcpy();
    return 0;
}
