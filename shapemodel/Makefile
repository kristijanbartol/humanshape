# Linux settings.
#MATLAB_HOME = /usr/lib/matlab-8.4/
MATLAB_HOME = /home/kristijan/MATLAB/R2019b/
MEX         = $(MATLAB_HOME)/bin/mex
MEXSUFFIX   = mexa64
#CXX         = g++-4.7
CXX         = g++
CFLAGS      = -O3 -fPIC -pthread 

TARGET = shapepose.$(MEXSUFFIX)
OBJS   = shapepose.o Show.o NMath.o \
         NRBM.o paramMap.o CTMesh-30DOF.o \

CFLAGS += -Wall -ansi -DMATLAB_MEXFILE

all: $(TARGET)

%.o: %.cpp
	$(CXX) $(CFLAGS) -I$(MATLAB_HOME)/extern/include -I./lib/nr/ -I./lib/include/ -o $@ -c $^

$(TARGET): $(OBJS)
	$(MEX) -cxx CXX=$(CXX) CC=$(CXX) LD=$(CXX) -lm \
        -O -output $@ $^

clean:
	rm -f *.o $(TARGET)

