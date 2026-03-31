#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

size_t ft_strlen(const char *s);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

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

void test_write(void)
{
    ssize_t ret;

    printf("\n=== write ===\n");
    ret = write(1, "hello\n", 6);
    printf("returned: %zd\n", ret);
    ret = write(1, "", 0);
    printf("returned: %zd\n", ret);
    ret = write(-1, "bad fd\n", 7);
    printf("returned: %zd, errno: %d (%s)\n", ret, errno, strerror(errno));

    printf("\n=== ft_write ===\n");
    ret = ft_write(1, "hello\n", 6);
    printf("returned: %zd\n", ret);
    ret = ft_write(1, "", 0);
    printf("returned: %zd\n", ret);
    ret = ft_write(-1, "bad fd\n", 7);
    printf("returned: %zd, errno: %d (%s)\n", ret, errno, strerror(errno));
}

void test_read(void)
{
    char buf1[50];
    char buf2[50];
    ssize_t ret;
    int fd;

    printf("\n=== read ===\n");
    ret = read(-1, buf1, 5);
    printf("bad fd returned: %zd\n", ret);

    fd = open("test.txt", O_RDONLY);
    memset(buf1, 0, 50);
    ret = read(fd, buf1, 12);
    printf("read returned: %zd, buf: %s\n", ret, buf1);
    close(fd);

    printf("\n=== ft_read ===\n");
    ret = ft_read(-1, buf2, 5);
    printf("bad fd returned: %zd\n", ret);

    fd = open("test.txt", O_RDONLY);
    memset(buf2, 0, 50);
    ret = ft_read(fd, buf2, 12);
    printf("read returned: %zd, buf: %s\n", ret, buf2);
    close(fd);
}

int main(void)
{
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_write();
    test_read();

    return 0;
}
