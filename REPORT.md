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


