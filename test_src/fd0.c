#include <stdio.h>
#include <stdlib.h>
#include "../gnl_src/get_next_line.h"

int main()
{
	int fd, gr, cnt_line;;
	char *line;

	fd = 0;
	cnt_line = 0;
	while ((gr = get_next_line(fd, &line)) > 0)
	{
		cnt_line++;
		free(line);
	}
	cnt_line++;
	free(line);
	printf("%d ", fd);
	printf("%d ", gr);
	printf("%d ", cnt_line);
		//while ((gr = get_next_line(fd, &line)) >= 0)
		//{
		//	printf("%s\n", line);
		//	free(line);
		//}		


}