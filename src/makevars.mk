FC = ifort
FCFLAGS = -O2 -heap-arrays
DBGFLAGS = -O0 -g -ftrapuv -traceback -check all -check bounds -check uninit   \
           -debug all -gen-interfaces -warn interfaces -check arg_temp_created \
					 -fpe0 -fpe-all0 -heap-arrays -stand f03 -assume realloc_lhs -warn   \
					 all -fstack-protector -assume protect_parens -implicitnone

LDFLAGS = -mkl=sequential
