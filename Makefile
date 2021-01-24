all: build_all

calculator.tab.c calculator.tab.h: calculator.y
	bison -t -v -d calculator.y

lex.yy.c: calculator.l calculator.tab.h
	flex calculator.l

build_all: lex.yy.c calculator.tab.c calculatr.tab.h
	gcc -o calculator calculator.tab.c lex.yy.c

clean:
	rm calculator calculator.tab.c lex.yy.c calculator.tab.h calculator.output
