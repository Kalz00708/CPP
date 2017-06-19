generate:
	$(CXX) $(CXXFLAGS) -c -o $(OBJPATH)/test.o test.cpp

Sources := $(wildcard *.cpp)
Aims := $(patsubst %.cpp, %, $(Sources))

getPOA:
	for file in $(Aims) ; do \
		$(CXX) $(type) $$file.cpp -o $(path)/$$file.$(end) ; \
	done
