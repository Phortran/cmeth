include ../makevars.mk

FDA.o: FDA.f90
	$(FC) $(FCFLAGS) -c $< -o $@

.PHONY: clean

clean:
	rm -f *.mod *.o
