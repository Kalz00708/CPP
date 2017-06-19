# Makefile

The make file here can recursively call the makefile in subdirectory and all object file should be put in ./obj. After this, it will link these file to be an exe file.

You can run `makefile getPOA` or `makefile getPOA type=-S` to get assambly code

You can run `makefile getPOA type=-E` to get the code after preprocessor