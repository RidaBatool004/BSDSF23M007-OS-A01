CC = gcc
AR = ar rcs
CFLAGS = -Wall -Iinclude

OBJDIR = obj
BINDIR = bin
LIBDIR = lib

LIB = $(LIBDIR)/libmyutils.a
TARGET = $(BINDIR)/client_static

OBJS = $(OBJDIR)/main.o $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
LIBOBJS = $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o

# Default build
all: $(TARGET)

# Build the final executable (link main with static library)
$(TARGET): $(LIB) $(OBJDIR)/main.o
	$(CC) $(CFLAGS) $(OBJDIR)/main.o -L$(LIBDIR) -lmyutils -o $(TARGET)

# Build the static library
$(LIB): $(LIBOBJS)
	$(AR) $(LIB) $(LIBOBJS)

# Compile all .c files to .o
$(OBJDIR)/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Cleaning
clean:
	rm -f $(OBJDIR)/*.o $(TARGET) $(LIB)

.PHONY: all clean

