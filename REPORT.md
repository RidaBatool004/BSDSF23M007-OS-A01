## Part 4: Man Pages and Installation
**Q: Why are man pages important in Linux projects?**

- Man pages provide clear, standard documentation for users, directly accessible from the terminal.  
- They make the program feel professional and user-friendly.  

**Q: What is the purpose of adding an `install` target in the Makefile?**

- It allows users to easily copy the executable and documentation into standard system directories (`/usr/local/bin` and `/usr/local/share/man`).  
- After installation, the program can be run from anywhere, and the man pages can be accessed using the `man` command.  

