NAME = libarrtools.a
CC = cc 
ifeq ($(UNAME),Darwin)
FLAGS = "-mmacosx-version-min=12.06" -Wall -Werror -Wextra "-arch" "x86_64"
else
FLAGS = -Wall -Werror -Wextra
endif

AR = ar rcs

SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=build/%.o)

OBJ_DIR = build
INC = include

all: $(OBJ_DIR) $(NAME) $(INC)/libarrtools.h

$(NAME): $(OBJ)
	@$(AR) $(NAME) $^

build/%.o: src/%.c
	@$(CC) $(FLAGS) -I$(INC) -c $< -o $@

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)

clean: 
	@$(RM) $(OBJ)
	@echo "Removing $(OBJ)"

fclean: clean 
	@$(RM) $(NAME)
	@echo "Removing $(NAME)..."

re: clean all

.PHONY:all clean fclean re
