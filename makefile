install:
	sudo apt-get install -f flex
	sudo apt-get install bison

run: 
	bison -d lexer.y
	flex lexer.l
	cc -o lexer lex.yy.c lexer.tab.c
	./lexer < test-program-simple.cm > out.txt

test:
	diff out.txt test.txt || exit 1

all:
	make install
	make run
	make test
  
