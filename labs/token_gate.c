#include <stdio.h>
#include <string.h>

/* An educational encoding, never an authentication mechanism. */
__attribute__((noinline)) int check_token(const char *input) {
    static const unsigned char encoded[] = {0x16, 0x1b, 0x18, 0x77, 0x15, 0x14, 0x16, 0x03};
    if (strlen(input) != sizeof(encoded)) return 0;
    for (size_t i = 0; i < sizeof(encoded); ++i) {
        if (((unsigned char)input[i] ^ 0x5aU) != encoded[i]) return 0;
    }
    return 1;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fputs("usage: token_gate <synthetic-token>\n", stderr);
        return 2;
    }
    int accepted = check_token(argv[1]);
    puts(accepted ? "accepted" : "rejected");
    return accepted ? 0 : 1;
}
