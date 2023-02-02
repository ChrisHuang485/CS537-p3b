
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 28 09 00 00       	push   $0x928
  19:	e8 b5 04 00 00       	call   4d3 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 d8 04 00 00       	call   50b <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 cc 04 00 00       	call   50b <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 30 09 00 00       	push   $0x930
  50:	6a 01                	push   $0x1
  52:	e8 a9 05 00 00       	call   600 <printf>
    pid = fork();
  57:	e8 2f 04 00 00       	call   48b <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 26 04 00 00       	call   49b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 6f 09 00 00       	push   $0x96f
  85:	6a 01                	push   $0x1
  87:	e8 74 05 00 00       	call   600 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 43 09 00 00       	push   $0x943
  98:	6a 01                	push   $0x1
  9a:	e8 61 05 00 00       	call   600 <printf>
      exit();
  9f:	e8 ef 03 00 00       	call   493 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 3c 0d 00 00       	push   $0xd3c
  ab:	68 56 09 00 00       	push   $0x956
  b0:	e8 16 04 00 00       	call   4cb <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 59 09 00 00       	push   $0x959
  bc:	6a 01                	push   $0x1
  be:	e8 3d 05 00 00       	call   600 <printf>
      exit();
  c3:	e8 cb 03 00 00       	call   493 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 28 09 00 00       	push   $0x928
  d2:	e8 04 04 00 00       	call   4db <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 28 09 00 00       	push   $0x928
  e0:	e8 ee 03 00 00       	call   4d3 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <lock_init>:



void 
lock_init(lock_t *lock)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  lock->locked = 0;
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  fc:	5d                   	pop    %ebp
  fd:	c3                   	ret    
  fe:	66 90                	xchg   %ax,%ax

00000100 <lock_acquire>:

void 
lock_acquire(lock_t *lock)
{
 100:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 101:	b9 01 00 00 00       	mov    $0x1,%ecx
 106:	89 e5                	mov    %esp,%ebp
 108:	8b 55 08             	mov    0x8(%ebp),%edx
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop
 110:	89 c8                	mov    %ecx,%eax
 112:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&(lock->locked), 1) != 0)
 115:	85 c0                	test   %eax,%eax
 117:	75 f7                	jne    110 <lock_acquire+0x10>
  ;
}
 119:	5d                   	pop    %ebp
 11a:	c3                   	ret    
 11b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop

00000120 <lock_release>:
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 12c:	5d                   	pop    %ebp
 12d:	c3                   	ret    
 12e:	66 90                	xchg   %ax,%ax

00000130 <thread_create>:
  lock->locked = 0;
}

int 
thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	83 ec 20             	sub    $0x20,%esp
  void * freeStack = malloc(2*PGSIZE);
 137:	68 00 20 00 00       	push   $0x2000
 13c:	e8 ef 06 00 00       	call   830 <malloc>
  if(freeStack == 0) return -1;
 141:	83 c4 10             	add    $0x10,%esp
 144:	85 c0                	test   %eax,%eax
 146:	74 7f                	je     1c7 <thread_create+0x97>

  void *stack = freeStack;
  if((uint)freeStack % PGSIZE != 0)
 148:	89 c2                	mov    %eax,%edx
 14a:	89 c3                	mov    %eax,%ebx
 14c:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 152:	75 4c                	jne    1a0 <thread_create+0x70>
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);

  int childPid = clone(start_routine, arg1, arg2, stack);
 154:	50                   	push   %eax
 155:	ff 75 10             	push   0x10(%ebp)
 158:	ff 75 0c             	push   0xc(%ebp)
 15b:	ff 75 08             	push   0x8(%ebp)
 15e:	e8 d0 03 00 00       	call   533 <clone>
  if(childPid != -1)
 163:	83 c4 10             	add    $0x10,%esp
 166:	83 f8 ff             	cmp    $0xffffffff,%eax
 169:	74 45                	je     1b0 <thread_create+0x80>
  {
    for(int i = 0; i < SIZE; i++)
 16b:	31 d2                	xor    %edx,%edx
 16d:	eb 09                	jmp    178 <thread_create+0x48>
 16f:	90                   	nop
 170:	83 c2 01             	add    $0x1,%edx
 173:	83 fa 40             	cmp    $0x40,%edx
 176:	74 19                	je     191 <thread_create+0x61>
    {
      if(userStackAddr[i] == NULL)
 178:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 17f:	85 c9                	test   %ecx,%ecx
 181:	75 ed                	jne    170 <thread_create+0x40>
      {
        userStackAddr[i] = freeStack;
 183:	89 1c 95 60 0e 00 00 	mov    %ebx,0xe60(,%edx,4)
        valueArray[i] = childPid;
 18a:	89 04 95 60 0d 00 00 	mov    %eax,0xd60(,%edx,4)
  {
    free(freeStack);
  }

  return childPid;
}
 191:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 194:	c9                   	leave  
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);
 1a0:	29 d0                	sub    %edx,%eax
 1a2:	05 00 10 00 00       	add    $0x1000,%eax
 1a7:	eb ab                	jmp    154 <thread_create+0x24>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    free(freeStack);
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 1b6:	53                   	push   %ebx
 1b7:	e8 e4 05 00 00       	call   7a0 <free>
 1bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 1bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(freeStack);
 1c2:	83 c4 10             	add    $0x10,%esp
}
 1c5:	c9                   	leave  
 1c6:	c3                   	ret    
  if(freeStack == 0) return -1;
 1c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1cc:	eb c3                	jmp    191 <thread_create+0x61>
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <thread_join>:

int 
thread_join()
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
  void *stack;
  int childPid = join(&stack);
 1d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 1d8:	83 ec 1c             	sub    $0x1c,%esp
  int childPid = join(&stack);
 1db:	50                   	push   %eax
 1dc:	e8 5a 03 00 00       	call   53b <join>

  if(childPid != -1) {
 1e1:	83 c4 10             	add    $0x10,%esp
  int childPid = join(&stack);
 1e4:	89 c6                	mov    %eax,%esi
  if(childPid != -1) {
 1e6:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e9:	74 46                	je     231 <thread_join+0x61>
    for(int i=0; i < SIZE; i++) {
 1eb:	31 db                	xor    %ebx,%ebx
 1ed:	eb 09                	jmp    1f8 <thread_join+0x28>
 1ef:	90                   	nop
 1f0:	83 c3 01             	add    $0x1,%ebx
 1f3:	83 fb 40             	cmp    $0x40,%ebx
 1f6:	74 39                	je     231 <thread_join+0x61>
      if(valueArray[i] == childPid) {
 1f8:	39 34 9d 60 0d 00 00 	cmp    %esi,0xd60(,%ebx,4)
 1ff:	75 ef                	jne    1f0 <thread_join+0x20>
        free(userStackAddr[i]);
 201:	83 ec 0c             	sub    $0xc,%esp
 204:	ff 34 9d 60 0e 00 00 	push   0xe60(,%ebx,4)
 20b:	e8 90 05 00 00       	call   7a0 <free>
        valueArray[i] = -1;
        userStackAddr[i] = NULL;
 210:	83 c4 10             	add    $0x10,%esp
        valueArray[i] = -1;
 213:	c7 04 9d 60 0d 00 00 	movl   $0xffffffff,0xd60(,%ebx,4)
 21a:	ff ff ff ff 
        userStackAddr[i] = NULL;
 21e:	c7 04 9d 60 0e 00 00 	movl   $0x0,0xe60(,%ebx,4)
 225:	00 00 00 00 
    for(int i=0; i < SIZE; i++) {
 229:	83 c3 01             	add    $0x1,%ebx
 22c:	83 fb 40             	cmp    $0x40,%ebx
 22f:	75 c7                	jne    1f8 <thread_join+0x28>
      }
    }
  }
  return childPid;
}
 231:	8d 65 f8             	lea    -0x8(%ebp),%esp
 234:	89 f0                	mov    %esi,%eax
 236:	5b                   	pop    %ebx
 237:	5e                   	pop    %esi
 238:	5d                   	pop    %ebp
 239:	c3                   	ret    
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000240 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 240:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 241:	31 c0                	xor    %eax,%eax
{
 243:	89 e5                	mov    %esp,%ebp
 245:	53                   	push   %ebx
 246:	8b 4d 08             	mov    0x8(%ebp),%ecx
 249:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 250:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 254:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 257:	83 c0 01             	add    $0x1,%eax
 25a:	84 d2                	test   %dl,%dl
 25c:	75 f2                	jne    250 <strcpy+0x10>
    ;
  return os;
}
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	89 c8                	mov    %ecx,%eax
 263:	c9                   	leave  
 264:	c3                   	ret    
 265:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 55 08             	mov    0x8(%ebp),%edx
 277:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 27a:	0f b6 02             	movzbl (%edx),%eax
 27d:	84 c0                	test   %al,%al
 27f:	75 17                	jne    298 <strcmp+0x28>
 281:	eb 3a                	jmp    2bd <strcmp+0x4d>
 283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 287:	90                   	nop
 288:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 28c:	83 c2 01             	add    $0x1,%edx
 28f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 292:	84 c0                	test   %al,%al
 294:	74 1a                	je     2b0 <strcmp+0x40>
    p++, q++;
 296:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 298:	0f b6 19             	movzbl (%ecx),%ebx
 29b:	38 c3                	cmp    %al,%bl
 29d:	74 e9                	je     288 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 29f:	29 d8                	sub    %ebx,%eax
}
 2a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 2b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2b4:	31 c0                	xor    %eax,%eax
 2b6:	29 d8                	sub    %ebx,%eax
}
 2b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2bb:	c9                   	leave  
 2bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 2bd:	0f b6 19             	movzbl (%ecx),%ebx
 2c0:	31 c0                	xor    %eax,%eax
 2c2:	eb db                	jmp    29f <strcmp+0x2f>
 2c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <strlen>:

uint
strlen(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2d6:	80 3a 00             	cmpb   $0x0,(%edx)
 2d9:	74 15                	je     2f0 <strlen+0x20>
 2db:	31 c0                	xor    %eax,%eax
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
 2e0:	83 c0 01             	add    $0x1,%eax
 2e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2e7:	89 c1                	mov    %eax,%ecx
 2e9:	75 f5                	jne    2e0 <strlen+0x10>
    ;
  return n;
}
 2eb:	89 c8                	mov    %ecx,%eax
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    
 2ef:	90                   	nop
  for(n = 0; s[n]; n++)
 2f0:	31 c9                	xor    %ecx,%ecx
}
 2f2:	5d                   	pop    %ebp
 2f3:	89 c8                	mov    %ecx,%eax
 2f5:	c3                   	ret    
 2f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fd:	8d 76 00             	lea    0x0(%esi),%esi

00000300 <memset>:

void*
memset(void *dst, int c, uint n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 307:	8b 4d 10             	mov    0x10(%ebp),%ecx
 30a:	8b 45 0c             	mov    0xc(%ebp),%eax
 30d:	89 d7                	mov    %edx,%edi
 30f:	fc                   	cld    
 310:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 312:	8b 7d fc             	mov    -0x4(%ebp),%edi
 315:	89 d0                	mov    %edx,%eax
 317:	c9                   	leave  
 318:	c3                   	ret    
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <strchr>:

char*
strchr(const char *s, char c)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 32a:	0f b6 10             	movzbl (%eax),%edx
 32d:	84 d2                	test   %dl,%dl
 32f:	75 12                	jne    343 <strchr+0x23>
 331:	eb 1d                	jmp    350 <strchr+0x30>
 333:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 337:	90                   	nop
 338:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 33c:	83 c0 01             	add    $0x1,%eax
 33f:	84 d2                	test   %dl,%dl
 341:	74 0d                	je     350 <strchr+0x30>
    if(*s == c)
 343:	38 d1                	cmp    %dl,%cl
 345:	75 f1                	jne    338 <strchr+0x18>
      return (char*)s;
  return 0;
}
 347:	5d                   	pop    %ebp
 348:	c3                   	ret    
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 350:	31 c0                	xor    %eax,%eax
}
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <gets>:

char*
gets(char *buf, int max)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 365:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 368:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 369:	31 db                	xor    %ebx,%ebx
{
 36b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 36e:	eb 27                	jmp    397 <gets+0x37>
    cc = read(0, &c, 1);
 370:	83 ec 04             	sub    $0x4,%esp
 373:	6a 01                	push   $0x1
 375:	57                   	push   %edi
 376:	6a 00                	push   $0x0
 378:	e8 2e 01 00 00       	call   4ab <read>
    if(cc < 1)
 37d:	83 c4 10             	add    $0x10,%esp
 380:	85 c0                	test   %eax,%eax
 382:	7e 1d                	jle    3a1 <gets+0x41>
      break;
    buf[i++] = c;
 384:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 388:	8b 55 08             	mov    0x8(%ebp),%edx
 38b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 38f:	3c 0a                	cmp    $0xa,%al
 391:	74 1d                	je     3b0 <gets+0x50>
 393:	3c 0d                	cmp    $0xd,%al
 395:	74 19                	je     3b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 397:	89 de                	mov    %ebx,%esi
 399:	83 c3 01             	add    $0x1,%ebx
 39c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 39f:	7c cf                	jl     370 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3a1:	8b 45 08             	mov    0x8(%ebp),%eax
 3a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ab:	5b                   	pop    %ebx
 3ac:	5e                   	pop    %esi
 3ad:	5f                   	pop    %edi
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    
  buf[i] = '\0';
 3b0:	8b 45 08             	mov    0x8(%ebp),%eax
 3b3:	89 de                	mov    %ebx,%esi
 3b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 3b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bc:	5b                   	pop    %ebx
 3bd:	5e                   	pop    %esi
 3be:	5f                   	pop    %edi
 3bf:	5d                   	pop    %ebp
 3c0:	c3                   	ret    
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3d5:	83 ec 08             	sub    $0x8,%esp
 3d8:	6a 00                	push   $0x0
 3da:	ff 75 08             	push   0x8(%ebp)
 3dd:	e8 f1 00 00 00       	call   4d3 <open>
  if(fd < 0)
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	85 c0                	test   %eax,%eax
 3e7:	78 27                	js     410 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3e9:	83 ec 08             	sub    $0x8,%esp
 3ec:	ff 75 0c             	push   0xc(%ebp)
 3ef:	89 c3                	mov    %eax,%ebx
 3f1:	50                   	push   %eax
 3f2:	e8 f4 00 00 00       	call   4eb <fstat>
  close(fd);
 3f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3fa:	89 c6                	mov    %eax,%esi
  close(fd);
 3fc:	e8 ba 00 00 00       	call   4bb <close>
  return r;
 401:	83 c4 10             	add    $0x10,%esp
}
 404:	8d 65 f8             	lea    -0x8(%ebp),%esp
 407:	89 f0                	mov    %esi,%eax
 409:	5b                   	pop    %ebx
 40a:	5e                   	pop    %esi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 410:	be ff ff ff ff       	mov    $0xffffffff,%esi
 415:	eb ed                	jmp    404 <stat+0x34>
 417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41e:	66 90                	xchg   %ax,%ax

00000420 <atoi>:

int
atoi(const char *s)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 427:	0f be 02             	movsbl (%edx),%eax
 42a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 42d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 430:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 435:	77 1e                	ja     455 <atoi+0x35>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 440:	83 c2 01             	add    $0x1,%edx
 443:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 446:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 44a:	0f be 02             	movsbl (%edx),%eax
 44d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 450:	80 fb 09             	cmp    $0x9,%bl
 453:	76 eb                	jbe    440 <atoi+0x20>
  return n;
}
 455:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 458:	89 c8                	mov    %ecx,%eax
 45a:	c9                   	leave  
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	8b 45 10             	mov    0x10(%ebp),%eax
 467:	8b 55 08             	mov    0x8(%ebp),%edx
 46a:	56                   	push   %esi
 46b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 46e:	85 c0                	test   %eax,%eax
 470:	7e 13                	jle    485 <memmove+0x25>
 472:	01 d0                	add    %edx,%eax
  dst = vdst;
 474:	89 d7                	mov    %edx,%edi
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 480:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 481:	39 f8                	cmp    %edi,%eax
 483:	75 fb                	jne    480 <memmove+0x20>
  return vdst;
}
 485:	5e                   	pop    %esi
 486:	89 d0                	mov    %edx,%eax
 488:	5f                   	pop    %edi
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    

0000048b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48b:	b8 01 00 00 00       	mov    $0x1,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <exit>:
SYSCALL(exit)
 493:	b8 02 00 00 00       	mov    $0x2,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <wait>:
SYSCALL(wait)
 49b:	b8 03 00 00 00       	mov    $0x3,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <pipe>:
SYSCALL(pipe)
 4a3:	b8 04 00 00 00       	mov    $0x4,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <read>:
SYSCALL(read)
 4ab:	b8 05 00 00 00       	mov    $0x5,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <write>:
SYSCALL(write)
 4b3:	b8 10 00 00 00       	mov    $0x10,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <close>:
SYSCALL(close)
 4bb:	b8 15 00 00 00       	mov    $0x15,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <kill>:
SYSCALL(kill)
 4c3:	b8 06 00 00 00       	mov    $0x6,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <exec>:
SYSCALL(exec)
 4cb:	b8 07 00 00 00       	mov    $0x7,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <open>:
SYSCALL(open)
 4d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <mknod>:
SYSCALL(mknod)
 4db:	b8 11 00 00 00       	mov    $0x11,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <unlink>:
SYSCALL(unlink)
 4e3:	b8 12 00 00 00       	mov    $0x12,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <fstat>:
SYSCALL(fstat)
 4eb:	b8 08 00 00 00       	mov    $0x8,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <link>:
SYSCALL(link)
 4f3:	b8 13 00 00 00       	mov    $0x13,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <mkdir>:
SYSCALL(mkdir)
 4fb:	b8 14 00 00 00       	mov    $0x14,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <chdir>:
SYSCALL(chdir)
 503:	b8 09 00 00 00       	mov    $0x9,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <dup>:
SYSCALL(dup)
 50b:	b8 0a 00 00 00       	mov    $0xa,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <getpid>:
SYSCALL(getpid)
 513:	b8 0b 00 00 00       	mov    $0xb,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <sbrk>:
SYSCALL(sbrk)
 51b:	b8 0c 00 00 00       	mov    $0xc,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <sleep>:
SYSCALL(sleep)
 523:	b8 0d 00 00 00       	mov    $0xd,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <uptime>:
SYSCALL(uptime)
 52b:	b8 0e 00 00 00       	mov    $0xe,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <clone>:
SYSCALL(clone)
 533:	b8 16 00 00 00       	mov    $0x16,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <join>:
 53b:	b8 17 00 00 00       	mov    $0x17,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    
 543:	66 90                	xchg   %ax,%ax
 545:	66 90                	xchg   %ax,%ax
 547:	66 90                	xchg   %ax,%ax
 549:	66 90                	xchg   %ax,%ax
 54b:	66 90                	xchg   %ax,%ax
 54d:	66 90                	xchg   %ax,%ax
 54f:	90                   	nop

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
 559:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 55c:	89 d1                	mov    %edx,%ecx
{
 55e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 561:	85 d2                	test   %edx,%edx
 563:	0f 89 7f 00 00 00    	jns    5e8 <printint+0x98>
 569:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 56d:	74 79                	je     5e8 <printint+0x98>
    neg = 1;
 56f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 576:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 578:	31 db                	xor    %ebx,%ebx
 57a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 580:	89 c8                	mov    %ecx,%eax
 582:	31 d2                	xor    %edx,%edx
 584:	89 cf                	mov    %ecx,%edi
 586:	f7 75 c4             	divl   -0x3c(%ebp)
 589:	0f b6 92 d8 09 00 00 	movzbl 0x9d8(%edx),%edx
 590:	89 45 c0             	mov    %eax,-0x40(%ebp)
 593:	89 d8                	mov    %ebx,%eax
 595:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 598:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 59b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 59e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5a1:	76 dd                	jbe    580 <printint+0x30>
  if(neg)
 5a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5a6:	85 c9                	test   %ecx,%ecx
 5a8:	74 0c                	je     5b6 <printint+0x66>
    buf[i++] = '-';
 5aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5bd:	eb 07                	jmp    5c6 <printint+0x76>
 5bf:	90                   	nop
    putc(fd, buf[i]);
 5c0:	0f b6 13             	movzbl (%ebx),%edx
 5c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5c6:	83 ec 04             	sub    $0x4,%esp
 5c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5cc:	6a 01                	push   $0x1
 5ce:	56                   	push   %esi
 5cf:	57                   	push   %edi
 5d0:	e8 de fe ff ff       	call   4b3 <write>
  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x70>
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ef:	eb 87                	jmp    578 <printint+0x28>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 60c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 60f:	0f b6 13             	movzbl (%ebx),%edx
 612:	84 d2                	test   %dl,%dl
 614:	74 6a                	je     680 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 616:	8d 45 10             	lea    0x10(%ebp),%eax
 619:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 61c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 61f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 621:	89 45 d0             	mov    %eax,-0x30(%ebp)
 624:	eb 36                	jmp    65c <printf+0x5c>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
 630:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 633:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	74 15                	je     652 <printf+0x52>
  write(fd, &c, 1);
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	88 55 e7             	mov    %dl,-0x19(%ebp)
 643:	6a 01                	push   $0x1
 645:	57                   	push   %edi
 646:	56                   	push   %esi
 647:	e8 67 fe ff ff       	call   4b3 <write>
 64c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 64f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 652:	0f b6 13             	movzbl (%ebx),%edx
 655:	83 c3 01             	add    $0x1,%ebx
 658:	84 d2                	test   %dl,%dl
 65a:	74 24                	je     680 <printf+0x80>
    c = fmt[i] & 0xff;
 65c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 65f:	85 c9                	test   %ecx,%ecx
 661:	74 cd                	je     630 <printf+0x30>
      }
    } else if(state == '%'){
 663:	83 f9 25             	cmp    $0x25,%ecx
 666:	75 ea                	jne    652 <printf+0x52>
      if(c == 'd'){
 668:	83 f8 25             	cmp    $0x25,%eax
 66b:	0f 84 07 01 00 00    	je     778 <printf+0x178>
 671:	83 e8 63             	sub    $0x63,%eax
 674:	83 f8 15             	cmp    $0x15,%eax
 677:	77 17                	ja     690 <printf+0x90>
 679:	ff 24 85 80 09 00 00 	jmp    *0x980(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
 683:	5b                   	pop    %ebx
 684:	5e                   	pop    %esi
 685:	5f                   	pop    %edi
 686:	5d                   	pop    %ebp
 687:	c3                   	ret    
 688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 696:	6a 01                	push   $0x1
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69e:	e8 10 fe ff ff       	call   4b3 <write>
        putc(fd, c);
 6a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6a7:	83 c4 0c             	add    $0xc,%esp
 6aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6ad:	6a 01                	push   $0x1
 6af:	57                   	push   %edi
 6b0:	56                   	push   %esi
 6b1:	e8 fd fd ff ff       	call   4b3 <write>
        putc(fd, c);
 6b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b9:	31 c9                	xor    %ecx,%ecx
 6bb:	eb 95                	jmp    652 <printf+0x52>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c8:	6a 00                	push   $0x0
 6ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6cd:	8b 10                	mov    (%eax),%edx
 6cf:	89 f0                	mov    %esi,%eax
 6d1:	e8 7a fe ff ff       	call   550 <printint>
        ap++;
 6d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6dd:	31 c9                	xor    %ecx,%ecx
 6df:	e9 6e ff ff ff       	jmp    652 <printf+0x52>
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6eb:	8b 10                	mov    (%eax),%edx
        ap++;
 6ed:	83 c0 04             	add    $0x4,%eax
 6f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6f3:	85 d2                	test   %edx,%edx
 6f5:	0f 84 8d 00 00 00    	je     788 <printf+0x188>
        while(*s != 0){
 6fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 700:	84 c0                	test   %al,%al
 702:	0f 84 4a ff ff ff    	je     652 <printf+0x52>
 708:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 70b:	89 d3                	mov    %edx,%ebx
 70d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
          s++;
 713:	83 c3 01             	add    $0x1,%ebx
 716:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	57                   	push   %edi
 71c:	56                   	push   %esi
 71d:	e8 91 fd ff ff       	call   4b3 <write>
        while(*s != 0){
 722:	0f b6 03             	movzbl (%ebx),%eax
 725:	83 c4 10             	add    $0x10,%esp
 728:	84 c0                	test   %al,%al
 72a:	75 e4                	jne    710 <printf+0x110>
      state = 0;
 72c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 72f:	31 c9                	xor    %ecx,%ecx
 731:	e9 1c ff ff ff       	jmp    652 <printf+0x52>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 0a 00 00 00       	mov    $0xa,%ecx
 748:	6a 01                	push   $0x1
 74a:	e9 7b ff ff ff       	jmp    6ca <printf+0xca>
 74f:	90                   	nop
        putc(fd, *ap);
 750:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 756:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
 75a:	57                   	push   %edi
 75b:	56                   	push   %esi
        putc(fd, *ap);
 75c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 75f:	e8 4f fd ff ff       	call   4b3 <write>
        ap++;
 764:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 768:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76b:	31 c9                	xor    %ecx,%ecx
 76d:	e9 e0 fe ff ff       	jmp    652 <printf+0x52>
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 778:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 77b:	83 ec 04             	sub    $0x4,%esp
 77e:	e9 2a ff ff ff       	jmp    6ad <printf+0xad>
 783:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 787:	90                   	nop
          s = "(null)";
 788:	ba 78 09 00 00       	mov    $0x978,%edx
        while(*s != 0){
 78d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 790:	b8 28 00 00 00       	mov    $0x28,%eax
 795:	89 d3                	mov    %edx,%ebx
 797:	e9 74 ff ff ff       	jmp    710 <printf+0x110>
 79c:	66 90                	xchg   %ax,%ax
 79e:	66 90                	xchg   %ax,%ax

000007a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	a1 60 0f 00 00       	mov    0xf60,%eax
{
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	53                   	push   %ebx
 7ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7b8:	89 c2                	mov    %eax,%edx
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	39 ca                	cmp    %ecx,%edx
 7be:	73 30                	jae    7f0 <free+0x50>
 7c0:	39 c1                	cmp    %eax,%ecx
 7c2:	72 04                	jb     7c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c4:	39 c2                	cmp    %eax,%edx
 7c6:	72 f0                	jb     7b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ce:	39 f8                	cmp    %edi,%eax
 7d0:	74 30                	je     802 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7d5:	8b 42 04             	mov    0x4(%edx),%eax
 7d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7db:	39 f1                	cmp    %esi,%ecx
 7dd:	74 3a                	je     819 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7e1:	5b                   	pop    %ebx
  freep = p;
 7e2:	89 15 60 0f 00 00    	mov    %edx,0xf60
}
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f0:	39 c2                	cmp    %eax,%edx
 7f2:	72 c4                	jb     7b8 <free+0x18>
 7f4:	39 c1                	cmp    %eax,%ecx
 7f6:	73 c0                	jae    7b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fe:	39 f8                	cmp    %edi,%eax
 800:	75 d0                	jne    7d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 802:	03 70 04             	add    0x4(%eax),%esi
 805:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 808:	8b 02                	mov    (%edx),%eax
 80a:	8b 00                	mov    (%eax),%eax
 80c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 80f:	8b 42 04             	mov    0x4(%edx),%eax
 812:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 815:	39 f1                	cmp    %esi,%ecx
 817:	75 c6                	jne    7df <free+0x3f>
    p->s.size += bp->s.size;
 819:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 81c:	89 15 60 0f 00 00    	mov    %edx,0xf60
    p->s.size += bp->s.size;
 822:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 825:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 828:	89 0a                	mov    %ecx,(%edx)
}
 82a:	5b                   	pop    %ebx
 82b:	5e                   	pop    %esi
 82c:	5f                   	pop    %edi
 82d:	5d                   	pop    %ebp
 82e:	c3                   	ret    
 82f:	90                   	nop

00000830 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 83c:	8b 3d 60 0f 00 00    	mov    0xf60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 842:	8d 70 07             	lea    0x7(%eax),%esi
 845:	c1 ee 03             	shr    $0x3,%esi
 848:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 84b:	85 ff                	test   %edi,%edi
 84d:	0f 84 9d 00 00 00    	je     8f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 853:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 855:	8b 4a 04             	mov    0x4(%edx),%ecx
 858:	39 f1                	cmp    %esi,%ecx
 85a:	73 6a                	jae    8c6 <malloc+0x96>
 85c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 861:	39 de                	cmp    %ebx,%esi
 863:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 866:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 86d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 870:	eb 17                	jmp    889 <malloc+0x59>
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 878:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 87a:	8b 48 04             	mov    0x4(%eax),%ecx
 87d:	39 f1                	cmp    %esi,%ecx
 87f:	73 4f                	jae    8d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 881:	8b 3d 60 0f 00 00    	mov    0xf60,%edi
 887:	89 c2                	mov    %eax,%edx
 889:	39 d7                	cmp    %edx,%edi
 88b:	75 eb                	jne    878 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 88d:	83 ec 0c             	sub    $0xc,%esp
 890:	ff 75 e4             	push   -0x1c(%ebp)
 893:	e8 83 fc ff ff       	call   51b <sbrk>
  if(p == (char*)-1)
 898:	83 c4 10             	add    $0x10,%esp
 89b:	83 f8 ff             	cmp    $0xffffffff,%eax
 89e:	74 1c                	je     8bc <malloc+0x8c>
  hp->s.size = nu;
 8a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a3:	83 ec 0c             	sub    $0xc,%esp
 8a6:	83 c0 08             	add    $0x8,%eax
 8a9:	50                   	push   %eax
 8aa:	e8 f1 fe ff ff       	call   7a0 <free>
  return freep;
 8af:	8b 15 60 0f 00 00    	mov    0xf60,%edx
      if((p = morecore(nunits)) == 0)
 8b5:	83 c4 10             	add    $0x10,%esp
 8b8:	85 d2                	test   %edx,%edx
 8ba:	75 bc                	jne    878 <malloc+0x48>
        return 0;
  }
}
 8bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8bf:	31 c0                	xor    %eax,%eax
}
 8c1:	5b                   	pop    %ebx
 8c2:	5e                   	pop    %esi
 8c3:	5f                   	pop    %edi
 8c4:	5d                   	pop    %ebp
 8c5:	c3                   	ret    
    if(p->s.size >= nunits){
 8c6:	89 d0                	mov    %edx,%eax
 8c8:	89 fa                	mov    %edi,%edx
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8d0:	39 ce                	cmp    %ecx,%esi
 8d2:	74 4c                	je     920 <malloc+0xf0>
        p->s.size -= nunits;
 8d4:	29 f1                	sub    %esi,%ecx
 8d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8df:	89 15 60 0f 00 00    	mov    %edx,0xf60
}
 8e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8e8:	83 c0 08             	add    $0x8,%eax
}
 8eb:	5b                   	pop    %ebx
 8ec:	5e                   	pop    %esi
 8ed:	5f                   	pop    %edi
 8ee:	5d                   	pop    %ebp
 8ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8f0:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 8f7:	0f 00 00 
    base.s.size = 0;
 8fa:	bf 64 0f 00 00       	mov    $0xf64,%edi
    base.s.ptr = freep = prevp = &base;
 8ff:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 906:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 909:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 90b:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 912:	00 00 00 
    if(p->s.size >= nunits){
 915:	e9 42 ff ff ff       	jmp    85c <malloc+0x2c>
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 920:	8b 08                	mov    (%eax),%ecx
 922:	89 0a                	mov    %ecx,(%edx)
 924:	eb b9                	jmp    8df <malloc+0xaf>
