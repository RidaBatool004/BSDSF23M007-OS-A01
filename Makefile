CC = gcc
AR = ar rcs
CFLAGS = -Wall -Iinclude

OBJDIR = obj
BINDIR = bin
LIBDIR = lib
MANDIR = man

LIB = $(LIBDIR)/libmyutils.a
TARGET = $(BINDIR)/client_static
CLIENT = $(BINDIR)/client

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

# -----------------------------
# Install target
# -----------------------------
PREFIX ?= /usr/local

install: all
	# Install the executable
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(CLIENT) $(DESTDIR)$(PREFIX)/bin/client

	# Install man1 page
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp $(MANDIR)/man1/client.1 $(DESTDIR)$(PREFIX)/share/man/man1/

	# Install man3 pages
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp $(MANDIR)/man3/*.3 $(DESTDIR)$(PREFIX)/share/man/man3/

	# Update man database
	mandb >/dev/null 2>&1 || true

# Uninstall target (optional)
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/client
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/client.1
	rm -f $(DESTDIR)$(PREFIX)/share/man/man3/my*.3

# Cleaning
clean:
	rm -f $(OBJDIR)/*.o $(TARGET) $(LIB)

.PHONY: all clean install uninstall

