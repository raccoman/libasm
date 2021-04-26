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
				ft_strdup.s \

FILES_BONUS =	ft_atoi_base_bonus.s \
				ft_list_push_front_bonus.s \
				ft_list_size_bonus.s \
				ft_list_sort_bonus.s \
				ft_list_remove_if_bonus.s
:
#Srcs
SRCS =			$(foreach FILE, $(FILES), $(shell find . -name $(FILE)))
SRCS_BONUS =	$(foreach FILE, $(FILES_BONUS), $(shell find . -name $(FILE)))

#Objs
OBJS =			$(SRCS:.s=.o)
OBJS_BONUS =	$(SRCS_BONUS:.s=.o)

%.o: %.s
	@$(MKDIR) $(@D)
	@$(CC) $(CFLAGS) $<

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "Done!"

all: $(NAME)

bonus: $(NAME) $(OBJS_BONUS)
	@ar rcs $(NAME) $(OBJS) $(OBJS_BONUS)

norminette:
	@$(NORM) $(shell find -name *.s)
	@$(NORM) $(shell find -name *.h)

clean:
	@$(RM) $(OBJS) $(OBJS_BONUS)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all bonus norminette clean fclean re
