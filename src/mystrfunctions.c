#include "../include/mystrfunctions.h"

int mystrlen(const char* s) {
    int len = 0;
    while (s && s[len] != '\0') len++;
    return len;
}

int mystrcpy(char* dest, const char* src) {
    if (!dest || !src) return -1;
    int i = 0;
    while (src[i] != '\0') {
        dest[i] = src[i];
        i++;
    }
    dest[i] = '\0';
    return 0;
}

int mystrncpy(char* dest, const char* src, int n) {
    if (!dest || !src) return -1;
    int i = 0;
    while (i < n && src[i] != '\0') {
        dest[i] = src[i];
        i++;
    }
    while (i < n) {
        dest[i] = '\0';
        i++;
    }
    return 0;
}

int mystrcat(char* dest, const char* src) {
    if (!dest || !src) return -1;
    int dlen = mystrlen(dest);
    int i = 0;
    while (src[i] != '\0') {
        dest[dlen + i] = src[i];
        i++;
    }
    dest[dlen + i] = '\0';
    return 0;
}

