## Part 1: Multi-File Build
**Q: Explain the linking rule in this part's Makefile: `$(TARGET): $(OBJECTS)`. How does it differ from a Makefile rule that links against a library?**

- The rule `$(TARGET): $(OBJECTS)` means the final program (target) depends on the object files. The linker combines these object files to create the executable.  
- When linking against a library, instead of including all the `.o` files directly, the linker just uses `-l` and `-L` flags to pull in functions from a precompiled library.  
- In short, linking with objects brings everything together directly, while linking with a library reuses compiled code in a cleaner way.

**Q: What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?**

- A **git tag** is like a label that marks an important point in history (e.g., a release version).  
- **Simple tag:** just a name pointing to a commit.  
- **Annotated tag:** contains extra information like author, date, and a message, so it is preferred for real releases.  

**Q: What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?**

- A GitHub release makes a project version official and easier for others to download and use.  
- Attaching binaries (like the executable and libraries) allows users to run the program without compiling from source.  


