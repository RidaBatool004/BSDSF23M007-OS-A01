#include <stdio.h>
#include <stdlib.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char s1[100] = "Hello";
    char s2[100] = "World";

    printf("Length of s1: %d\n", mystrlen(s1));
    mystrcpy(s2, s1);
    printf("After strcpy, s2 = %s\n", s2);
    mystrcat(s1, " C");
    printf("After strcat, s1 = %s\n", s1);

    printf("\n--- Testing File Functions ---\n");
    FILE* f = fopen("test.txt", "r");
    if (f) {
        int lines, words, chars;
        if (wordCount(f, &lines, &words, &chars) == 0) {
            printf("Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);
        }

        char** matches;
        int count = mygrep(f, "test", &matches);
        printf("Found %d matching lines:\n", count);
        for (int i = 0; i < count; i++) {
            printf("%s", matches[i]);
            free(matches[i]);
        }
        free(matches);
        fclose(f);
    } else {
        printf("Could not open test.txt for testing file functions.\n");
    }

    return 0;
}

