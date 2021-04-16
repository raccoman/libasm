#Name
NAME =			libasm.a

#Compiler
CC =			nasm
CFLAGS = 		-f macho64

#Make
MAKE = 			make -s -C
MAKE_CLEAN = 	make clean -s -C
MAKE_FCLEAN = 	make fclean -s -C

#Unzip
UNZIP =			unzip -X -o -q

#Norm
NORM =			norminette

#Shell
MKDIR =			mkdir -p
CP =			cp
RM =			rm -rf

#Files
FILES =			ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup \

#Srcs
SRCS =			$(foreach FILE, $(FILES), $(shell find . -name $(FILE)))

#Objs
OBJS =			$(SRCS:.s=.o)

%.o: %.s
	@$(MKDIR) $(@D)
	@$(CC) $(CFLAGS) $<

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "Done!"

norminette:
	@$(NORM) $(shell find -name *.s)
	@$(NORM) $(shell find -name *.h)

clean:
	@$(RM) $(OBJS)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all norminette clean fclean re
