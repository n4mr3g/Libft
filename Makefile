# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gpiccion <gpiccion@student.42wolfsburg.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/24 23:31:43 by gpiccion          #+#    #+#              #
#    Updated: 2021/11/24 23:31:43 by gpiccion         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

############## VARIABLES ##############

NAME 		= libft.a
CC			= cc
CFLAGS		= -Wall -Wextra -Werror

# Libc functions:
LIBFT 		= \
			ft_atoi.c ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_strlen.c ft_memset.c ft_bzero.c \
			ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c \
			ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c

# Additional functions:
ADDITIONAL 	= \
			ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c \
			ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

# Bonus functions:
BONUS		 = \
			ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c  \
			ft_lstiter.c ft_lstmap.c ft_lstdelone.c ft_lstclear.c

SRC			= $(LIBFT) $(ADDITIONAL)
OBJ			= $(SRC:.c=.o)
BONUS_OBJ	= $(BONUS:.c=.o)


############## RULES ##############

all: $(NAME)

$(NAME): $(OBJ) 
		ar rcs $(NAME) $(OBJ)

%.o: %.c
		$(CC) $(CFLAGS) -c $^ -o $@

bonus: $(BONUS_OBJ) $(OBJ) 
		ar rcs $(NAME) $(BONUS_OBJ) $(OBJ)

clean:
		rm -f $(OBJ) $(BONUS_OBJ)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re