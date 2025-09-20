include ../macros.mk

SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c,$(OBJ)/%.o,$(SRCS))

all: $(OBJS)

# Compile each .c into ../obj/*.o
$(OBJ)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o ../$(OBJ)/$(notdir $@)

clean:
	rm -f ../$(OBJ)/*.o

