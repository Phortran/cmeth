include makevars.mk

FDAFDCobjs = $(builddir)/FDA.o

test_FDAFDC: cor
	$(FC) $(FCFLAGS) $(FCVERB) -I$(moddir) -o $(bindir)/$@.bin $(tstdir)/$@.f90 $(FDAFDCobjs) $(LDFLAGS)

.PHONY: cor
cor:
	$(MAKE) -C $(cordir) FDA

.PHONY: inc
inc:
	$(MAKE) -C $(incdir) all

.PHONY: uts
uts:
	$(MAKE) -C $(utsdir) all

.PHONY: clean
clean:
	rm -rf $(builddir)

.PHONY: install
install:
	mkdir -p $(bindir)
	mkdir -p $(builddir)
	mkdir -p $(moddir)

.PHONY: uninstall
uninstall: clean
	rm -rf $(bindir)
