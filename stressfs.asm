
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	push   -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2b:	68 78 09 00 00       	push   $0x978
  30:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  39:	74 72 65 
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 05 06 00 00       	call   650 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 f5 02 00 00       	call   350 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 78 04 00 00       	call   4db <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  7c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  81:	68 8b 09 00 00       	push   $0x98b
  86:	6a 01                	push   $0x1
  88:	e8 c3 05 00 00       	call   650 <printf>
  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  8f:	5f                   	pop    %edi
  path[8] += i;
  90:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 7b 04 00 00       	call   523 <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 44 04 00 00       	call   503 <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 3b 04 00 00       	call   50b <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 95 09 00 00       	push   $0x995
  d7:	6a 01                	push   $0x1
  d9:	e8 72 05 00 00       	call   650 <printf>

  fd = open(path, O_RDONLY);
  de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e4:	59                   	pop    %ecx
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	bb 14 00 00 00       	mov    $0x14,%ebx
  ed:	50                   	push   %eax
  ee:	e8 30 04 00 00       	call   523 <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
  f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 ec 03 00 00       	call   4fb <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 eb 03 00 00       	call   50b <close>

  wait();
 120:	e8 c6 03 00 00       	call   4eb <wait>

  exit();
 125:	e8 b9 03 00 00       	call   4e3 <exit>
  path[8] += i;
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <lock_init>:



void 
lock_init(lock_t *lock)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
  lock->locked = 0;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 14c:	5d                   	pop    %ebp
 14d:	c3                   	ret    
 14e:	66 90                	xchg   %ax,%ax

00000150 <lock_acquire>:

void 
lock_acquire(lock_t *lock)
{
 150:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 151:	b9 01 00 00 00       	mov    $0x1,%ecx
 156:	89 e5                	mov    %esp,%ebp
 158:	8b 55 08             	mov    0x8(%ebp),%edx
 15b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop
 160:	89 c8                	mov    %ecx,%eax
 162:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&(lock->locked), 1) != 0)
 165:	85 c0                	test   %eax,%eax
 167:	75 f7                	jne    160 <lock_acquire+0x10>
  ;
}
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <lock_release>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
 17e:	66 90                	xchg   %ax,%ax

00000180 <thread_create>:
  lock->locked = 0;
}

int 
thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	83 ec 20             	sub    $0x20,%esp
  void * freeStack = malloc(2*PGSIZE);
 187:	68 00 20 00 00       	push   $0x2000
 18c:	e8 ef 06 00 00       	call   880 <malloc>
  if(freeStack == 0) return -1;
 191:	83 c4 10             	add    $0x10,%esp
 194:	85 c0                	test   %eax,%eax
 196:	74 7f                	je     217 <thread_create+0x97>

  void *stack = freeStack;
  if((uint)freeStack % PGSIZE != 0)
 198:	89 c2                	mov    %eax,%edx
 19a:	89 c3                	mov    %eax,%ebx
 19c:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 1a2:	75 4c                	jne    1f0 <thread_create+0x70>
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);

  int childPid = clone(start_routine, arg1, arg2, stack);
 1a4:	50                   	push   %eax
 1a5:	ff 75 10             	push   0x10(%ebp)
 1a8:	ff 75 0c             	push   0xc(%ebp)
 1ab:	ff 75 08             	push   0x8(%ebp)
 1ae:	e8 d0 03 00 00       	call   583 <clone>
  if(childPid != -1)
 1b3:	83 c4 10             	add    $0x10,%esp
 1b6:	83 f8 ff             	cmp    $0xffffffff,%eax
 1b9:	74 45                	je     200 <thread_create+0x80>
  {
    for(int i = 0; i < SIZE; i++)
 1bb:	31 d2                	xor    %edx,%edx
 1bd:	eb 09                	jmp    1c8 <thread_create+0x48>
 1bf:	90                   	nop
 1c0:	83 c2 01             	add    $0x1,%edx
 1c3:	83 fa 40             	cmp    $0x40,%edx
 1c6:	74 19                	je     1e1 <thread_create+0x61>
    {
      if(userStackAddr[i] == NULL)
 1c8:	8b 0c 95 80 0e 00 00 	mov    0xe80(,%edx,4),%ecx
 1cf:	85 c9                	test   %ecx,%ecx
 1d1:	75 ed                	jne    1c0 <thread_create+0x40>
      {
        userStackAddr[i] = freeStack;
 1d3:	89 1c 95 80 0e 00 00 	mov    %ebx,0xe80(,%edx,4)
        valueArray[i] = childPid;
 1da:	89 04 95 80 0d 00 00 	mov    %eax,0xd80(,%edx,4)
  {
    free(freeStack);
  }

  return childPid;
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);
 1f0:	29 d0                	sub    %edx,%eax
 1f2:	05 00 10 00 00       	add    $0x1000,%eax
 1f7:	eb ab                	jmp    1a4 <thread_create+0x24>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    free(freeStack);
 200:	83 ec 0c             	sub    $0xc,%esp
 203:	89 45 f4             	mov    %eax,-0xc(%ebp)
 206:	53                   	push   %ebx
 207:	e8 e4 05 00 00       	call   7f0 <free>
 20c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 20f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(freeStack);
 212:	83 c4 10             	add    $0x10,%esp
}
 215:	c9                   	leave  
 216:	c3                   	ret    
  if(freeStack == 0) return -1;
 217:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21c:	eb c3                	jmp    1e1 <thread_create+0x61>
 21e:	66 90                	xchg   %ax,%ax

00000220 <thread_join>:

int 
thread_join()
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
  void *stack;
  int childPid = join(&stack);
 225:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 228:	83 ec 1c             	sub    $0x1c,%esp
  int childPid = join(&stack);
 22b:	50                   	push   %eax
 22c:	e8 5a 03 00 00       	call   58b <join>

  if(childPid != -1) {
 231:	83 c4 10             	add    $0x10,%esp
  int childPid = join(&stack);
 234:	89 c6                	mov    %eax,%esi
  if(childPid != -1) {
 236:	83 f8 ff             	cmp    $0xffffffff,%eax
 239:	74 46                	je     281 <thread_join+0x61>
    for(int i=0; i < SIZE; i++) {
 23b:	31 db                	xor    %ebx,%ebx
 23d:	eb 09                	jmp    248 <thread_join+0x28>
 23f:	90                   	nop
 240:	83 c3 01             	add    $0x1,%ebx
 243:	83 fb 40             	cmp    $0x40,%ebx
 246:	74 39                	je     281 <thread_join+0x61>
      if(valueArray[i] == childPid) {
 248:	39 34 9d 80 0d 00 00 	cmp    %esi,0xd80(,%ebx,4)
 24f:	75 ef                	jne    240 <thread_join+0x20>
        free(userStackAddr[i]);
 251:	83 ec 0c             	sub    $0xc,%esp
 254:	ff 34 9d 80 0e 00 00 	push   0xe80(,%ebx,4)
 25b:	e8 90 05 00 00       	call   7f0 <free>
        valueArray[i] = -1;
        userStackAddr[i] = NULL;
 260:	83 c4 10             	add    $0x10,%esp
        valueArray[i] = -1;
 263:	c7 04 9d 80 0d 00 00 	movl   $0xffffffff,0xd80(,%ebx,4)
 26a:	ff ff ff ff 
        userStackAddr[i] = NULL;
 26e:	c7 04 9d 80 0e 00 00 	movl   $0x0,0xe80(,%ebx,4)
 275:	00 00 00 00 
    for(int i=0; i < SIZE; i++) {
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	83 fb 40             	cmp    $0x40,%ebx
 27f:	75 c7                	jne    248 <thread_join+0x28>
      }
    }
  }
  return childPid;
}
 281:	8d 65 f8             	lea    -0x8(%ebp),%esp
 284:	89 f0                	mov    %esi,%eax
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 290:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 291:	31 c0                	xor    %eax,%eax
{
 293:	89 e5                	mov    %esp,%ebp
 295:	53                   	push   %ebx
 296:	8b 4d 08             	mov    0x8(%ebp),%ecx
 299:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 2a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2a7:	83 c0 01             	add    $0x1,%eax
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strcpy+0x10>
    ;
  return os;
}
 2ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b1:	89 c8                	mov    %ecx,%eax
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    
 2b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
 2c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2ca:	0f b6 02             	movzbl (%edx),%eax
 2cd:	84 c0                	test   %al,%al
 2cf:	75 17                	jne    2e8 <strcmp+0x28>
 2d1:	eb 3a                	jmp    30d <strcmp+0x4d>
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 2dc:	83 c2 01             	add    $0x1,%edx
 2df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 2e2:	84 c0                	test   %al,%al
 2e4:	74 1a                	je     300 <strcmp+0x40>
    p++, q++;
 2e6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 2e8:	0f b6 19             	movzbl (%ecx),%ebx
 2eb:	38 c3                	cmp    %al,%bl
 2ed:	74 e9                	je     2d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 2ef:	29 d8                	sub    %ebx,%eax
}
 2f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f4:	c9                   	leave  
 2f5:	c3                   	ret    
 2f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 300:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 304:	31 c0                	xor    %eax,%eax
 306:	29 d8                	sub    %ebx,%eax
}
 308:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30b:	c9                   	leave  
 30c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 30d:	0f b6 19             	movzbl (%ecx),%ebx
 310:	31 c0                	xor    %eax,%eax
 312:	eb db                	jmp    2ef <strcmp+0x2f>
 314:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <strlen>:

uint
strlen(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 326:	80 3a 00             	cmpb   $0x0,(%edx)
 329:	74 15                	je     340 <strlen+0x20>
 32b:	31 c0                	xor    %eax,%eax
 32d:	8d 76 00             	lea    0x0(%esi),%esi
 330:	83 c0 01             	add    $0x1,%eax
 333:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 337:	89 c1                	mov    %eax,%ecx
 339:	75 f5                	jne    330 <strlen+0x10>
    ;
  return n;
}
 33b:	89 c8                	mov    %ecx,%eax
 33d:	5d                   	pop    %ebp
 33e:	c3                   	ret    
 33f:	90                   	nop
  for(n = 0; s[n]; n++)
 340:	31 c9                	xor    %ecx,%ecx
}
 342:	5d                   	pop    %ebp
 343:	89 c8                	mov    %ecx,%eax
 345:	c3                   	ret    
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi

00000350 <memset>:

void*
memset(void *dst, int c, uint n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 357:	8b 4d 10             	mov    0x10(%ebp),%ecx
 35a:	8b 45 0c             	mov    0xc(%ebp),%eax
 35d:	89 d7                	mov    %edx,%edi
 35f:	fc                   	cld    
 360:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 362:	8b 7d fc             	mov    -0x4(%ebp),%edi
 365:	89 d0                	mov    %edx,%eax
 367:	c9                   	leave  
 368:	c3                   	ret    
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <strchr>:

char*
strchr(const char *s, char c)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 37a:	0f b6 10             	movzbl (%eax),%edx
 37d:	84 d2                	test   %dl,%dl
 37f:	75 12                	jne    393 <strchr+0x23>
 381:	eb 1d                	jmp    3a0 <strchr+0x30>
 383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 387:	90                   	nop
 388:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 38c:	83 c0 01             	add    $0x1,%eax
 38f:	84 d2                	test   %dl,%dl
 391:	74 0d                	je     3a0 <strchr+0x30>
    if(*s == c)
 393:	38 d1                	cmp    %dl,%cl
 395:	75 f1                	jne    388 <strchr+0x18>
      return (char*)s;
  return 0;
}
 397:	5d                   	pop    %ebp
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3a0:	31 c0                	xor    %eax,%eax
}
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
 3a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <gets>:

char*
gets(char *buf, int max)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 3b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 3b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 3b9:	31 db                	xor    %ebx,%ebx
{
 3bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 3be:	eb 27                	jmp    3e7 <gets+0x37>
    cc = read(0, &c, 1);
 3c0:	83 ec 04             	sub    $0x4,%esp
 3c3:	6a 01                	push   $0x1
 3c5:	57                   	push   %edi
 3c6:	6a 00                	push   $0x0
 3c8:	e8 2e 01 00 00       	call   4fb <read>
    if(cc < 1)
 3cd:	83 c4 10             	add    $0x10,%esp
 3d0:	85 c0                	test   %eax,%eax
 3d2:	7e 1d                	jle    3f1 <gets+0x41>
      break;
    buf[i++] = c;
 3d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3d8:	8b 55 08             	mov    0x8(%ebp),%edx
 3db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 3df:	3c 0a                	cmp    $0xa,%al
 3e1:	74 1d                	je     400 <gets+0x50>
 3e3:	3c 0d                	cmp    $0xd,%al
 3e5:	74 19                	je     400 <gets+0x50>
  for(i=0; i+1 < max; ){
 3e7:	89 de                	mov    %ebx,%esi
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ef:	7c cf                	jl     3c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fb:	5b                   	pop    %ebx
 3fc:	5e                   	pop    %esi
 3fd:	5f                   	pop    %edi
 3fe:	5d                   	pop    %ebp
 3ff:	c3                   	ret    
  buf[i] = '\0';
 400:	8b 45 08             	mov    0x8(%ebp),%eax
 403:	89 de                	mov    %ebx,%esi
 405:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 409:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5f                   	pop    %edi
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <stat>:

int
stat(const char *n, struct stat *st)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 425:	83 ec 08             	sub    $0x8,%esp
 428:	6a 00                	push   $0x0
 42a:	ff 75 08             	push   0x8(%ebp)
 42d:	e8 f1 00 00 00       	call   523 <open>
  if(fd < 0)
 432:	83 c4 10             	add    $0x10,%esp
 435:	85 c0                	test   %eax,%eax
 437:	78 27                	js     460 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 439:	83 ec 08             	sub    $0x8,%esp
 43c:	ff 75 0c             	push   0xc(%ebp)
 43f:	89 c3                	mov    %eax,%ebx
 441:	50                   	push   %eax
 442:	e8 f4 00 00 00       	call   53b <fstat>
  close(fd);
 447:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 44a:	89 c6                	mov    %eax,%esi
  close(fd);
 44c:	e8 ba 00 00 00       	call   50b <close>
  return r;
 451:	83 c4 10             	add    $0x10,%esp
}
 454:	8d 65 f8             	lea    -0x8(%ebp),%esp
 457:	89 f0                	mov    %esi,%eax
 459:	5b                   	pop    %ebx
 45a:	5e                   	pop    %esi
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    
 45d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 460:	be ff ff ff ff       	mov    $0xffffffff,%esi
 465:	eb ed                	jmp    454 <stat+0x34>
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax

00000470 <atoi>:

int
atoi(const char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 477:	0f be 02             	movsbl (%edx),%eax
 47a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 47d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 480:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 485:	77 1e                	ja     4a5 <atoi+0x35>
 487:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 490:	83 c2 01             	add    $0x1,%edx
 493:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 496:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 49a:	0f be 02             	movsbl (%edx),%eax
 49d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a0:	80 fb 09             	cmp    $0x9,%bl
 4a3:	76 eb                	jbe    490 <atoi+0x20>
  return n;
}
 4a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a8:	89 c8                	mov    %ecx,%eax
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	8b 45 10             	mov    0x10(%ebp),%eax
 4b7:	8b 55 08             	mov    0x8(%ebp),%edx
 4ba:	56                   	push   %esi
 4bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4be:	85 c0                	test   %eax,%eax
 4c0:	7e 13                	jle    4d5 <memmove+0x25>
 4c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4c4:	89 d7                	mov    %edx,%edi
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4d1:	39 f8                	cmp    %edi,%eax
 4d3:	75 fb                	jne    4d0 <memmove+0x20>
  return vdst;
}
 4d5:	5e                   	pop    %esi
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    

000004db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4db:	b8 01 00 00 00       	mov    $0x1,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <exit>:
SYSCALL(exit)
 4e3:	b8 02 00 00 00       	mov    $0x2,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <wait>:
SYSCALL(wait)
 4eb:	b8 03 00 00 00       	mov    $0x3,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <pipe>:
SYSCALL(pipe)
 4f3:	b8 04 00 00 00       	mov    $0x4,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <read>:
SYSCALL(read)
 4fb:	b8 05 00 00 00       	mov    $0x5,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <write>:
SYSCALL(write)
 503:	b8 10 00 00 00       	mov    $0x10,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <close>:
SYSCALL(close)
 50b:	b8 15 00 00 00       	mov    $0x15,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <kill>:
SYSCALL(kill)
 513:	b8 06 00 00 00       	mov    $0x6,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <exec>:
SYSCALL(exec)
 51b:	b8 07 00 00 00       	mov    $0x7,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <open>:
SYSCALL(open)
 523:	b8 0f 00 00 00       	mov    $0xf,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mknod>:
SYSCALL(mknod)
 52b:	b8 11 00 00 00       	mov    $0x11,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <unlink>:
SYSCALL(unlink)
 533:	b8 12 00 00 00       	mov    $0x12,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <fstat>:
SYSCALL(fstat)
 53b:	b8 08 00 00 00       	mov    $0x8,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <link>:
SYSCALL(link)
 543:	b8 13 00 00 00       	mov    $0x13,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mkdir>:
SYSCALL(mkdir)
 54b:	b8 14 00 00 00       	mov    $0x14,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <chdir>:
SYSCALL(chdir)
 553:	b8 09 00 00 00       	mov    $0x9,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <dup>:
SYSCALL(dup)
 55b:	b8 0a 00 00 00       	mov    $0xa,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getpid>:
SYSCALL(getpid)
 563:	b8 0b 00 00 00       	mov    $0xb,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <sbrk>:
SYSCALL(sbrk)
 56b:	b8 0c 00 00 00       	mov    $0xc,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sleep>:
SYSCALL(sleep)
 573:	b8 0d 00 00 00       	mov    $0xd,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <uptime>:
SYSCALL(uptime)
 57b:	b8 0e 00 00 00       	mov    $0xe,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <clone>:
SYSCALL(clone)
 583:	b8 16 00 00 00       	mov    $0x16,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <join>:
 58b:	b8 17 00 00 00       	mov    $0x17,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    
 593:	66 90                	xchg   %ax,%ax
 595:	66 90                	xchg   %ax,%ax
 597:	66 90                	xchg   %ax,%ax
 599:	66 90                	xchg   %ax,%ax
 59b:	66 90                	xchg   %ax,%ax
 59d:	66 90                	xchg   %ax,%ax
 59f:	90                   	nop

000005a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 3c             	sub    $0x3c,%esp
 5a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ac:	89 d1                	mov    %edx,%ecx
{
 5ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5b1:	85 d2                	test   %edx,%edx
 5b3:	0f 89 7f 00 00 00    	jns    638 <printint+0x98>
 5b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5bd:	74 79                	je     638 <printint+0x98>
    neg = 1;
 5bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5c8:	31 db                	xor    %ebx,%ebx
 5ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	89 cf                	mov    %ecx,%edi
 5d6:	f7 75 c4             	divl   -0x3c(%ebp)
 5d9:	0f b6 92 fc 09 00 00 	movzbl 0x9fc(%edx),%edx
 5e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5e3:	89 d8                	mov    %ebx,%eax
 5e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5f1:	76 dd                	jbe    5d0 <printint+0x30>
  if(neg)
 5f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5f6:	85 c9                	test   %ecx,%ecx
 5f8:	74 0c                	je     606 <printint+0x66>
    buf[i++] = '-';
 5fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 601:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 606:	8b 7d b8             	mov    -0x48(%ebp),%edi
 609:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 60d:	eb 07                	jmp    616 <printint+0x76>
 60f:	90                   	nop
    putc(fd, buf[i]);
 610:	0f b6 13             	movzbl (%ebx),%edx
 613:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 616:	83 ec 04             	sub    $0x4,%esp
 619:	88 55 d7             	mov    %dl,-0x29(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	56                   	push   %esi
 61f:	57                   	push   %edi
 620:	e8 de fe ff ff       	call   503 <write>
  while(--i >= 0)
 625:	83 c4 10             	add    $0x10,%esp
 628:	39 de                	cmp    %ebx,%esi
 62a:	75 e4                	jne    610 <printint+0x70>
}
 62c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 638:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 63f:	eb 87                	jmp    5c8 <printint+0x28>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 659:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 65c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 65f:	0f b6 13             	movzbl (%ebx),%edx
 662:	84 d2                	test   %dl,%dl
 664:	74 6a                	je     6d0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 666:	8d 45 10             	lea    0x10(%ebp),%eax
 669:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 66c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 66f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 671:	89 45 d0             	mov    %eax,-0x30(%ebp)
 674:	eb 36                	jmp    6ac <printf+0x5c>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
 680:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 683:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	74 15                	je     6a2 <printf+0x52>
  write(fd, &c, 1);
 68d:	83 ec 04             	sub    $0x4,%esp
 690:	88 55 e7             	mov    %dl,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	56                   	push   %esi
 697:	e8 67 fe ff ff       	call   503 <write>
 69c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 69f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6a2:	0f b6 13             	movzbl (%ebx),%edx
 6a5:	83 c3 01             	add    $0x1,%ebx
 6a8:	84 d2                	test   %dl,%dl
 6aa:	74 24                	je     6d0 <printf+0x80>
    c = fmt[i] & 0xff;
 6ac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6af:	85 c9                	test   %ecx,%ecx
 6b1:	74 cd                	je     680 <printf+0x30>
      }
    } else if(state == '%'){
 6b3:	83 f9 25             	cmp    $0x25,%ecx
 6b6:	75 ea                	jne    6a2 <printf+0x52>
      if(c == 'd'){
 6b8:	83 f8 25             	cmp    $0x25,%eax
 6bb:	0f 84 07 01 00 00    	je     7c8 <printf+0x178>
 6c1:	83 e8 63             	sub    $0x63,%eax
 6c4:	83 f8 15             	cmp    $0x15,%eax
 6c7:	77 17                	ja     6e0 <printf+0x90>
 6c9:	ff 24 85 a4 09 00 00 	jmp    *0x9a4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d3:	5b                   	pop    %ebx
 6d4:	5e                   	pop    %esi
 6d5:	5f                   	pop    %edi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 6e6:	6a 01                	push   $0x1
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6ee:	e8 10 fe ff ff       	call   503 <write>
        putc(fd, c);
 6f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6f7:	83 c4 0c             	add    $0xc,%esp
 6fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6fd:	6a 01                	push   $0x1
 6ff:	57                   	push   %edi
 700:	56                   	push   %esi
 701:	e8 fd fd ff ff       	call   503 <write>
        putc(fd, c);
 706:	83 c4 10             	add    $0x10,%esp
      state = 0;
 709:	31 c9                	xor    %ecx,%ecx
 70b:	eb 95                	jmp    6a2 <printf+0x52>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 10 00 00 00       	mov    $0x10,%ecx
 718:	6a 00                	push   $0x0
 71a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 71d:	8b 10                	mov    (%eax),%edx
 71f:	89 f0                	mov    %esi,%eax
 721:	e8 7a fe ff ff       	call   5a0 <printint>
        ap++;
 726:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 72a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72d:	31 c9                	xor    %ecx,%ecx
 72f:	e9 6e ff ff ff       	jmp    6a2 <printf+0x52>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 738:	8b 45 d0             	mov    -0x30(%ebp),%eax
 73b:	8b 10                	mov    (%eax),%edx
        ap++;
 73d:	83 c0 04             	add    $0x4,%eax
 740:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 743:	85 d2                	test   %edx,%edx
 745:	0f 84 8d 00 00 00    	je     7d8 <printf+0x188>
        while(*s != 0){
 74b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 74e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 750:	84 c0                	test   %al,%al
 752:	0f 84 4a ff ff ff    	je     6a2 <printf+0x52>
 758:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 75b:	89 d3                	mov    %edx,%ebx
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 760:	83 ec 04             	sub    $0x4,%esp
          s++;
 763:	83 c3 01             	add    $0x1,%ebx
 766:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 769:	6a 01                	push   $0x1
 76b:	57                   	push   %edi
 76c:	56                   	push   %esi
 76d:	e8 91 fd ff ff       	call   503 <write>
        while(*s != 0){
 772:	0f b6 03             	movzbl (%ebx),%eax
 775:	83 c4 10             	add    $0x10,%esp
 778:	84 c0                	test   %al,%al
 77a:	75 e4                	jne    760 <printf+0x110>
      state = 0;
 77c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 77f:	31 c9                	xor    %ecx,%ecx
 781:	e9 1c ff ff ff       	jmp    6a2 <printf+0x52>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 0a 00 00 00       	mov    $0xa,%ecx
 798:	6a 01                	push   $0x1
 79a:	e9 7b ff ff ff       	jmp    71a <printf+0xca>
 79f:	90                   	nop
        putc(fd, *ap);
 7a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7a6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7a8:	6a 01                	push   $0x1
 7aa:	57                   	push   %edi
 7ab:	56                   	push   %esi
        putc(fd, *ap);
 7ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7af:	e8 4f fd ff ff       	call   503 <write>
        ap++;
 7b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bb:	31 c9                	xor    %ecx,%ecx
 7bd:	e9 e0 fe ff ff       	jmp    6a2 <printf+0x52>
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 7c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7cb:	83 ec 04             	sub    $0x4,%esp
 7ce:	e9 2a ff ff ff       	jmp    6fd <printf+0xad>
 7d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7d7:	90                   	nop
          s = "(null)";
 7d8:	ba 9b 09 00 00       	mov    $0x99b,%edx
        while(*s != 0){
 7dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7e0:	b8 28 00 00 00       	mov    $0x28,%eax
 7e5:	89 d3                	mov    %edx,%ebx
 7e7:	e9 74 ff ff ff       	jmp    760 <printf+0x110>
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	a1 80 0f 00 00       	mov    0xf80,%eax
{
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	53                   	push   %ebx
 7fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 808:	89 c2                	mov    %eax,%edx
 80a:	8b 00                	mov    (%eax),%eax
 80c:	39 ca                	cmp    %ecx,%edx
 80e:	73 30                	jae    840 <free+0x50>
 810:	39 c1                	cmp    %eax,%ecx
 812:	72 04                	jb     818 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 814:	39 c2                	cmp    %eax,%edx
 816:	72 f0                	jb     808 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 f8                	cmp    %edi,%eax
 820:	74 30                	je     852 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 822:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 825:	8b 42 04             	mov    0x4(%edx),%eax
 828:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 82b:	39 f1                	cmp    %esi,%ecx
 82d:	74 3a                	je     869 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 82f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 831:	5b                   	pop    %ebx
  freep = p;
 832:	89 15 80 0f 00 00    	mov    %edx,0xf80
}
 838:	5e                   	pop    %esi
 839:	5f                   	pop    %edi
 83a:	5d                   	pop    %ebp
 83b:	c3                   	ret    
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 840:	39 c2                	cmp    %eax,%edx
 842:	72 c4                	jb     808 <free+0x18>
 844:	39 c1                	cmp    %eax,%ecx
 846:	73 c0                	jae    808 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84e:	39 f8                	cmp    %edi,%eax
 850:	75 d0                	jne    822 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 852:	03 70 04             	add    0x4(%eax),%esi
 855:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 858:	8b 02                	mov    (%edx),%eax
 85a:	8b 00                	mov    (%eax),%eax
 85c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 85f:	8b 42 04             	mov    0x4(%edx),%eax
 862:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 865:	39 f1                	cmp    %esi,%ecx
 867:	75 c6                	jne    82f <free+0x3f>
    p->s.size += bp->s.size;
 869:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 86c:	89 15 80 0f 00 00    	mov    %edx,0xf80
    p->s.size += bp->s.size;
 872:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 875:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 878:	89 0a                	mov    %ecx,(%edx)
}
 87a:	5b                   	pop    %ebx
 87b:	5e                   	pop    %esi
 87c:	5f                   	pop    %edi
 87d:	5d                   	pop    %ebp
 87e:	c3                   	ret    
 87f:	90                   	nop

00000880 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 88c:	8b 3d 80 0f 00 00    	mov    0xf80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 892:	8d 70 07             	lea    0x7(%eax),%esi
 895:	c1 ee 03             	shr    $0x3,%esi
 898:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 89b:	85 ff                	test   %edi,%edi
 89d:	0f 84 9d 00 00 00    	je     940 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8a5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8a8:	39 f1                	cmp    %esi,%ecx
 8aa:	73 6a                	jae    916 <malloc+0x96>
 8ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8b1:	39 de                	cmp    %ebx,%esi
 8b3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8c0:	eb 17                	jmp    8d9 <malloc+0x59>
 8c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8ca:	8b 48 04             	mov    0x4(%eax),%ecx
 8cd:	39 f1                	cmp    %esi,%ecx
 8cf:	73 4f                	jae    920 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8d1:	8b 3d 80 0f 00 00    	mov    0xf80,%edi
 8d7:	89 c2                	mov    %eax,%edx
 8d9:	39 d7                	cmp    %edx,%edi
 8db:	75 eb                	jne    8c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8dd:	83 ec 0c             	sub    $0xc,%esp
 8e0:	ff 75 e4             	push   -0x1c(%ebp)
 8e3:	e8 83 fc ff ff       	call   56b <sbrk>
  if(p == (char*)-1)
 8e8:	83 c4 10             	add    $0x10,%esp
 8eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ee:	74 1c                	je     90c <malloc+0x8c>
  hp->s.size = nu;
 8f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8f3:	83 ec 0c             	sub    $0xc,%esp
 8f6:	83 c0 08             	add    $0x8,%eax
 8f9:	50                   	push   %eax
 8fa:	e8 f1 fe ff ff       	call   7f0 <free>
  return freep;
 8ff:	8b 15 80 0f 00 00    	mov    0xf80,%edx
      if((p = morecore(nunits)) == 0)
 905:	83 c4 10             	add    $0x10,%esp
 908:	85 d2                	test   %edx,%edx
 90a:	75 bc                	jne    8c8 <malloc+0x48>
        return 0;
  }
}
 90c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 90f:	31 c0                	xor    %eax,%eax
}
 911:	5b                   	pop    %ebx
 912:	5e                   	pop    %esi
 913:	5f                   	pop    %edi
 914:	5d                   	pop    %ebp
 915:	c3                   	ret    
    if(p->s.size >= nunits){
 916:	89 d0                	mov    %edx,%eax
 918:	89 fa                	mov    %edi,%edx
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 920:	39 ce                	cmp    %ecx,%esi
 922:	74 4c                	je     970 <malloc+0xf0>
        p->s.size -= nunits;
 924:	29 f1                	sub    %esi,%ecx
 926:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 929:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 92c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 92f:	89 15 80 0f 00 00    	mov    %edx,0xf80
}
 935:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 938:	83 c0 08             	add    $0x8,%eax
}
 93b:	5b                   	pop    %ebx
 93c:	5e                   	pop    %esi
 93d:	5f                   	pop    %edi
 93e:	5d                   	pop    %ebp
 93f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 940:	c7 05 80 0f 00 00 84 	movl   $0xf84,0xf80
 947:	0f 00 00 
    base.s.size = 0;
 94a:	bf 84 0f 00 00       	mov    $0xf84,%edi
    base.s.ptr = freep = prevp = &base;
 94f:	c7 05 84 0f 00 00 84 	movl   $0xf84,0xf84
 956:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 959:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 95b:	c7 05 88 0f 00 00 00 	movl   $0x0,0xf88
 962:	00 00 00 
    if(p->s.size >= nunits){
 965:	e9 42 ff ff ff       	jmp    8ac <malloc+0x2c>
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 970:	8b 08                	mov    (%eax),%ecx
 972:	89 0a                	mov    %ecx,(%edx)
 974:	eb b9                	jmp    92f <malloc+0xaf>
