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
NAME        = libasm
SRCS        = hello_world.s
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

# Rule: assemble .s -> .o
%.o: %.s
	@echo "$(YELLOW)Assembling: $(GREEN)$<$(RESET)"
	@$(NASM) $(NASMFLAGS) $< -o $@

# Rule: link object files -> final binary
$(NAME): $(OBJS)
	@echo "$(YELLOW)Linking objects...$(RESET)"
	@ld -o $(NAME) $(OBJS)
	@echo "$(GREEN)Compilation successful.$(RESET)"

all: $(NAME)

clean:
	@echo "$(YELLOW)Removing object files...$(RESET)"
	@$(RM) $(OBJS)

fclean: clean
	@echo "$(YELLOW)Removing executable...$(RESET)"
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
