.PHONY : clean

all : main.ihx

main.ihx : main.o
	msp430-objcopy -O ihex -S main.o main.ihx

main.srec : main.o
	msp430-objcopy -O srec -S main.o main.srec

main.bin : main.o
	msp430-objcopy -O binary -S main.o main.bin

main.o : main.s
	msp430-as -agl=main.list -o main.o main.s

clean :
	rm -rvf *.o *.ihx *.bin *.list *.srec
