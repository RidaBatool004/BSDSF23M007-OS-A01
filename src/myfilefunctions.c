#include "../include/myfilefunctions.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (!file) return -1;

    *lines = *words = *chars = 0;
    char c, prev = ' ';
    while ((c = fgetc(file)) != EOF) {
        (*chars)++;
        if (c == '\n') (*lines)++;
        if ((c == ' ' || c == '\n' || c == '\t') && !(prev == ' ' || prev == '\n' || prev == '\t')) {
            (*words)++;
        }
        prev = c;
    }
    if (prev != ' ' && prev != '\n' && prev != '\t') {
        (*words)++;
    }
    rewind(file);
    return 0;
}

int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (!fp || !search_str) return -1;

    size_t capacity = 10;
    size_t count = 0;
    *matches = malloc(capacity * sizeof(char*));

    char line[1024];
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, search_str)) {
            if (count >= capacity) {
                capacity *= 2;
                *matches = realloc(*matches, capacity * sizeof(char*));
            }
            (*matches)[count] = strdup(line);
            count++;
        }
    }
    rewind(fp);
    return (int)count;
}

