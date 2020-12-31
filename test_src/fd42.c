#include <stdio.h>
#include <stdlib.h>
#include "../gnl_src/get_next_line.h"

int main()
{
	int fd, gr, cnt_line;;
	char *line;
		fd = 42;
		cnt_line = 0;
	while ((gr = get_next_line(fd, &line)) > 0)
	{
		cnt_line++;
		free(line);
	}
	printf("%d ", fd);
	printf("%d ", gr);
	printf("%d ", cnt_line);
}
//#include <stdio.h>
//#include <fcntl.h>
//int			main()
//{
//	int fd = open("inputs/ten_newlines", O_RDONLY);
//	//int fd = 42;
//	char *line;
//	int i=0;

// 	while ((i = get_next_line(fd, &line)) > 0)
// 	{
// 		printf("%d --- [%s\n", i, line);
// 		free(line);
// 	}
// 	printf("%d --- [%s\n", i, line);
// 	free(line);
// 	return (0);
//}