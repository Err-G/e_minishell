#include <stdio.h>
#include <stdlib.h>
#include <readline/readline.h>
#include <readline/history.h>

void	*ffree(void *ptr)
{
	return (free(ptr), NULL);
}

int	main(void)
{
	char	*line;

	line = readline("$ ");
	while (line)
	{
		if (!strcmp(line, "exit"))
		{
			printf("exit\n");
			break ;
		}
		printf("%s\n", line);
		add_history(line);
		line = ffree(line);
		line = readline("$ ");
	}
	line = ffree(line);
	return (0);
}
