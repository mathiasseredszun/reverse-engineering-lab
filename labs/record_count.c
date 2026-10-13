#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* Logical defect only: no allocation, indexing or memory corruption. */
__attribute__((noinline)) int legacy_accept(uint32_t count) {
    return (uint16_t)count <= 64U;
}

__attribute__((noinline)) int fixed_accept(uint32_t count) {
    return count <= 64U;
}

int main(int argc, char **argv) {
    if (argc != 2 || argv[1][0] == '\0') {
        fputs("usage: record_count <unsigned-decimal>\n", stderr);
        return 2;
    }
    for (const char *p = argv[1]; *p; ++p) {
        if (*p < '0' || *p > '9') return 2;
    }
    errno = 0;
    char *end;
    unsigned long long parsed = strtoull(argv[1], &end, 10);
    if (errno != 0 || *end != '\0' || parsed > UINT32_MAX) return 2;
    uint32_t count = (uint32_t)parsed;
    printf("legacy=%s fixed=%s\n", legacy_accept(count) ? "accept" : "reject",
           fixed_accept(count) ? "accept" : "reject");
    return 0;
}
