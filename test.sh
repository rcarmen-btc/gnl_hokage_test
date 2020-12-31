#!/bin/bash

#~~~~~~~~~~~~~~~~There~is~greeting~~~~~~~~~~~~~~~~
cat ASCII-art/begin
echo ""
echo "===================================================="
echo -e "	    Start fast testing your gnl..."
echo "===================================================="

#~~~~~~~~~~~~~~~~Compiling~~~~~~~~~~~~~~~~
gcc -Wall -Werror -Wextra -g test_src/fd42.c gnl_src/get_next_line.c gnl_src/get_next_line_utils.c -D BUFFER_SIZE=1024

#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
read fd gs lines <<< $(./a.out)

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #1 Test #1 Test #1 Test #1 Test #1 Test #1\x1b[0m"
echo -e "\x1b[1;37;40mBUFFER_SIZE = 1024\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  42 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs != -1 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out 42 > logs


#========================================================


#~~~~~~~~~~~~~~~~Compiling~~~~~~~~~~~~~~~~
gcc -Wall -Werror -Wextra -g test_src/fd0.c gnl_src/get_next_line.c gnl_src/get_next_line_utils.c -D BUFFER_SIZE=1024

#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/ten_newlines)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #2 Test #2 Test #2 Test #2 Test #2 Test #2\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 10 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/ten_newlines >> logs


#========================================================


#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/empty)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #3 Test #3 Test #3 Test #3 Test #3 Test #3\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 1 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/empty >> logs


#========================================================


#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/tolstoy.txt)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #4 Test #4 Test #4 Test #4 Test #4 Test #4\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 131 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/tolstoy.txt >> logs



#===
#===



#~~~~~~~~~~~~~~~~Compiling~~~~~~~~~~~~~~~~
gcc -Wall -Werror -Wextra -g test_src/fd42.c gnl_src/get_next_line.c gnl_src/get_next_line_utils.c -D BUFFER_SIZE=1

#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
read fd gs lines <<< $(./a.out)

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #1 Test #1 Test #1 Test #1 Test #1 Test #1\x1b[0m"
echo -e "\x1b[1;37;40mBUFFER_SIZE = 1\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  42 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs != -1 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out 42 > logs


#========================================================


#~~~~~~~~~~~~~~~~Compiling~~~~~~~~~~~~~~~~
gcc -Wall -Werror -Wextra -g test_src/fd0.c gnl_src/get_next_line.c gnl_src/get_next_line_utils.c -D BUFFER_SIZE=1

#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/ten_newlines)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #2 Test #2 Test #2 Test #2 Test #2 Test #2\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 10 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/ten_newlines >> logs


#========================================================


#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/empty)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #3 Test #3 Test #3 Test #3 Test #3 Test #3\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 1 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/empty >> logs


#========================================================


#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/tolstoy.txt)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #4 Test #4 Test #4 Test #4 Test #4 Test #4\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 131 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/tolstoy.txt >> logs



#==
#==



#~~~~~~~~~~~~~~~~Compiling~~~~~~~~~~~~~~~~
gcc -Wall -Werror -Wextra -g test_src/fd42.c gnl_src/get_next_line.c gnl_src/get_next_line_utils.c -D BUFFER_SIZE=7

#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
read fd gs lines <<< $(./a.out)

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #1 Test #1 Test #1 Test #1 Test #1 Test #1\x1b[0m"
echo -e "\x1b[1;37;40mBUFFER_SIZE = 7\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  42 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs != -1 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out 42 > logs


#========================================================


#~~~~~~~~~~~~~~~~Compiling~~~~~~~~~~~~~~~~
gcc -Wall -Werror -Wextra -g test_src/fd0.c gnl_src/get_next_line.c gnl_src/get_next_line_utils.c -D BUFFER_SIZE=7

#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/ten_newlines)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #2 Test #2 Test #2 Test #2 Test #2 Test #2\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 10 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/ten_newlines >> logs


#========================================================


#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/empty)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #3 Test #3 Test #3 Test #3 Test #3 Test #3\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 1 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd $fd.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/empty >> logs


#========================================================


#~~~~~~~~~~~~~~~~Getting~out~puts~~~~~~~~~~~~~~~~
test=$(./a.out < inputs/tolstoy.txt)
read fd gs lines <<< $test

#~~~~~~~~~~~~~~~~Just~for~user~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;31mTest #4 Test #4 Test #4 Test #4 Test #4 Test #4\x1b[0m"
echo -e "\x1b[1;37;40mOutput of yor programm:\x1b[0m"
echo -e "\x1b[1;37;40mfd = $fd; | gnl return = $gs; | cout of lines = $lines;\x1b[0m"
echo -e "\x1b[1;47;40mTests status:\x1b[0m"

#~~~~~~~~~~~~~~~~Print~test~status~~~~~~~~~~~~~~~~
echo -e "\x1b[33mfd\x1b[0m \c"
if [ $fd !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the fd. The fd must be equal 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mgnl return\x1b[0m \c"
if [ $gs !=  0 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the read return. The gnl return must be -1, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi
echo -e "\x1b[33mcount of lines\x1b[0m \c"
if [ $lines != 131 ]; then
	echo -e "\x1b[31m[KO]: Error!!! Check the count of lines. The count of lines must be 0, when fd 42.\x1b[0m"
else
	echo -e "\x1b[32m[OK]\x1b[0m"
fi

#~~~~~~~~~~~~~~~~Valgrind~~~~~~~~~~~~~~~~
echo -e "\x1b[1;47;40mValgrind:\x1b[0m"
valgrind --leak-check=full --show-leak-kinds=all ./a.out < inputs/tolstoy.txt >> logs

rm ./a.out
