// Ghidra 12.1.4

// legacy_accept @ 001011c9

int legacy_accept(uint32_t count)

{
  return (int)((ushort)count < 0x41);
}


// fixed_accept @ 001011d8

int fixed_accept(uint32_t count)

{
  return (int)(count < 0x41);
}
