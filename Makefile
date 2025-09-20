include macros.mk

.PHONY: all clean run install uninstall

all: $(TARGET)

# Link final executable from object files
$(TARGET):
	$(MAKE) -C $(SRC)
	$(CC) $(OBJ)/*.o -o $(TARGET)

run: all
	./$(TARGET)

clean:
	$(MAKE) -C $(SRC) clean
	rm -f $(TARGET)

# ====== New Targets ======
install: all
	@echo "Installing $(TARGET) to /usr/local/bin ..."
	cp $(TARGET) /usr/local/bin/

uninstall:
	@echo "Uninstalling $(TARGET) from /usr/local/bin ..."
	rm -f /usr/local/bin/client

