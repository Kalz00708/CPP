AllDirs := $(shell ls -R | grep '^./.*:$$' | awk '{gsub(":","");print}')
OBJPATH := $(shell pwd)/obj
# Sources := $(foreach n,$(AllDirs) , $(wildcard $(n)/*.cpp))
# Objs := $(patsubst %.cpp,%.o, $(Sources))
	  
CXX = g++
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

$(AllDirs):
	@echo get here
	@echo $@
	$(MAKE) -C $@

print:
	@echo $(AllDirs)

.PHONY : clean  
clean:   
	rm -f $(wildcard obj/*.o) main
