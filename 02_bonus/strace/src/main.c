#include "ft_strace.h"

int		main(void)
{
	int status;
	void *addr = NULL;
	void *data = NULL;
	char *arg[] = { "/bin/ls", NULL };
	char *env[] = { NULL };

	int	pid = fork();
	if (pid == 0)
	{
		puts("CHILD");
		ptrace(PTRACE_TRACEME, pid, addr, data);
		execve(arg[0], arg, env);
	}
	else
	{
		wait(&status);
		ptrace(PTRACE_KILL, pid, addr, data);
		puts("PARENT");
	}
	printf("End pid %d\n", pid);
	return 0;
}
