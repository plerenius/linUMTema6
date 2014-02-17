CC = gcc -g
LIBFLAG = -L. -lresistance -lpower -lcomponent -Wl,-rpath,lib

all:		electrotest

electrotest:	src/electrotest.c libresistance.so libpower.so libcomponent.so
		$(CC) -o electrotest src/electrotest.c $(LIBFLAG)

resistance:	libresistance.so

libresistance.so:	resistance/src/resistance.c resistance/src/resistance.h 
			$(CC) -c -fPIC resistance/src/resistance.c
			$(CC) -shared -fPIC -o lib/libresistance.so resistance.o
power:	libpower.so

libpower.so:	power/src/power.c power/src/power.h 
			$(CC) -c -fPIC power/src/power.c
			$(CC) -shared -fPIC -o lib/libpower.so power.o

component:	libcomponent.so

libcomponent.so:	component/src/component.c component/src/component.h 
			$(CC) -c -fPIC component/src/component.c
			$(CC) -shared -fPIC -o lib/libcomponent.so component.o


clean:
	rm -f *.o *.so lib/* electrotest 
