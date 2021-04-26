/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_bonus.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: raccoman <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/26 16:59:35 by raccoman          #+#    #+#             */
/*   Updated: 2021/04/26 16:59:36 by raccoman         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int					ft_strlen(const char *str);
char				*ft_strcpy(char *dst, const char *src);
int					ft_strcmp(const char *s1, const char *s2);
int					ft_write(int fildes, const void *buf, int nbyte);
int					ft_read(int fildes, void *buf, int nbyte);
char				*ft_strdup(const char *s1);
int					ft_atoi_base(char *nbr, char *base);
void				ft_list_push_front(t_list **begin_list, void *data);
int					ft_list_size(t_list *begin_list);
void				ft_list_sort(t_list **begin_list, int (*cmp)());
void				*ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
						void (*free_fct)());
#endif
