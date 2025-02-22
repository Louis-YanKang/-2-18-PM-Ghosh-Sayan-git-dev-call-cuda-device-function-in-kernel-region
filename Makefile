CXX = nvc++
CC = nvcc

CXXFLAGS = -mp=gpu -cuda 
#-DUSE_OMP_ACCELERATOR

OBJ = dummy.o util.o 
TARGET = tt5

all: $(TARGET)

%.o: %.cu
	$(CC) -dc -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $^

$(TARGET):  $(OBJ)
	$(CXX) -cuda $^ -o $@

clean:
	rm -rf *~ $(OBJ) $(TARGET)
