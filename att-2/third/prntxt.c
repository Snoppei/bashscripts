#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>

void print_usage() {
	printf("Использование: prntxt -n|--number <N> [-t|--timeout [<T>]] — <TEXT>\n");
}

int main(int argc, char *argv[]) {
	int num_repeats = 0;
	int timeout = 1; // По умолчанию 1 секунда
	char *text = NULL;
	int option;

	struct option long_options[] = {
		{"number", required_argument, 0, 'n'},
		{"timeout", optional_argument, 0, 't'},
		{0, 0, 0, 0}
	};

	while ((option = getopt_long(argc, argv, "n:t:", long_options, NULL)) != -1) {
		switch (option) {
			case 'n':
				num_repeats = atoi(optarg);
				break;
			case 't':
				if (optarg != NULL) {
					timeout = atoi(optarg);
				}
				break;
			default:
				print_usage();
				return 1;
		}
	}

	if (optind < argc) {
		text = argv[optind];
	} else {
		print_usage();
		return 1;
	}

	if (num_repeats <= 0) {
		printf("Число повторов должно быть положительным целым числом.\n");
		return 1;
	}

	for (int i = 0; i < num_repeats; i++) {
		printf("%s\n", text);
		if (i < num_repeats - 1) {
			sleep(timeout);
		}
	}

	return 0;
}
