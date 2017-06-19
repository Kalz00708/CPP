AllDirs := $(shell ls -R | grep '^./src/.*:$$' | awk '{gsub(":","");print}')
OBJPATH := $(shell pwd)/obj
PREPATH := $(shell pwd)/pre
ASSPATH := $(shell pwd)/ass
# Sources := $(foreach n,$(AllDirs) , $(wildcard $(n)/*.cpp))

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

DontKnowWhyIfNeedFollowAnAssign :=
ifndef
	type := -S
	end := s
	path := $(ASSPATH)
else
	ifeq ($(type),-S)
		end := s
		path := $(ASSPATH)
	else
		ifeq ($(type),-E)
			end := i
			path := $(PREPATH)
		else
			type := -S
			end := s
			path := $(ASSPATH)
		endif
	endif
endif
export path end type

getPOA:
	for dir in $(AllDirs) ; do \
		$(MAKE) getPOA -C $$dir ; \
	done
	$(CXX) $(type) main.cpp -o $(path)/main.$(end)

.PHONY : clean  
clean:   
	rm -f $(wildcard obj/*.o) main $(wildcard pre/*.i) $(wildcard ass/*.s)
