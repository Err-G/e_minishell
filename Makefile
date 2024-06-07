SRC = $(wildcard src/*.c)
OBJ = $(SRC:%.c=obj/%.o)
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -lreadline
NAME = minishell

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME) $(LDFLAGS)

obj/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM)r obj

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
