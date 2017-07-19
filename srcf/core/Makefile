include ../../makevars.mk

FDA: FDA.f90
	$(FC) $(FCFLAGS) -c $< -o $@.o
	mv $@.o ../../$(builddir)
	mv $(shell echo $@ | tr A-Z a-z).mod ../../$(moddir)

.PHONY: clean

clean:
	rm -f *.mod *.o
