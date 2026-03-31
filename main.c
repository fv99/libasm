#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t ft_strlen(const char *s);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);

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

void test_strcmp(void)
{
    printf("\n=== strcmp ===\n");
    printf("%d\n", strcmp("hello", "hello")); // 0
    printf("%d\n", strcmp("abc", "abd")); // -1
    printf("%d\n", strcmp("abd", "abc")); // 1
    printf("%d\n", strcmp("", "")); // 0
    printf("%d\n", strcmp("a", "")); // positiv

    printf("\n=== ft_strcmp ===\n");
    printf("%d\n", ft_strcmp("hello", "hello")); // 0
    printf("%d\n", ft_strcmp("abc", "abd")); // -1
    printf("%d\n", ft_strcmp("abd", "abc")); // 1
    printf("%d\n", ft_strcmp("", "")); // 0
    printf("%d\n", ft_strcmp("a", "")); // positiv
}

int main(void)
{
    test_strlen();
    test_strcpy();
    test_strcmp();
    return 0;
}
