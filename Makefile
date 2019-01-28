########################################
## DO NOT EDIT ANYTHING BELOW THIS LINE!
SOURCE_FILES = $(wildcard *.cpp)
OBJECTS = $(SOURCE_FILES:.cpp=.o)

# name of the executable
TARGET = mysh

CXX    = g++
CFLAGS = -Wall -g -O3 -std=c++11

INCPATH += -I/usr/include
LIBPATH += -L/usr/lib
LIBS += -lsfml-graphics -lsfml-window -lsfml-system

# If the first argument is "debug"...
ifeq (debug,$(firstword $(MAKECMDGOALS)))
  CFLAGS += -ggdb3 -o0
endif

all: $(TARGET)

debug: $(TARGET)

clean:
	rm -f $(OBJECTS) $(TARGET)

.cpp.o:
	@echo "Compiling $@"
	$(CXX) $(CFLAGS) $(INCPATH) -c -o $@ $<

$(TARGET): $(OBJECTS)
	@echo "Linking $@"
	$(CXX) $(CFLAGS) -o $@ $^ $(LIBPATH) $(LIBS)

compile: $(OBJECTS)

run: $(TARGET)
	./$(TARGET)

