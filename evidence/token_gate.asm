build/token_gate:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 8a 2f 00 00    	push   QWORD PTR [rip+0x2f8a]        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 8c 2f 00 00    	jmp    QWORD PTR [rip+0x2f8c]        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1030:	f3 0f 1e fa          	endbr64
    1034:	68 00 00 00 00       	push   0x0
    1039:	e9 e2 ff ff ff       	jmp    1020 <_init+0x20>
    103e:	66 90                	xchg   ax,ax
    1040:	f3 0f 1e fa          	endbr64
    1044:	68 01 00 00 00       	push   0x1
    1049:	e9 d2 ff ff ff       	jmp    1020 <_init+0x20>
    104e:	66 90                	xchg   ax,ax
    1050:	f3 0f 1e fa          	endbr64
    1054:	68 02 00 00 00       	push   0x2
    1059:	e9 c2 ff ff ff       	jmp    1020 <_init+0x20>
    105e:	66 90                	xchg   ax,ax

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64
    1064:	ff 25 8e 2f 00 00    	jmp    QWORD PTR [rip+0x2f8e]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    106a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001070 <puts@plt>:
    1070:	f3 0f 1e fa          	endbr64
    1074:	ff 25 46 2f 00 00    	jmp    QWORD PTR [rip+0x2f46]        # 3fc0 <puts@GLIBC_2.2.5>
    107a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001080 <strlen@plt>:
    1080:	f3 0f 1e fa          	endbr64
    1084:	ff 25 3e 2f 00 00    	jmp    QWORD PTR [rip+0x2f3e]        # 3fc8 <strlen@GLIBC_2.2.5>
    108a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001090 <fwrite@plt>:
    1090:	f3 0f 1e fa          	endbr64
    1094:	ff 25 36 2f 00 00    	jmp    QWORD PTR [rip+0x2f36]        # 3fd0 <fwrite@GLIBC_2.2.5>
    109a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000010a0 <_start>:
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	31 ed                	xor    ebp,ebp
    10a6:	49 89 d1             	mov    r9,rdx
    10a9:	5e                   	pop    rsi
    10aa:	48 89 e2             	mov    rdx,rsp
    10ad:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    10b1:	50                   	push   rax
    10b2:	54                   	push   rsp
    10b3:	45 31 c0             	xor    r8d,r8d
    10b6:	31 c9                	xor    ecx,ecx
    10b8:	48 8d 3d 15 01 00 00 	lea    rdi,[rip+0x115]        # 11d4 <main>
    10bf:	ff 15 13 2f 00 00    	call   QWORD PTR [rip+0x2f13]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10c5:	f4                   	hlt
    10c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    10cd:	00 00 00

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 39 2f 00 00 	lea    rdi,[rip+0x2f39]        # 4010 <__TMC_END__>
    10d7:	48 8d 05 32 2f 00 00 	lea    rax,[rip+0x2f32]        # 4010 <__TMC_END__>
    10de:	48 39 f8             	cmp    rax,rdi
    10e1:	74 15                	je     10f8 <deregister_tm_clones+0x28>
    10e3:	48 8b 05 f6 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ef6]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ea:	48 85 c0             	test   rax,rax
    10ed:	74 09                	je     10f8 <deregister_tm_clones+0x28>
    10ef:	ff e0                	jmp    rax
    10f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10f8:	c3                   	ret
    10f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001100 <register_tm_clones>:
    1100:	48 8d 3d 09 2f 00 00 	lea    rdi,[rip+0x2f09]        # 4010 <__TMC_END__>
    1107:	48 8d 35 02 2f 00 00 	lea    rsi,[rip+0x2f02]        # 4010 <__TMC_END__>
    110e:	48 29 fe             	sub    rsi,rdi
    1111:	48 89 f0             	mov    rax,rsi
    1114:	48 c1 ee 3f          	shr    rsi,0x3f
    1118:	48 c1 f8 03          	sar    rax,0x3
    111c:	48 01 c6             	add    rsi,rax
    111f:	48 d1 fe             	sar    rsi,1
    1122:	74 14                	je     1138 <register_tm_clones+0x38>
    1124:	48 8b 05 c5 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ec5]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    112b:	48 85 c0             	test   rax,rax
    112e:	74 08                	je     1138 <register_tm_clones+0x38>
    1130:	ff e0                	jmp    rax
    1132:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1138:	c3                   	ret
    1139:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001140 <__do_global_dtors_aux>:
    1140:	f3 0f 1e fa          	endbr64
    1144:	80 3d dd 2e 00 00 00 	cmp    BYTE PTR [rip+0x2edd],0x0        # 4028 <completed.0>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   rbp
    114e:	48 83 3d a2 2e 00 00 	cmp    QWORD PTR [rip+0x2ea2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1155:	00
    1156:	48 89 e5             	mov    rbp,rsp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ea6]        # 4008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	call   10d0 <deregister_tm_clones>
    116c:	c6 05 b5 2e 00 00 01 	mov    BYTE PTR [rip+0x2eb5],0x1        # 4028 <completed.0>
    1173:	5d                   	pop    rbp
    1174:	c3                   	ret
    1175:	0f 1f 00             	nop    DWORD PTR [rax]
    1178:	c3                   	ret
    1179:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001180 <frame_dummy>:
    1180:	f3 0f 1e fa          	endbr64
    1184:	e9 77 ff ff ff       	jmp    1100 <register_tm_clones>

0000000000001189 <check_token>:
    1189:	f3 0f 1e fa          	endbr64
    118d:	53                   	push   rbx
    118e:	48 89 fb             	mov    rbx,rdi
    1191:	e8 ea fe ff ff       	call   1080 <strlen@plt>
    1196:	48 89 c2             	mov    rdx,rax
    1199:	b8 00 00 00 00       	mov    eax,0x0
    119e:	48 83 fa 08          	cmp    rdx,0x8
    11a2:	75 27                	jne    11cb <check_token+0x42>
    11a4:	b8 00 00 00 00       	mov    eax,0x0
    11a9:	48 8d 0d 90 0e 00 00 	lea    rcx,[rip+0xe90]        # 2040 <encoded.0>
    11b0:	0f b6 14 03          	movzx  edx,BYTE PTR [rbx+rax*1]
    11b4:	83 f2 5a             	xor    edx,0x5a
    11b7:	3a 14 01             	cmp    dl,BYTE PTR [rcx+rax*1]
    11ba:	75 11                	jne    11cd <check_token+0x44>
    11bc:	48 83 c0 01          	add    rax,0x1
    11c0:	48 83 f8 08          	cmp    rax,0x8
    11c4:	75 ea                	jne    11b0 <check_token+0x27>
    11c6:	b8 01 00 00 00       	mov    eax,0x1
    11cb:	5b                   	pop    rbx
    11cc:	c3                   	ret
    11cd:	b8 00 00 00 00       	mov    eax,0x0
    11d2:	eb f7                	jmp    11cb <check_token+0x42>

00000000000011d4 <main>:
    11d4:	f3 0f 1e fa          	endbr64
    11d8:	53                   	push   rbx
    11d9:	83 ff 02             	cmp    edi,0x2
    11dc:	75 2e                	jne    120c <main+0x38>
    11de:	48 8b 7e 08          	mov    rdi,QWORD PTR [rsi+0x8]
    11e2:	e8 a2 ff ff ff       	call   1189 <check_token>
    11e7:	89 c3                	mov    ebx,eax
    11e9:	85 c0                	test   eax,eax
    11eb:	48 8d 3d 1b 0e 00 00 	lea    rdi,[rip+0xe1b]        # 200d <_IO_stdin_used+0xd>
    11f2:	48 8d 05 0b 0e 00 00 	lea    rax,[rip+0xe0b]        # 2004 <_IO_stdin_used+0x4>
    11f9:	48 0f 45 f8          	cmovne rdi,rax
    11fd:	e8 6e fe ff ff       	call   1070 <puts@plt>
    1202:	85 db                	test   ebx,ebx
    1204:	0f 94 c0             	sete   al
    1207:	0f b6 c0             	movzx  eax,al
    120a:	5b                   	pop    rbx
    120b:	c3                   	ret
    120c:	48 8b 0d 0d 2e 00 00 	mov    rcx,QWORD PTR [rip+0x2e0d]        # 4020 <stderr@GLIBC_2.2.5>
    1213:	ba 24 00 00 00       	mov    edx,0x24
    1218:	be 01 00 00 00       	mov    esi,0x1
    121d:	48 8d 3d f4 0d 00 00 	lea    rdi,[rip+0xdf4]        # 2018 <_IO_stdin_used+0x18>
    1224:	e8 67 fe ff ff       	call   1090 <fwrite@plt>
    1229:	b8 02 00 00 00       	mov    eax,0x2
    122e:	eb da                	jmp    120a <main+0x36>

Disassembly of section .fini:

0000000000001230 <_fini>:
    1230:	f3 0f 1e fa          	endbr64
    1234:	48 83 ec 08          	sub    rsp,0x8
    1238:	48 83 c4 08          	add    rsp,0x8
    123c:	c3                   	ret
