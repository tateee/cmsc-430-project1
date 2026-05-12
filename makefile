compile: scanner.o listing.o main.o
	g++ -Wall -std=c++11 -o compile scanner.o listing.o main.o

scanner.o: scanner.cc tokens.h listing.h
	g++ -Wall -std=c++11 -c scanner.cc

listing.o: listing.cc listing.h tokens.h
	g++ -Wall -std=c++11 -c listing.cc

main.o: main.cc listing.h tokens.h
	g++ -Wall -std=c++11 -c main.cc

scanner.cc: scanner.l
	flex -o scanner.cc scanner.l

clean:
	rm -f *.o scanner.cc compile listing.txt
