# REPORT.md

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

---

## Part 2: Static Library Build
**Q: Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?**

- In Part 2, variables and rules included the `ar` command to create `libmyutils.a`.  
- In Part 3, rules were extended to also build a shared library (`.so`) using `-fPIC` and `-shared`.  
- The main difference is that static linking bundles the code inside the executable, while dynamic linking keeps it separate.  

**Q: What is the purpose of the `ar` command? Why is `ranlib` often used immediately after it?**

- `ar` combines object files into a single archive file (`.a`), which is the static library.  
- `ranlib` updates the index inside the archive to make it easier for the linker to quickly find symbols.  

**Q: When you run `nm` on your `client_static` executable, are the symbols for functions like `mystrlen` present? What does this tell you about how static linking works?**

- Yes, the symbols are present in the static executable.  
- This shows that static linking copies the library code directly into the executable, so all the functions are embedded inside.  

---

## Part 3: Dynamic Library Build
**Q: What is Position-Independent Code (-fPIC) and why is it a fundamental requirement for creating shared libraries?**

- `-fPIC` creates code that can run correctly no matter where in memory it is loaded.  
- It is required for shared libraries because the OS may load them at different memory addresses for different programs.  

**Q: Explain the difference in file size between your static and dynamic clients. Why does this difference exist?**

- **Static client** is larger because it contains a copy of all library code inside the executable.  
- **Dynamic client** is smaller because it only stores references to the shared library, which is loaded separately at runtime.  

**Q: What is the LD_LIBRARY_PATH environment variable? Why was it necessary to set it for your program to run, and what does this tell you about the responsibilities of the operating system's dynamic loader?**

- `LD_LIBRARY_PATH` tells the OS where to look for shared libraries.  
- It was needed so the program could find `libmyutils.so` inside the `lib/` folder.  
- This shows that the OS dynamic loader is responsible for locating and loading shared libraries when a program starts.  

---

## Part 4: Man Pages and Installation
**Q: Why are man pages important in Linux projects?**

- Man pages provide clear, standard documentation for users, directly accessible from the terminal.  
- They make the program feel professional and user-friendly.  

**Q: What is the purpose of adding an `install` target in the Makefile?**

- It allows users to easily copy the executable and documentation into standard system directories (`/usr/local/bin` and `/usr/local/share/man`).  
- After installation, the program can be run from anywhere, and the man pages can be accessed using the `man` command.  

---

# Final Notes
Through this assignment, I learned how to:
1. Build projects with multiple files using Makefiles.  
2. Create and use both static and dynamic libraries.  
3. Understand the difference between static and dynamic linking.  
4. Write and install man pages to make software professional.  
5. Use git branching, tagging, and GitHub releases to manage a software project.  

