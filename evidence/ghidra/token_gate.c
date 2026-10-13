// Ghidra 12.1.4

// check_token @ 00101189

int check_token(char *input)

{
  int iVar1;
  size_t sVar2;
  long lVar3;

  sVar2 = strlen(input);
  iVar1 = 0;
  if (sVar2 == 8) {
                    /* Unresolved local var: size_t i@[???] */
    lVar3 = 0;
    do {
      if ((byte)(input[lVar3] ^ 0x5aU) != "\x16\x1b\x18w\x15\x14\x16\x03"[lVar3]) {
        return 0;
      }
      lVar3 = lVar3 + 1;
    } while (lVar3 != 8);
    iVar1 = 1;
  }
  return iVar1;
}
