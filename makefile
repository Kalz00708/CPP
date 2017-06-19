AllDirs := $(shell ls -R | grep '^./src/.*:$$' | awk '{gsub(":","");print}')
OBJPATH := $(shell pwd)/obj
PREPATH := $(shell pwd)/pre
# Sources := $(foreach n,$(AllDirs) , $(wildcard $(n)/*.cpp))
# Objs := $(patsubst %.cpp,%.o, $(Sources))
	  
CXX = g++-4.9
CXXFLAGS = -std=c++11 -Wall

export OBJPATH CXX CXXFLAGS

go: main
	./main

main: allObj
	$(CXX) $(wildcard obj/*.o) -o main

allObj:
	for dir in $(AllDirs) ; do \
		$(MAKE) -C $$dir ; \
	done
	$(CXX) $(CXXFLAGS) -c -o $(OBJPATH)/main.o main.cpp

export PREPATH

preprocessor:
	for dir in $(AllDirs) ; do \
		$(MAKE) preprocessor -C $$dir ; \
	done
	$(CXX) -E main.cpp -o $(PREPATH)/main.i

.PHONY : clean  
clean:   
	rm -f $(wildcard obj/*.o) main $(wildcard pre/*.i)
