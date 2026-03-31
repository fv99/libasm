# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fvonsovs <fvonsovs@student.42prague.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/03/09 12:46:10 by fvonsovs          #+#    #+#              #
#    Updated: 2025/09/03 13:11:25 by fvonsovs         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


CC          = gcc
CFLAGS      = -Wall -Wextra -Werror
NAME        = libasm.a
SRCS        = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS        = $(SRCS:.s=.o)
NASM        = nasm
NASMFLAGS   = -f
RM          = rm -f
UNAME_S     := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    NASMFLAGS   += elf64
endif
ifeq ($(UNAME_S),Darwin)
    NASMFLAGS   += macho64
    CFLAGS      += -ld_classic --target=x86_64-apple-darwin
endif

# Colors
GREEN       = $(shell printf "\033[0;32m")
YELLOW      = $(shell printf "\033[0;33m")
RESET       = $(shell printf "\033[0m")

# assemble .s -> .o
%.o: %.s
	@echo "$(YELLOW)Assembling: $(GREEN)$<$(RESET)"
	@$(NASM) $(NASMFLAGS) $< -o $@

# link object files -> final binary
$(NAME): $(OBJS)
	@echo "$(YELLOW)Linking objects...$(RESET)"
	@ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)Compilation successful.$(RESET)"

all: $(NAME)

# compile and link test binary
test: $(NAME)
	@echo "$(YELLOW)Compiling tests...$(RESET)"
	@$(CC) $(CFLAGS) main.c -L. -lasm -o test_libasm
	@echo "$(GREEN)Run with: ./test_libasm$(RESET)"

clean:
	@echo "$(YELLOW)Removing object files...$(RESET)"
	@$(RM) $(OBJS)

fclean: clean
	@echo "$(YELLOW)Removing executable...$(RESET)"
	@$(RM) $(NAME) test_libasm

re: fclean all

.PHONY: all clean fclean re
