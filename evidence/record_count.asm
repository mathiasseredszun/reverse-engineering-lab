build/record_count:     file format elf64-x86-64


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
    1020:	ff 35 7a 2f 00 00    	push   QWORD PTR [rip+0x2f7a]        # 3fa0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 7c 2f 00 00    	jmp    QWORD PTR [rip+0x2f7c]        # 3fa8 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    1060:	f3 0f 1e fa          	endbr64
    1064:	68 03 00 00 00       	push   0x3
    1069:	e9 b2 ff ff ff       	jmp    1020 <_init+0x20>
    106e:	66 90                	xchg   ax,ax
    1070:	f3 0f 1e fa          	endbr64
    1074:	68 04 00 00 00       	push   0x4
    1079:	e9 a2 ff ff ff       	jmp    1020 <_init+0x20>
    107e:	66 90                	xchg   ax,ax

Disassembly of section .plt.got:

0000000000001080 <__cxa_finalize@plt>:
    1080:	f3 0f 1e fa          	endbr64
    1084:	ff 25 6e 2f 00 00    	jmp    QWORD PTR [rip+0x2f6e]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    108a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001090 <__errno_location@plt>:
    1090:	f3 0f 1e fa          	endbr64
    1094:	ff 25 16 2f 00 00    	jmp    QWORD PTR [rip+0x2f16]        # 3fb0 <__errno_location@GLIBC_2.2.5>
    109a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000010a0 <__stack_chk_fail@plt>:
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	ff 25 0e 2f 00 00    	jmp    QWORD PTR [rip+0x2f0e]        # 3fb8 <__stack_chk_fail@GLIBC_2.4>
    10aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000010b0 <strtoull@plt>:
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	ff 25 06 2f 00 00    	jmp    QWORD PTR [rip+0x2f06]        # 3fc0 <strtoull@GLIBC_2.2.5>
    10ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000010c0 <__printf_chk@plt>:
    10c0:	f3 0f 1e fa          	endbr64
    10c4:	ff 25 fe 2e 00 00    	jmp    QWORD PTR [rip+0x2efe]        # 3fc8 <__printf_chk@GLIBC_2.3.4>
    10ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000010d0 <fwrite@plt>:
    10d0:	f3 0f 1e fa          	endbr64
    10d4:	ff 25 f6 2e 00 00    	jmp    QWORD PTR [rip+0x2ef6]        # 3fd0 <fwrite@GLIBC_2.2.5>
    10da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000010e0 <_start>:
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	31 ed                	xor    ebp,ebp
    10e6:	49 89 d1             	mov    r9,rdx
    10e9:	5e                   	pop    rsi
    10ea:	48 89 e2             	mov    rdx,rsp
    10ed:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    10f1:	50                   	push   rax
    10f2:	54                   	push   rsp
    10f3:	45 31 c0             	xor    r8d,r8d
    10f6:	31 c9                	xor    ecx,ecx
    10f8:	48 8d 3d e7 00 00 00 	lea    rdi,[rip+0xe7]        # 11e6 <main>
    10ff:	ff 15 d3 2e 00 00    	call   QWORD PTR [rip+0x2ed3]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1105:	f4                   	hlt
    1106:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    110d:	00 00 00

0000000000001110 <deregister_tm_clones>:
    1110:	48 8d 3d f9 2e 00 00 	lea    rdi,[rip+0x2ef9]        # 4010 <__TMC_END__>
    1117:	48 8d 05 f2 2e 00 00 	lea    rax,[rip+0x2ef2]        # 4010 <__TMC_END__>
    111e:	48 39 f8             	cmp    rax,rdi
    1121:	74 15                	je     1138 <deregister_tm_clones+0x28>
    1123:	48 8b 05 b6 2e 00 00 	mov    rax,QWORD PTR [rip+0x2eb6]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    112a:	48 85 c0             	test   rax,rax
    112d:	74 09                	je     1138 <deregister_tm_clones+0x28>
    112f:	ff e0                	jmp    rax
    1131:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1138:	c3                   	ret
    1139:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001140 <register_tm_clones>:
    1140:	48 8d 3d c9 2e 00 00 	lea    rdi,[rip+0x2ec9]        # 4010 <__TMC_END__>
    1147:	48 8d 35 c2 2e 00 00 	lea    rsi,[rip+0x2ec2]        # 4010 <__TMC_END__>
    114e:	48 29 fe             	sub    rsi,rdi
    1151:	48 89 f0             	mov    rax,rsi
    1154:	48 c1 ee 3f          	shr    rsi,0x3f
    1158:	48 c1 f8 03          	sar    rax,0x3
    115c:	48 01 c6             	add    rsi,rax
    115f:	48 d1 fe             	sar    rsi,1
    1162:	74 14                	je     1178 <register_tm_clones+0x38>
    1164:	48 8b 05 85 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e85]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    116b:	48 85 c0             	test   rax,rax
    116e:	74 08                	je     1178 <register_tm_clones+0x38>
    1170:	ff e0                	jmp    rax
    1172:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1178:	c3                   	ret
    1179:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001180 <__do_global_dtors_aux>:
    1180:	f3 0f 1e fa          	endbr64
    1184:	80 3d 9d 2e 00 00 00 	cmp    BYTE PTR [rip+0x2e9d],0x0        # 4028 <completed.0>
    118b:	75 2b                	jne    11b8 <__do_global_dtors_aux+0x38>
    118d:	55                   	push   rbp
    118e:	48 83 3d 62 2e 00 00 	cmp    QWORD PTR [rip+0x2e62],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1195:	00
    1196:	48 89 e5             	mov    rbp,rsp
    1199:	74 0c                	je     11a7 <__do_global_dtors_aux+0x27>
    119b:	48 8b 3d 66 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2e66]        # 4008 <__dso_handle>
    11a2:	e8 d9 fe ff ff       	call   1080 <__cxa_finalize@plt>
    11a7:	e8 64 ff ff ff       	call   1110 <deregister_tm_clones>
    11ac:	c6 05 75 2e 00 00 01 	mov    BYTE PTR [rip+0x2e75],0x1        # 4028 <completed.0>
    11b3:	5d                   	pop    rbp
    11b4:	c3                   	ret
    11b5:	0f 1f 00             	nop    DWORD PTR [rax]
    11b8:	c3                   	ret
    11b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000011c0 <frame_dummy>:
    11c0:	f3 0f 1e fa          	endbr64
    11c4:	e9 77 ff ff ff       	jmp    1140 <register_tm_clones>

00000000000011c9 <legacy_accept>:
    11c9:	f3 0f 1e fa          	endbr64
    11cd:	66 83 ff 40          	cmp    di,0x40
    11d1:	0f 96 c0             	setbe  al
    11d4:	0f b6 c0             	movzx  eax,al
    11d7:	c3                   	ret

00000000000011d8 <fixed_accept>:
    11d8:	f3 0f 1e fa          	endbr64
    11dc:	83 ff 40             	cmp    edi,0x40
    11df:	0f 96 c0             	setbe  al
    11e2:	0f b6 c0             	movzx  eax,al
    11e5:	c3                   	ret

00000000000011e6 <main>:
    11e6:	f3 0f 1e fa          	endbr64
    11ea:	41 54                	push   r12
    11ec:	55                   	push   rbp
    11ed:	53                   	push   rbx
    11ee:	48 83 ec 10          	sub    rsp,0x10
    11f2:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    11f9:	00 00
    11fb:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    1200:	31 c0                	xor    eax,eax
    1202:	83 ff 02             	cmp    edi,0x2
    1205:	0f 85 c3 00 00 00    	jne    12ce <main+0xe8>
    120b:	89 fb                	mov    ebx,edi
    120d:	48 89 f5             	mov    rbp,rsi
    1210:	48 8b 56 08          	mov    rdx,QWORD PTR [rsi+0x8]
    1214:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    1217:	84 c0                	test   al,al
    1219:	0f 84 af 00 00 00    	je     12ce <main+0xe8>
    121f:	83 e8 30             	sub    eax,0x30
    1222:	3c 09                	cmp    al,0x9
    1224:	0f 87 e1 00 00 00    	ja     130b <main+0x125>
    122a:	48 83 c2 01          	add    rdx,0x1
    122e:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    1231:	84 c0                	test   al,al
    1233:	75 ea                	jne    121f <main+0x39>
    1235:	e8 56 fe ff ff       	call   1090 <__errno_location@plt>
    123a:	49 89 c4             	mov    r12,rax
    123d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    1243:	48 89 e6             	mov    rsi,rsp
    1246:	48 8b 7d 08          	mov    rdi,QWORD PTR [rbp+0x8]
    124a:	ba 0a 00 00 00       	mov    edx,0xa
    124f:	e8 5c fe ff ff       	call   10b0 <strtoull@plt>
    1254:	41 8b 2c 24          	mov    ebp,DWORD PTR [r12]
    1258:	85 ed                	test   ebp,ebp
    125a:	0f 85 af 00 00 00    	jne    130f <main+0x129>
    1260:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]
    1264:	80 3a 00             	cmp    BYTE PTR [rdx],0x0
    1267:	0f 85 a6 00 00 00    	jne    1313 <main+0x12d>
    126d:	ba ff ff ff ff       	mov    edx,0xffffffff
    1272:	48 39 c2             	cmp    rdx,rax
    1275:	0f 82 98 00 00 00    	jb     1313 <main+0x12d>
    127b:	89 c3                	mov    ebx,eax
    127d:	89 c7                	mov    edi,eax
    127f:	e8 54 ff ff ff       	call   11d8 <fixed_accept>
    1284:	85 c0                	test   eax,eax
    1286:	4c 8d 25 7e 0d 00 00 	lea    r12,[rip+0xd7e]        # 200b <_IO_stdin_used+0xb>
    128d:	48 8d 05 70 0d 00 00 	lea    rax,[rip+0xd70]        # 2004 <_IO_stdin_used+0x4>
    1294:	4c 0f 45 e0          	cmovne r12,rax
    1298:	89 df                	mov    edi,ebx
    129a:	e8 2a ff ff ff       	call   11c9 <legacy_accept>
    129f:	85 c0                	test   eax,eax
    12a1:	48 8d 15 63 0d 00 00 	lea    rdx,[rip+0xd63]        # 200b <_IO_stdin_used+0xb>
    12a8:	48 8d 05 55 0d 00 00 	lea    rax,[rip+0xd55]        # 2004 <_IO_stdin_used+0x4>
    12af:	48 0f 45 d0          	cmovne rdx,rax
    12b3:	4c 89 e1             	mov    rcx,r12
    12b6:	48 8d 35 55 0d 00 00 	lea    rsi,[rip+0xd55]        # 2012 <_IO_stdin_used+0x12>
    12bd:	bf 02 00 00 00       	mov    edi,0x2
    12c2:	b8 00 00 00 00       	mov    eax,0x0
    12c7:	e8 f4 fd ff ff       	call   10c0 <__printf_chk@plt>
    12cc:	eb 22                	jmp    12f0 <main+0x10a>
    12ce:	48 8b 0d 4b 2d 00 00 	mov    rcx,QWORD PTR [rip+0x2d4b]        # 4020 <stderr@GLIBC_2.2.5>
    12d5:	ba 27 00 00 00       	mov    edx,0x27
    12da:	be 01 00 00 00       	mov    esi,0x1
    12df:	48 8d 3d 42 0d 00 00 	lea    rdi,[rip+0xd42]        # 2028 <_IO_stdin_used+0x28>
    12e6:	e8 e5 fd ff ff       	call   10d0 <fwrite@plt>
    12eb:	bd 02 00 00 00       	mov    ebp,0x2
    12f0:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    12f5:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    12fc:	00 00
    12fe:	75 17                	jne    1317 <main+0x131>
    1300:	89 e8                	mov    eax,ebp
    1302:	48 83 c4 10          	add    rsp,0x10
    1306:	5b                   	pop    rbx
    1307:	5d                   	pop    rbp
    1308:	41 5c                	pop    r12
    130a:	c3                   	ret
    130b:	89 dd                	mov    ebp,ebx
    130d:	eb e1                	jmp    12f0 <main+0x10a>
    130f:	89 dd                	mov    ebp,ebx
    1311:	eb dd                	jmp    12f0 <main+0x10a>
    1313:	89 dd                	mov    ebp,ebx
    1315:	eb d9                	jmp    12f0 <main+0x10a>
    1317:	e8 84 fd ff ff       	call   10a0 <__stack_chk_fail@plt>

Disassembly of section .fini:

000000000000131c <_fini>:
    131c:	f3 0f 1e fa          	endbr64
    1320:	48 83 ec 08          	sub    rsp,0x8
    1324:	48 83 c4 08          	add    rsp,0x8
    1328:	c3                   	ret
