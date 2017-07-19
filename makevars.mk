#FC = ifort
#FCFLAGS = -O2 -heap-arrays
#DBGFLAGS = -O0 -g -ftrapuv -traceback -check all -check bounds -check uninit   \
#           -debug all -gen-interfaces -warn interfaces -check arg_temp_created \
#					 -fpe0 -fpe-all0 -heap-arrays -stand f03 -assume realloc_lhs -warn   \
#					 all -fstack-protector -assume protect_parens -implicitnone
#
#LDFLAGS = -mkl=sequential
srcdir = srcf
cordir = $(srcdir)/core
incdir = $(srcdir)/include
utsdir = $(srcdir)/utils
tstdir = $(srcdir)/test

bindir := ./bin
builddir := ./build
moddir := $(builddir)/mods

allobjs = $(wildcard $(builddir)/*.o)

# FIXME compiler forced to 'ifort'
FC = ifort

ifeq ($(FC), ifort)
    LDFLAGS = -mkl
    ifeq ($(VERB), REL)
        FCVERB = -DVERB=0
        FCFLAGS = -O3 -xHost -unroll -inline -ip
    else
        FCFLAGS = -O0 -g -traceback -warn all -check bounds -implicitnone
				ifeq ($(VERB), TST)
            FCVERB = -DVERB=3
    		else
            FCVERB = -DVERB=4
				endif
		endif
else
		LDFLAGS =  -L${MKLROOT}/lib/intel64 -Wl,--no-as-needed -lmkl_gf_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl
    ifeq ($(VERB), REL)
        FCVERB = -DVERB=0
        FCFLAGS = -O3 -ffree-line-length-none $(GNUNATIVE) -funroll-loops -finline-functions -flto
    else
        FCFLAGS = -O0 -g -fbacktrace -warn all -fcheck=bounds -fimplicit-none -ffree-line-length-none
				ifeq ($(VERB), TST)
            FCVERB = -DVERB=3
    		else
            FCVERB = -DVERB=4
				endif
    endif
endif
