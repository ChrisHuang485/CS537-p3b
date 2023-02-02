
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 b3 04 00 00       	call   4c3 <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	53                   	push   %ebx
  1b:	e8 e0 02 00 00       	call   300 <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	push   0x8(%ebp)
  28:	e8 b6 04 00 00       	call   4e3 <write>
}
  2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	c9                   	leave  
  34:	c3                   	ret    
  35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <forktest>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
{
  46:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  49:	68 08 07 00 00       	push   $0x708
  4e:	e8 ad 02 00 00       	call   300 <strlen>
  53:	83 c4 0c             	add    $0xc,%esp
  56:	50                   	push   %eax
  57:	68 08 07 00 00       	push   $0x708
  5c:	6a 01                	push   $0x1
  5e:	e8 80 04 00 00       	call   4e3 <write>
  63:	83 c4 10             	add    $0x10,%esp
  66:	eb 19                	jmp    81 <forktest+0x41>
  68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6f:	90                   	nop
    if(pid == 0)
  70:	74 58                	je     ca <forktest+0x8a>
  for(n=0; n<N; n++){
  72:	83 c3 01             	add    $0x1,%ebx
  75:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  7b:	0f 84 83 00 00 00    	je     104 <forktest+0xc4>
    pid = fork();
  81:	e8 35 04 00 00       	call   4bb <fork>
    if(pid < 0)
  86:	85 c0                	test   %eax,%eax
  88:	79 e6                	jns    70 <forktest+0x30>
  for(; n > 0; n--){
  8a:	85 db                	test   %ebx,%ebx
  8c:	74 10                	je     9e <forktest+0x5e>
  8e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  90:	e8 36 04 00 00       	call   4cb <wait>
  95:	85 c0                	test   %eax,%eax
  97:	78 36                	js     cf <forktest+0x8f>
  for(; n > 0; n--){
  99:	83 eb 01             	sub    $0x1,%ebx
  9c:	75 f2                	jne    90 <forktest+0x50>
  if(wait() != -1){
  9e:	e8 28 04 00 00       	call   4cb <wait>
  a3:	83 f8 ff             	cmp    $0xffffffff,%eax
  a6:	75 49                	jne    f1 <forktest+0xb1>
  write(fd, s, strlen(s));
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	68 3a 07 00 00       	push   $0x73a
  b0:	e8 4b 02 00 00       	call   300 <strlen>
  b5:	83 c4 0c             	add    $0xc,%esp
  b8:	50                   	push   %eax
  b9:	68 3a 07 00 00       	push   $0x73a
  be:	6a 01                	push   $0x1
  c0:	e8 1e 04 00 00       	call   4e3 <write>
}
  c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c8:	c9                   	leave  
  c9:	c3                   	ret    
      exit();
  ca:	e8 f4 03 00 00       	call   4c3 <exit>
  write(fd, s, strlen(s));
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	68 13 07 00 00       	push   $0x713
  d7:	e8 24 02 00 00       	call   300 <strlen>
  dc:	83 c4 0c             	add    $0xc,%esp
  df:	50                   	push   %eax
  e0:	68 13 07 00 00       	push   $0x713
  e5:	6a 01                	push   $0x1
  e7:	e8 f7 03 00 00       	call   4e3 <write>
      exit();
  ec:	e8 d2 03 00 00       	call   4c3 <exit>
    printf(1, "wait got too many\n");
  f1:	52                   	push   %edx
  f2:	52                   	push   %edx
  f3:	68 27 07 00 00       	push   $0x727
  f8:	6a 01                	push   $0x1
  fa:	e8 11 ff ff ff       	call   10 <printf>
    exit();
  ff:	e8 bf 03 00 00       	call   4c3 <exit>
    printf(1, "fork claimed to work N times!\n", N);
 104:	50                   	push   %eax
 105:	68 e8 03 00 00       	push   $0x3e8
 10a:	68 48 07 00 00       	push   $0x748
 10f:	6a 01                	push   $0x1
 111:	e8 fa fe ff ff       	call   10 <printf>
    exit();
 116:	e8 a8 03 00 00       	call   4c3 <exit>
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <lock_init>:



void 
lock_init(lock_t *lock)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
  lock->locked = 0;
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 12c:	5d                   	pop    %ebp
 12d:	c3                   	ret    
 12e:	66 90                	xchg   %ax,%ax

00000130 <lock_acquire>:

void 
lock_acquire(lock_t *lock)
{
 130:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 131:	b9 01 00 00 00       	mov    $0x1,%ecx
 136:	89 e5                	mov    %esp,%ebp
 138:	8b 55 08             	mov    0x8(%ebp),%edx
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop
 140:	89 c8                	mov    %ecx,%eax
 142:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&(lock->locked), 1) != 0)
 145:	85 c0                	test   %eax,%eax
 147:	75 f7                	jne    140 <lock_acquire+0x10>
  ;
}
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret    
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <lock_release>:
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 15c:	5d                   	pop    %ebp
 15d:	c3                   	ret    
 15e:	66 90                	xchg   %ax,%ax

00000160 <thread_create>:
  lock->locked = 0;
}

int 
thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	83 ec 20             	sub    $0x20,%esp
  void * freeStack = malloc(2*PGSIZE);
 167:	68 00 20 00 00       	push   $0x2000
 16c:	e8 9f 04 00 00       	call   610 <malloc>
  if(freeStack == 0) return -1;
 171:	83 c4 10             	add    $0x10,%esp
 174:	85 c0                	test   %eax,%eax
 176:	74 7f                	je     1f7 <thread_create+0x97>

  void *stack = freeStack;
  if((uint)freeStack % PGSIZE != 0)
 178:	89 c2                	mov    %eax,%edx
 17a:	89 c3                	mov    %eax,%ebx
 17c:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 182:	75 4c                	jne    1d0 <thread_create+0x70>
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);

  int childPid = clone(start_routine, arg1, arg2, stack);
 184:	50                   	push   %eax
 185:	ff 75 10             	push   0x10(%ebp)
 188:	ff 75 0c             	push   0xc(%ebp)
 18b:	ff 75 08             	push   0x8(%ebp)
 18e:	e8 d0 03 00 00       	call   563 <clone>
  if(childPid != -1)
 193:	83 c4 10             	add    $0x10,%esp
 196:	83 f8 ff             	cmp    $0xffffffff,%eax
 199:	74 45                	je     1e0 <thread_create+0x80>
  {
    for(int i = 0; i < SIZE; i++)
 19b:	31 d2                	xor    %edx,%edx
 19d:	eb 09                	jmp    1a8 <thread_create+0x48>
 19f:	90                   	nop
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	83 fa 40             	cmp    $0x40,%edx
 1a6:	74 19                	je     1c1 <thread_create+0x61>
    {
      if(userStackAddr[i] == NULL)
 1a8:	8b 0c 95 a0 0b 00 00 	mov    0xba0(,%edx,4),%ecx
 1af:	85 c9                	test   %ecx,%ecx
 1b1:	75 ed                	jne    1a0 <thread_create+0x40>
      {
        userStackAddr[i] = freeStack;
 1b3:	89 1c 95 a0 0b 00 00 	mov    %ebx,0xba0(,%edx,4)
        valueArray[i] = childPid;
 1ba:	89 04 95 a0 0a 00 00 	mov    %eax,0xaa0(,%edx,4)
  {
    free(freeStack);
  }

  return childPid;
}
 1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);
 1d0:	29 d0                	sub    %edx,%eax
 1d2:	05 00 10 00 00       	add    $0x1000,%eax
 1d7:	eb ab                	jmp    184 <thread_create+0x24>
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    free(freeStack);
 1e0:	83 ec 0c             	sub    $0xc,%esp
 1e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 1e6:	53                   	push   %ebx
 1e7:	e8 94 03 00 00       	call   580 <free>
 1ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 1ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(freeStack);
 1f2:	83 c4 10             	add    $0x10,%esp
}
 1f5:	c9                   	leave  
 1f6:	c3                   	ret    
  if(freeStack == 0) return -1;
 1f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1fc:	eb c3                	jmp    1c1 <thread_create+0x61>
 1fe:	66 90                	xchg   %ax,%ax

00000200 <thread_join>:

int 
thread_join()
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  void *stack;
  int childPid = join(&stack);
 205:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 208:	83 ec 1c             	sub    $0x1c,%esp
  int childPid = join(&stack);
 20b:	50                   	push   %eax
 20c:	e8 5a 03 00 00       	call   56b <join>

  if(childPid != -1) {
 211:	83 c4 10             	add    $0x10,%esp
  int childPid = join(&stack);
 214:	89 c6                	mov    %eax,%esi
  if(childPid != -1) {
 216:	83 f8 ff             	cmp    $0xffffffff,%eax
 219:	74 46                	je     261 <thread_join+0x61>
    for(int i=0; i < SIZE; i++) {
 21b:	31 db                	xor    %ebx,%ebx
 21d:	eb 09                	jmp    228 <thread_join+0x28>
 21f:	90                   	nop
 220:	83 c3 01             	add    $0x1,%ebx
 223:	83 fb 40             	cmp    $0x40,%ebx
 226:	74 39                	je     261 <thread_join+0x61>
      if(valueArray[i] == childPid) {
 228:	39 34 9d a0 0a 00 00 	cmp    %esi,0xaa0(,%ebx,4)
 22f:	75 ef                	jne    220 <thread_join+0x20>
        free(userStackAddr[i]);
 231:	83 ec 0c             	sub    $0xc,%esp
 234:	ff 34 9d a0 0b 00 00 	push   0xba0(,%ebx,4)
 23b:	e8 40 03 00 00       	call   580 <free>
        valueArray[i] = -1;
        userStackAddr[i] = NULL;
 240:	83 c4 10             	add    $0x10,%esp
        valueArray[i] = -1;
 243:	c7 04 9d a0 0a 00 00 	movl   $0xffffffff,0xaa0(,%ebx,4)
 24a:	ff ff ff ff 
        userStackAddr[i] = NULL;
 24e:	c7 04 9d a0 0b 00 00 	movl   $0x0,0xba0(,%ebx,4)
 255:	00 00 00 00 
    for(int i=0; i < SIZE; i++) {
 259:	83 c3 01             	add    $0x1,%ebx
 25c:	83 fb 40             	cmp    $0x40,%ebx
 25f:	75 c7                	jne    228 <thread_join+0x28>
      }
    }
  }
  return childPid;
}
 261:	8d 65 f8             	lea    -0x8(%ebp),%esp
 264:	89 f0                	mov    %esi,%eax
 266:	5b                   	pop    %ebx
 267:	5e                   	pop    %esi
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 270:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 271:	31 c0                	xor    %eax,%eax
{
 273:	89 e5                	mov    %esp,%ebp
 275:	53                   	push   %ebx
 276:	8b 4d 08             	mov    0x8(%ebp),%ecx
 279:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 280:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 284:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 287:	83 c0 01             	add    $0x1,%eax
 28a:	84 d2                	test   %dl,%dl
 28c:	75 f2                	jne    280 <strcpy+0x10>
    ;
  return os;
}
 28e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 291:	89 c8                	mov    %ecx,%eax
 293:	c9                   	leave  
 294:	c3                   	ret    
 295:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
 2a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2aa:	0f b6 02             	movzbl (%edx),%eax
 2ad:	84 c0                	test   %al,%al
 2af:	75 17                	jne    2c8 <strcmp+0x28>
 2b1:	eb 3a                	jmp    2ed <strcmp+0x4d>
 2b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b7:	90                   	nop
 2b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 2bc:	83 c2 01             	add    $0x1,%edx
 2bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 2c2:	84 c0                	test   %al,%al
 2c4:	74 1a                	je     2e0 <strcmp+0x40>
    p++, q++;
 2c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 2c8:	0f b6 19             	movzbl (%ecx),%ebx
 2cb:	38 c3                	cmp    %al,%bl
 2cd:	74 e9                	je     2b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 2cf:	29 d8                	sub    %ebx,%eax
}
 2d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d4:	c9                   	leave  
 2d5:	c3                   	ret    
 2d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 2e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2e4:	31 c0                	xor    %eax,%eax
 2e6:	29 d8                	sub    %ebx,%eax
}
 2e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2eb:	c9                   	leave  
 2ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 2ed:	0f b6 19             	movzbl (%ecx),%ebx
 2f0:	31 c0                	xor    %eax,%eax
 2f2:	eb db                	jmp    2cf <strcmp+0x2f>
 2f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop

00000300 <strlen>:

uint
strlen(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 306:	80 3a 00             	cmpb   $0x0,(%edx)
 309:	74 15                	je     320 <strlen+0x20>
 30b:	31 c0                	xor    %eax,%eax
 30d:	8d 76 00             	lea    0x0(%esi),%esi
 310:	83 c0 01             	add    $0x1,%eax
 313:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 317:	89 c1                	mov    %eax,%ecx
 319:	75 f5                	jne    310 <strlen+0x10>
    ;
  return n;
}
 31b:	89 c8                	mov    %ecx,%eax
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    
 31f:	90                   	nop
  for(n = 0; s[n]; n++)
 320:	31 c9                	xor    %ecx,%ecx
}
 322:	5d                   	pop    %ebp
 323:	89 c8                	mov    %ecx,%eax
 325:	c3                   	ret    
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <memset>:

void*
memset(void *dst, int c, uint n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 337:	8b 4d 10             	mov    0x10(%ebp),%ecx
 33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 33d:	89 d7                	mov    %edx,%edi
 33f:	fc                   	cld    
 340:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 342:	8b 7d fc             	mov    -0x4(%ebp),%edi
 345:	89 d0                	mov    %edx,%eax
 347:	c9                   	leave  
 348:	c3                   	ret    
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <strchr>:

char*
strchr(const char *s, char c)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 35a:	0f b6 10             	movzbl (%eax),%edx
 35d:	84 d2                	test   %dl,%dl
 35f:	75 12                	jne    373 <strchr+0x23>
 361:	eb 1d                	jmp    380 <strchr+0x30>
 363:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 367:	90                   	nop
 368:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 36c:	83 c0 01             	add    $0x1,%eax
 36f:	84 d2                	test   %dl,%dl
 371:	74 0d                	je     380 <strchr+0x30>
    if(*s == c)
 373:	38 d1                	cmp    %dl,%cl
 375:	75 f1                	jne    368 <strchr+0x18>
      return (char*)s;
  return 0;
}
 377:	5d                   	pop    %ebp
 378:	c3                   	ret    
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 380:	31 c0                	xor    %eax,%eax
}
 382:	5d                   	pop    %ebp
 383:	c3                   	ret    
 384:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop

00000390 <gets>:

char*
gets(char *buf, int max)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 395:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 398:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 399:	31 db                	xor    %ebx,%ebx
{
 39b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 39e:	eb 27                	jmp    3c7 <gets+0x37>
    cc = read(0, &c, 1);
 3a0:	83 ec 04             	sub    $0x4,%esp
 3a3:	6a 01                	push   $0x1
 3a5:	57                   	push   %edi
 3a6:	6a 00                	push   $0x0
 3a8:	e8 2e 01 00 00       	call   4db <read>
    if(cc < 1)
 3ad:	83 c4 10             	add    $0x10,%esp
 3b0:	85 c0                	test   %eax,%eax
 3b2:	7e 1d                	jle    3d1 <gets+0x41>
      break;
    buf[i++] = c;
 3b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3b8:	8b 55 08             	mov    0x8(%ebp),%edx
 3bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 3bf:	3c 0a                	cmp    $0xa,%al
 3c1:	74 1d                	je     3e0 <gets+0x50>
 3c3:	3c 0d                	cmp    $0xd,%al
 3c5:	74 19                	je     3e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 3c7:	89 de                	mov    %ebx,%esi
 3c9:	83 c3 01             	add    $0x1,%ebx
 3cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3cf:	7c cf                	jl     3a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3d1:	8b 45 08             	mov    0x8(%ebp),%eax
 3d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5f                   	pop    %edi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    
  buf[i] = '\0';
 3e0:	8b 45 08             	mov    0x8(%ebp),%eax
 3e3:	89 de                	mov    %ebx,%esi
 3e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 3e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ec:	5b                   	pop    %ebx
 3ed:	5e                   	pop    %esi
 3ee:	5f                   	pop    %edi
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <stat>:

int
stat(const char *n, struct stat *st)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 405:	83 ec 08             	sub    $0x8,%esp
 408:	6a 00                	push   $0x0
 40a:	ff 75 08             	push   0x8(%ebp)
 40d:	e8 f1 00 00 00       	call   503 <open>
  if(fd < 0)
 412:	83 c4 10             	add    $0x10,%esp
 415:	85 c0                	test   %eax,%eax
 417:	78 27                	js     440 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 419:	83 ec 08             	sub    $0x8,%esp
 41c:	ff 75 0c             	push   0xc(%ebp)
 41f:	89 c3                	mov    %eax,%ebx
 421:	50                   	push   %eax
 422:	e8 f4 00 00 00       	call   51b <fstat>
  close(fd);
 427:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 42a:	89 c6                	mov    %eax,%esi
  close(fd);
 42c:	e8 ba 00 00 00       	call   4eb <close>
  return r;
 431:	83 c4 10             	add    $0x10,%esp
}
 434:	8d 65 f8             	lea    -0x8(%ebp),%esp
 437:	89 f0                	mov    %esi,%eax
 439:	5b                   	pop    %ebx
 43a:	5e                   	pop    %esi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 440:	be ff ff ff ff       	mov    $0xffffffff,%esi
 445:	eb ed                	jmp    434 <stat+0x34>
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax

00000450 <atoi>:

int
atoi(const char *s)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	53                   	push   %ebx
 454:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 457:	0f be 02             	movsbl (%edx),%eax
 45a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 45d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 460:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 465:	77 1e                	ja     485 <atoi+0x35>
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 470:	83 c2 01             	add    $0x1,%edx
 473:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 476:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 47a:	0f be 02             	movsbl (%edx),%eax
 47d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 480:	80 fb 09             	cmp    $0x9,%bl
 483:	76 eb                	jbe    470 <atoi+0x20>
  return n;
}
 485:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 488:	89 c8                	mov    %ecx,%eax
 48a:	c9                   	leave  
 48b:	c3                   	ret    
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000490 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 45 10             	mov    0x10(%ebp),%eax
 497:	8b 55 08             	mov    0x8(%ebp),%edx
 49a:	56                   	push   %esi
 49b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 49e:	85 c0                	test   %eax,%eax
 4a0:	7e 13                	jle    4b5 <memmove+0x25>
 4a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4a4:	89 d7                	mov    %edx,%edi
 4a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4b1:	39 f8                	cmp    %edi,%eax
 4b3:	75 fb                	jne    4b0 <memmove+0x20>
  return vdst;
}
 4b5:	5e                   	pop    %esi
 4b6:	89 d0                	mov    %edx,%eax
 4b8:	5f                   	pop    %edi
 4b9:	5d                   	pop    %ebp
 4ba:	c3                   	ret    

000004bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bb:	b8 01 00 00 00       	mov    $0x1,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <exit>:
SYSCALL(exit)
 4c3:	b8 02 00 00 00       	mov    $0x2,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <wait>:
SYSCALL(wait)
 4cb:	b8 03 00 00 00       	mov    $0x3,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <pipe>:
SYSCALL(pipe)
 4d3:	b8 04 00 00 00       	mov    $0x4,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <read>:
SYSCALL(read)
 4db:	b8 05 00 00 00       	mov    $0x5,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <write>:
SYSCALL(write)
 4e3:	b8 10 00 00 00       	mov    $0x10,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <close>:
SYSCALL(close)
 4eb:	b8 15 00 00 00       	mov    $0x15,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <kill>:
SYSCALL(kill)
 4f3:	b8 06 00 00 00       	mov    $0x6,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <exec>:
SYSCALL(exec)
 4fb:	b8 07 00 00 00       	mov    $0x7,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <open>:
SYSCALL(open)
 503:	b8 0f 00 00 00       	mov    $0xf,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <mknod>:
SYSCALL(mknod)
 50b:	b8 11 00 00 00       	mov    $0x11,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <unlink>:
SYSCALL(unlink)
 513:	b8 12 00 00 00       	mov    $0x12,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <fstat>:
SYSCALL(fstat)
 51b:	b8 08 00 00 00       	mov    $0x8,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <link>:
SYSCALL(link)
 523:	b8 13 00 00 00       	mov    $0x13,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mkdir>:
SYSCALL(mkdir)
 52b:	b8 14 00 00 00       	mov    $0x14,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <chdir>:
SYSCALL(chdir)
 533:	b8 09 00 00 00       	mov    $0x9,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <dup>:
SYSCALL(dup)
 53b:	b8 0a 00 00 00       	mov    $0xa,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <getpid>:
SYSCALL(getpid)
 543:	b8 0b 00 00 00       	mov    $0xb,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <sbrk>:
SYSCALL(sbrk)
 54b:	b8 0c 00 00 00       	mov    $0xc,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <sleep>:
SYSCALL(sleep)
 553:	b8 0d 00 00 00       	mov    $0xd,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <uptime>:
SYSCALL(uptime)
 55b:	b8 0e 00 00 00       	mov    $0xe,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <clone>:
SYSCALL(clone)
 563:	b8 16 00 00 00       	mov    $0x16,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <join>:
 56b:	b8 17 00 00 00       	mov    $0x17,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    
 573:	66 90                	xchg   %ax,%ax
 575:	66 90                	xchg   %ax,%ax
 577:	66 90                	xchg   %ax,%ax
 579:	66 90                	xchg   %ax,%ax
 57b:	66 90                	xchg   %ax,%ax
 57d:	66 90                	xchg   %ax,%ax
 57f:	90                   	nop

00000580 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 580:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 581:	a1 a0 0c 00 00       	mov    0xca0,%eax
{
 586:	89 e5                	mov    %esp,%ebp
 588:	57                   	push   %edi
 589:	56                   	push   %esi
 58a:	53                   	push   %ebx
 58b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 58e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	89 c2                	mov    %eax,%edx
 59a:	8b 00                	mov    (%eax),%eax
 59c:	39 ca                	cmp    %ecx,%edx
 59e:	73 30                	jae    5d0 <free+0x50>
 5a0:	39 c1                	cmp    %eax,%ecx
 5a2:	72 04                	jb     5a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5a4:	39 c2                	cmp    %eax,%edx
 5a6:	72 f0                	jb     598 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ae:	39 f8                	cmp    %edi,%eax
 5b0:	74 30                	je     5e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5b5:	8b 42 04             	mov    0x4(%edx),%eax
 5b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5bb:	39 f1                	cmp    %esi,%ecx
 5bd:	74 3a                	je     5f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5c1:	5b                   	pop    %ebx
  freep = p;
 5c2:	89 15 a0 0c 00 00    	mov    %edx,0xca0
}
 5c8:	5e                   	pop    %esi
 5c9:	5f                   	pop    %edi
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d0:	39 c2                	cmp    %eax,%edx
 5d2:	72 c4                	jb     598 <free+0x18>
 5d4:	39 c1                	cmp    %eax,%ecx
 5d6:	73 c0                	jae    598 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 5d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5de:	39 f8                	cmp    %edi,%eax
 5e0:	75 d0                	jne    5b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 5e2:	03 70 04             	add    0x4(%eax),%esi
 5e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5e8:	8b 02                	mov    (%edx),%eax
 5ea:	8b 00                	mov    (%eax),%eax
 5ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 5ef:	8b 42 04             	mov    0x4(%edx),%eax
 5f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5f5:	39 f1                	cmp    %esi,%ecx
 5f7:	75 c6                	jne    5bf <free+0x3f>
    p->s.size += bp->s.size;
 5f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 5fc:	89 15 a0 0c 00 00    	mov    %edx,0xca0
    p->s.size += bp->s.size;
 602:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 605:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 608:	89 0a                	mov    %ecx,(%edx)
}
 60a:	5b                   	pop    %ebx
 60b:	5e                   	pop    %esi
 60c:	5f                   	pop    %edi
 60d:	5d                   	pop    %ebp
 60e:	c3                   	ret    
 60f:	90                   	nop

00000610 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 619:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 61c:	8b 3d a0 0c 00 00    	mov    0xca0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 622:	8d 70 07             	lea    0x7(%eax),%esi
 625:	c1 ee 03             	shr    $0x3,%esi
 628:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 62b:	85 ff                	test   %edi,%edi
 62d:	0f 84 9d 00 00 00    	je     6d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 633:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 635:	8b 4a 04             	mov    0x4(%edx),%ecx
 638:	39 f1                	cmp    %esi,%ecx
 63a:	73 6a                	jae    6a6 <malloc+0x96>
 63c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 641:	39 de                	cmp    %ebx,%esi
 643:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 646:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 64d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 650:	eb 17                	jmp    669 <malloc+0x59>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 658:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 65a:	8b 48 04             	mov    0x4(%eax),%ecx
 65d:	39 f1                	cmp    %esi,%ecx
 65f:	73 4f                	jae    6b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 661:	8b 3d a0 0c 00 00    	mov    0xca0,%edi
 667:	89 c2                	mov    %eax,%edx
 669:	39 d7                	cmp    %edx,%edi
 66b:	75 eb                	jne    658 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 66d:	83 ec 0c             	sub    $0xc,%esp
 670:	ff 75 e4             	push   -0x1c(%ebp)
 673:	e8 d3 fe ff ff       	call   54b <sbrk>
  if(p == (char*)-1)
 678:	83 c4 10             	add    $0x10,%esp
 67b:	83 f8 ff             	cmp    $0xffffffff,%eax
 67e:	74 1c                	je     69c <malloc+0x8c>
  hp->s.size = nu;
 680:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	83 c0 08             	add    $0x8,%eax
 689:	50                   	push   %eax
 68a:	e8 f1 fe ff ff       	call   580 <free>
  return freep;
 68f:	8b 15 a0 0c 00 00    	mov    0xca0,%edx
      if((p = morecore(nunits)) == 0)
 695:	83 c4 10             	add    $0x10,%esp
 698:	85 d2                	test   %edx,%edx
 69a:	75 bc                	jne    658 <malloc+0x48>
        return 0;
  }
}
 69c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 69f:	31 c0                	xor    %eax,%eax
}
 6a1:	5b                   	pop    %ebx
 6a2:	5e                   	pop    %esi
 6a3:	5f                   	pop    %edi
 6a4:	5d                   	pop    %ebp
 6a5:	c3                   	ret    
    if(p->s.size >= nunits){
 6a6:	89 d0                	mov    %edx,%eax
 6a8:	89 fa                	mov    %edi,%edx
 6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6b0:	39 ce                	cmp    %ecx,%esi
 6b2:	74 4c                	je     700 <malloc+0xf0>
        p->s.size -= nunits;
 6b4:	29 f1                	sub    %esi,%ecx
 6b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6bf:	89 15 a0 0c 00 00    	mov    %edx,0xca0
}
 6c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6c8:	83 c0 08             	add    $0x8,%eax
}
 6cb:	5b                   	pop    %ebx
 6cc:	5e                   	pop    %esi
 6cd:	5f                   	pop    %edi
 6ce:	5d                   	pop    %ebp
 6cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 6d0:	c7 05 a0 0c 00 00 a4 	movl   $0xca4,0xca0
 6d7:	0c 00 00 
    base.s.size = 0;
 6da:	bf a4 0c 00 00       	mov    $0xca4,%edi
    base.s.ptr = freep = prevp = &base;
 6df:	c7 05 a4 0c 00 00 a4 	movl   $0xca4,0xca4
 6e6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 6eb:	c7 05 a8 0c 00 00 00 	movl   $0x0,0xca8
 6f2:	00 00 00 
    if(p->s.size >= nunits){
 6f5:	e9 42 ff ff ff       	jmp    63c <malloc+0x2c>
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 700:	8b 08                	mov    (%eax),%ecx
 702:	89 0a                	mov    %ecx,(%edx)
 704:	eb b9                	jmp    6bf <malloc+0xaf>
