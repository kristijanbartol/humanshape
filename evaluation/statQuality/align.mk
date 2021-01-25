# Linux settings.
#MATLAB_HOME = /usr/lib/matlab-8.4/
MATLAB_HOME = /home/kristijan/MATLAB/R2019b/
MEX         = $(MATLAB_HOME)/bin/mex
MEXSUFFIX   = mexa64
#CXX         = g++-4.7
CXX         = g++
CFLAGS      = -O3 -fPIC -pthread 

TARGET = rigidAlign.$(MEXSUFFIX)
OBJS   = rigidAlign.o GeneralizedProcrustes.o

CFLAGS += -Wall -ansi -DMATLAB_MEXFILE

all: $(TARGET)

%.o: %.cpp
	$(CXX) $(CFLAGS) -I$(MATLAB_HOME)/extern/include  -o $@ -c $^

$(TARGET): $(OBJS)
	$(MEX) -cxx CXX=$(CXX) CC=$(CXX) LD=$(CXX) $(MATLAB_HOME)/bin/glnxa64/libmwlapack.so $(MATLAB_HOME)/bin/glnxa64/libmwblas.so \
        -O -output $@ $^

clean:
	rm -f *.o $(TARGET)
