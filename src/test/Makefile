include ../makevars.mk

TEST_PROGS = test_FDAFDC

test_FDAFDCINC = -I../core/

test_FDAFDC: test_FDAFDC.f90
	cd ../core; make
	$(FC) $(FCFLAGS) $(test_FDAFDCINC) $< -o $@


.PHONY: clean veryclean

clean:
	rm -f $(TEST_PROGS)

veryclean: clean
	cd ../core; make clean
