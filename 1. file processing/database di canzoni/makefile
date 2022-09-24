dj.exe: dj.o db.o db.h
	gcc  dj.o db.o db.h -o dj.exe -lm

dj.o:  dj.c
	gcc dj.c -c

db.o: db.c
	gcc db.c -c -lm

clear:
	rm *.o	