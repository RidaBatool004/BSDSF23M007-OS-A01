CC = gcc
AR = ar rcs
CFLAGS = -Wall -Iinclude -fPIC

OBJDIR = obj
BINDIR = bin
LIBDIR = lib

LIB_STATIC = $(LIBDIR)/libmyutils.a
LIB_DYNAMIC = $(LIBDIR)/libmyutils.so
TARGET_STATIC = $(BINDIR)/client_static
TARGET_DYNAMIC = $(BINDIR)/client_dynamic
TARGET = $(BINDIR)/client

OBJS = $(OBJDIR)/main.o $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
LIBOBJS = $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o

# Default build
all: $(TARGET_STATIC) $(TARGET_DYNAMIC)

# Build executables
$(TARGET_STATIC): $(LIB_STATIC) $(OBJDIR)/main.o
	$(CC) $(CFLAGS) $(OBJDIR)/main.o -L$(LIBDIR) -lmyutils -o $(TARGET_STATIC)

$(TARGET_DYNAMIC): $(LIB_DYNAMIC) $(OBJDIR)/main.o
	$(CC) $(CFLAGS) $(OBJDIR)/main.o -L$(LIBDIR) -lmyutils -o $(TARGET_DYNAMIC)

# Static library
$(LIB_STATIC): $(LIBOBJS)
	$(AR) $(LIB_STATIC) $(LIBOBJS)

# Shared library
$(LIB_DYNAMIC): $(LIBOBJS)
	$(CC) -shared -o $(LIB_DYNAMIC) $(LIBOBJS)

# Compile
$(OBJDIR)/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Install
install: all
	@echo "# Install the executable"
	mkdir -p /usr/local/bin
	cp $(TARGET_STATIC) /usr/local/bin/client

	@echo "# Install man1 page"
	mkdir -p /usr/local/share/man/man1
	cp man/man1/client.1 /usr/local/share/man/man1/

	@echo "# Install man3 pages"
	mkdir -p /usr/local/share/man/man3
	cp man/man3/*.3 /usr/local/share/man/man3/

	@echo "# Update man database"
	mandb >/dev/null 2>&1 || true

# Uninstall
uninstall:
	rm -f /usr/local/bin/client
	rm -f /usr/local/share/man/man1/client.1
	rm -f /usr/local/share/man/man3/*.3

# Clean
clean:
	rm -f $(OBJDIR)/*.o $(TARGET_STATIC) $(TARGET_DYNAMIC) $(LIB_STATIC) $(LIB_DYNAMIC)

.PHONY: all clean install uninstall

