
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 a1 06 00 00       	call   6e3 <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 c0 0b 00 00       	push   $0xbc0
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 8f 06 00 00       	call   6e3 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 af 04 00 00       	call   520 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 86 04 00 00       	call   520 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 75 04 00 00       	call   520 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 20 10 00 00       	push   $0x1020
  b5:	e8 f6 05 00 00       	call   6b0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 5e 04 00 00       	call   520 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 20 10 00 00       	mov    $0x1020,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 4f 04 00 00       	call   520 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 20 10 00 00       	add    $0x1020,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 67 04 00 00       	call   550 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 0c 06 00 00       	call   723 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 07 06 00 00       	call   73b <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 b0 05 00 00       	call   70b <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 a0 0b 00 00       	push   $0xba0
 19d:	6a 01                	push   $0x1
 19f:	e8 ac 06 00 00       	call   850 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb a9                	jmp    152 <ls+0x52>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 67 03 00 00       	call   520 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 b6 02 00 00       	call   490 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 3e 03 00 00       	call   520 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 e9 04 00 00       	call   6fb <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 23a:	e8 71 04 00 00       	call   6b0 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 ce 03 00 00       	call   620 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 a0 0b 00 00       	push   $0xba0
 2a7:	6a 01                	push   $0x1
 2a9:	e8 a2 05 00 00       	call   850 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 78 0b 00 00       	push   $0xb78
 2c9:	6a 02                	push   $0x2
 2cb:	e8 80 05 00 00       	call   850 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 ad 0b 00 00       	push   $0xbad
 2e8:	6a 01                	push   $0x1
 2ea:	e8 61 05 00 00       	call   850 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5b fe ff ff       	jmp    152 <ls+0x52>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 8c 0b 00 00       	push   $0xb8c
 309:	6a 02                	push   $0x2
 30b:	e8 40 05 00 00       	call   850 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 f3 03 00 00       	call   70b <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 8c 0b 00 00       	push   $0xb8c
 331:	6a 01                	push   $0x1
 333:	e8 18 05 00 00       	call   850 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <lock_init>:



void 
lock_init(lock_t *lock)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
  lock->locked = 0;
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 34c:	5d                   	pop    %ebp
 34d:	c3                   	ret    
 34e:	66 90                	xchg   %ax,%ax

00000350 <lock_acquire>:

void 
lock_acquire(lock_t *lock)
{
 350:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 351:	b9 01 00 00 00       	mov    $0x1,%ecx
 356:	89 e5                	mov    %esp,%ebp
 358:	8b 55 08             	mov    0x8(%ebp),%edx
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
 360:	89 c8                	mov    %ecx,%eax
 362:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&(lock->locked), 1) != 0)
 365:	85 c0                	test   %eax,%eax
 367:	75 f7                	jne    360 <lock_acquire+0x10>
  ;
}
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <lock_release>:
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	66 90                	xchg   %ax,%ax

00000380 <thread_create>:
  lock->locked = 0;
}

int 
thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	83 ec 20             	sub    $0x20,%esp
  void * freeStack = malloc(2*PGSIZE);
 387:	68 00 20 00 00       	push   $0x2000
 38c:	e8 ef 06 00 00       	call   a80 <malloc>
  if(freeStack == 0) return -1;
 391:	83 c4 10             	add    $0x10,%esp
 394:	85 c0                	test   %eax,%eax
 396:	74 7f                	je     417 <thread_create+0x97>

  void *stack = freeStack;
  if((uint)freeStack % PGSIZE != 0)
 398:	89 c2                	mov    %eax,%edx
 39a:	89 c3                	mov    %eax,%ebx
 39c:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3a2:	75 4c                	jne    3f0 <thread_create+0x70>
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);

  int childPid = clone(start_routine, arg1, arg2, stack);
 3a4:	50                   	push   %eax
 3a5:	ff 75 10             	push   0x10(%ebp)
 3a8:	ff 75 0c             	push   0xc(%ebp)
 3ab:	ff 75 08             	push   0x8(%ebp)
 3ae:	e8 d0 03 00 00       	call   783 <clone>
  if(childPid != -1)
 3b3:	83 c4 10             	add    $0x10,%esp
 3b6:	83 f8 ff             	cmp    $0xffffffff,%eax
 3b9:	74 45                	je     400 <thread_create+0x80>
  {
    for(int i = 0; i < SIZE; i++)
 3bb:	31 d2                	xor    %edx,%edx
 3bd:	eb 09                	jmp    3c8 <thread_create+0x48>
 3bf:	90                   	nop
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	83 fa 40             	cmp    $0x40,%edx
 3c6:	74 19                	je     3e1 <thread_create+0x61>
    {
      if(userStackAddr[i] == NULL)
 3c8:	8b 0c 95 40 11 00 00 	mov    0x1140(,%edx,4),%ecx
 3cf:	85 c9                	test   %ecx,%ecx
 3d1:	75 ed                	jne    3c0 <thread_create+0x40>
      {
        userStackAddr[i] = freeStack;
 3d3:	89 1c 95 40 11 00 00 	mov    %ebx,0x1140(,%edx,4)
        valueArray[i] = childPid;
 3da:	89 04 95 40 10 00 00 	mov    %eax,0x1040(,%edx,4)
  {
    free(freeStack);
  }

  return childPid;
}
 3e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e4:	c9                   	leave  
 3e5:	c3                   	ret    
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);
 3f0:	29 d0                	sub    %edx,%eax
 3f2:	05 00 10 00 00       	add    $0x1000,%eax
 3f7:	eb ab                	jmp    3a4 <thread_create+0x24>
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    free(freeStack);
 400:	83 ec 0c             	sub    $0xc,%esp
 403:	89 45 f4             	mov    %eax,-0xc(%ebp)
 406:	53                   	push   %ebx
 407:	e8 e4 05 00 00       	call   9f0 <free>
 40c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 40f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(freeStack);
 412:	83 c4 10             	add    $0x10,%esp
}
 415:	c9                   	leave  
 416:	c3                   	ret    
  if(freeStack == 0) return -1;
 417:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 41c:	eb c3                	jmp    3e1 <thread_create+0x61>
 41e:	66 90                	xchg   %ax,%ax

00000420 <thread_join>:

int 
thread_join()
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
  void *stack;
  int childPid = join(&stack);
 425:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 428:	83 ec 1c             	sub    $0x1c,%esp
  int childPid = join(&stack);
 42b:	50                   	push   %eax
 42c:	e8 5a 03 00 00       	call   78b <join>

  if(childPid != -1) {
 431:	83 c4 10             	add    $0x10,%esp
  int childPid = join(&stack);
 434:	89 c6                	mov    %eax,%esi
  if(childPid != -1) {
 436:	83 f8 ff             	cmp    $0xffffffff,%eax
 439:	74 46                	je     481 <thread_join+0x61>
    for(int i=0; i < SIZE; i++) {
 43b:	31 db                	xor    %ebx,%ebx
 43d:	eb 09                	jmp    448 <thread_join+0x28>
 43f:	90                   	nop
 440:	83 c3 01             	add    $0x1,%ebx
 443:	83 fb 40             	cmp    $0x40,%ebx
 446:	74 39                	je     481 <thread_join+0x61>
      if(valueArray[i] == childPid) {
 448:	39 34 9d 40 10 00 00 	cmp    %esi,0x1040(,%ebx,4)
 44f:	75 ef                	jne    440 <thread_join+0x20>
        free(userStackAddr[i]);
 451:	83 ec 0c             	sub    $0xc,%esp
 454:	ff 34 9d 40 11 00 00 	push   0x1140(,%ebx,4)
 45b:	e8 90 05 00 00       	call   9f0 <free>
        valueArray[i] = -1;
        userStackAddr[i] = NULL;
 460:	83 c4 10             	add    $0x10,%esp
        valueArray[i] = -1;
 463:	c7 04 9d 40 10 00 00 	movl   $0xffffffff,0x1040(,%ebx,4)
 46a:	ff ff ff ff 
        userStackAddr[i] = NULL;
 46e:	c7 04 9d 40 11 00 00 	movl   $0x0,0x1140(,%ebx,4)
 475:	00 00 00 00 
    for(int i=0; i < SIZE; i++) {
 479:	83 c3 01             	add    $0x1,%ebx
 47c:	83 fb 40             	cmp    $0x40,%ebx
 47f:	75 c7                	jne    448 <thread_join+0x28>
      }
    }
  }
  return childPid;
}
 481:	8d 65 f8             	lea    -0x8(%ebp),%esp
 484:	89 f0                	mov    %esi,%eax
 486:	5b                   	pop    %ebx
 487:	5e                   	pop    %esi
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    
 48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000490 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 490:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 491:	31 c0                	xor    %eax,%eax
{
 493:	89 e5                	mov    %esp,%ebp
 495:	53                   	push   %ebx
 496:	8b 4d 08             	mov    0x8(%ebp),%ecx
 499:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 4a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 4a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 4a7:	83 c0 01             	add    $0x1,%eax
 4aa:	84 d2                	test   %dl,%dl
 4ac:	75 f2                	jne    4a0 <strcpy+0x10>
    ;
  return os;
}
 4ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4b1:	89 c8                	mov    %ecx,%eax
 4b3:	c9                   	leave  
 4b4:	c3                   	ret    
 4b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	53                   	push   %ebx
 4c4:	8b 55 08             	mov    0x8(%ebp),%edx
 4c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 4ca:	0f b6 02             	movzbl (%edx),%eax
 4cd:	84 c0                	test   %al,%al
 4cf:	75 17                	jne    4e8 <strcmp+0x28>
 4d1:	eb 3a                	jmp    50d <strcmp+0x4d>
 4d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d7:	90                   	nop
 4d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 4dc:	83 c2 01             	add    $0x1,%edx
 4df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 4e2:	84 c0                	test   %al,%al
 4e4:	74 1a                	je     500 <strcmp+0x40>
    p++, q++;
 4e6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 4e8:	0f b6 19             	movzbl (%ecx),%ebx
 4eb:	38 c3                	cmp    %al,%bl
 4ed:	74 e9                	je     4d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 4ef:	29 d8                	sub    %ebx,%eax
}
 4f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4f4:	c9                   	leave  
 4f5:	c3                   	ret    
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 500:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 504:	31 c0                	xor    %eax,%eax
 506:	29 d8                	sub    %ebx,%eax
}
 508:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50b:	c9                   	leave  
 50c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 50d:	0f b6 19             	movzbl (%ecx),%ebx
 510:	31 c0                	xor    %eax,%eax
 512:	eb db                	jmp    4ef <strcmp+0x2f>
 514:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop

00000520 <strlen>:

uint
strlen(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 526:	80 3a 00             	cmpb   $0x0,(%edx)
 529:	74 15                	je     540 <strlen+0x20>
 52b:	31 c0                	xor    %eax,%eax
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	83 c0 01             	add    $0x1,%eax
 533:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 537:	89 c1                	mov    %eax,%ecx
 539:	75 f5                	jne    530 <strlen+0x10>
    ;
  return n;
}
 53b:	89 c8                	mov    %ecx,%eax
 53d:	5d                   	pop    %ebp
 53e:	c3                   	ret    
 53f:	90                   	nop
  for(n = 0; s[n]; n++)
 540:	31 c9                	xor    %ecx,%ecx
}
 542:	5d                   	pop    %ebp
 543:	89 c8                	mov    %ecx,%eax
 545:	c3                   	ret    
 546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi

00000550 <memset>:

void*
memset(void *dst, int c, uint n)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 557:	8b 4d 10             	mov    0x10(%ebp),%ecx
 55a:	8b 45 0c             	mov    0xc(%ebp),%eax
 55d:	89 d7                	mov    %edx,%edi
 55f:	fc                   	cld    
 560:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 562:	8b 7d fc             	mov    -0x4(%ebp),%edi
 565:	89 d0                	mov    %edx,%eax
 567:	c9                   	leave  
 568:	c3                   	ret    
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000570 <strchr>:

char*
strchr(const char *s, char c)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 57a:	0f b6 10             	movzbl (%eax),%edx
 57d:	84 d2                	test   %dl,%dl
 57f:	75 12                	jne    593 <strchr+0x23>
 581:	eb 1d                	jmp    5a0 <strchr+0x30>
 583:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 587:	90                   	nop
 588:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 58c:	83 c0 01             	add    $0x1,%eax
 58f:	84 d2                	test   %dl,%dl
 591:	74 0d                	je     5a0 <strchr+0x30>
    if(*s == c)
 593:	38 d1                	cmp    %dl,%cl
 595:	75 f1                	jne    588 <strchr+0x18>
      return (char*)s;
  return 0;
}
 597:	5d                   	pop    %ebp
 598:	c3                   	ret    
 599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 5a0:	31 c0                	xor    %eax,%eax
}
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    
 5a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <gets>:

char*
gets(char *buf, int max)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 5b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 5b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 5b9:	31 db                	xor    %ebx,%ebx
{
 5bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 5be:	eb 27                	jmp    5e7 <gets+0x37>
    cc = read(0, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	6a 01                	push   $0x1
 5c5:	57                   	push   %edi
 5c6:	6a 00                	push   $0x0
 5c8:	e8 2e 01 00 00       	call   6fb <read>
    if(cc < 1)
 5cd:	83 c4 10             	add    $0x10,%esp
 5d0:	85 c0                	test   %eax,%eax
 5d2:	7e 1d                	jle    5f1 <gets+0x41>
      break;
    buf[i++] = c;
 5d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5d8:	8b 55 08             	mov    0x8(%ebp),%edx
 5db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 5df:	3c 0a                	cmp    $0xa,%al
 5e1:	74 1d                	je     600 <gets+0x50>
 5e3:	3c 0d                	cmp    $0xd,%al
 5e5:	74 19                	je     600 <gets+0x50>
  for(i=0; i+1 < max; ){
 5e7:	89 de                	mov    %ebx,%esi
 5e9:	83 c3 01             	add    $0x1,%ebx
 5ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5ef:	7c cf                	jl     5c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 5f1:	8b 45 08             	mov    0x8(%ebp),%eax
 5f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 5f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    
  buf[i] = '\0';
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	89 de                	mov    %ebx,%esi
 605:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 609:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60c:	5b                   	pop    %ebx
 60d:	5e                   	pop    %esi
 60e:	5f                   	pop    %edi
 60f:	5d                   	pop    %ebp
 610:	c3                   	ret    
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <stat>:

int
stat(const char *n, struct stat *st)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	56                   	push   %esi
 624:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 625:	83 ec 08             	sub    $0x8,%esp
 628:	6a 00                	push   $0x0
 62a:	ff 75 08             	push   0x8(%ebp)
 62d:	e8 f1 00 00 00       	call   723 <open>
  if(fd < 0)
 632:	83 c4 10             	add    $0x10,%esp
 635:	85 c0                	test   %eax,%eax
 637:	78 27                	js     660 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 639:	83 ec 08             	sub    $0x8,%esp
 63c:	ff 75 0c             	push   0xc(%ebp)
 63f:	89 c3                	mov    %eax,%ebx
 641:	50                   	push   %eax
 642:	e8 f4 00 00 00       	call   73b <fstat>
  close(fd);
 647:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 64a:	89 c6                	mov    %eax,%esi
  close(fd);
 64c:	e8 ba 00 00 00       	call   70b <close>
  return r;
 651:	83 c4 10             	add    $0x10,%esp
}
 654:	8d 65 f8             	lea    -0x8(%ebp),%esp
 657:	89 f0                	mov    %esi,%eax
 659:	5b                   	pop    %ebx
 65a:	5e                   	pop    %esi
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret    
 65d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 660:	be ff ff ff ff       	mov    $0xffffffff,%esi
 665:	eb ed                	jmp    654 <stat+0x34>
 667:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66e:	66 90                	xchg   %ax,%ax

00000670 <atoi>:

int
atoi(const char *s)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	53                   	push   %ebx
 674:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 677:	0f be 02             	movsbl (%edx),%eax
 67a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 67d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 680:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 685:	77 1e                	ja     6a5 <atoi+0x35>
 687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 690:	83 c2 01             	add    $0x1,%edx
 693:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 696:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 69a:	0f be 02             	movsbl (%edx),%eax
 69d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6a0:	80 fb 09             	cmp    $0x9,%bl
 6a3:	76 eb                	jbe    690 <atoi+0x20>
  return n;
}
 6a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a8:	89 c8                	mov    %ecx,%eax
 6aa:	c9                   	leave  
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	8b 45 10             	mov    0x10(%ebp),%eax
 6b7:	8b 55 08             	mov    0x8(%ebp),%edx
 6ba:	56                   	push   %esi
 6bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6be:	85 c0                	test   %eax,%eax
 6c0:	7e 13                	jle    6d5 <memmove+0x25>
 6c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 6c4:	89 d7                	mov    %edx,%edi
 6c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 6d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 6d1:	39 f8                	cmp    %edi,%eax
 6d3:	75 fb                	jne    6d0 <memmove+0x20>
  return vdst;
}
 6d5:	5e                   	pop    %esi
 6d6:	89 d0                	mov    %edx,%eax
 6d8:	5f                   	pop    %edi
 6d9:	5d                   	pop    %ebp
 6da:	c3                   	ret    

000006db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6db:	b8 01 00 00 00       	mov    $0x1,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <exit>:
SYSCALL(exit)
 6e3:	b8 02 00 00 00       	mov    $0x2,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <wait>:
SYSCALL(wait)
 6eb:	b8 03 00 00 00       	mov    $0x3,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <pipe>:
SYSCALL(pipe)
 6f3:	b8 04 00 00 00       	mov    $0x4,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <read>:
SYSCALL(read)
 6fb:	b8 05 00 00 00       	mov    $0x5,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <write>:
SYSCALL(write)
 703:	b8 10 00 00 00       	mov    $0x10,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <close>:
SYSCALL(close)
 70b:	b8 15 00 00 00       	mov    $0x15,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <kill>:
SYSCALL(kill)
 713:	b8 06 00 00 00       	mov    $0x6,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <exec>:
SYSCALL(exec)
 71b:	b8 07 00 00 00       	mov    $0x7,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <open>:
SYSCALL(open)
 723:	b8 0f 00 00 00       	mov    $0xf,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <mknod>:
SYSCALL(mknod)
 72b:	b8 11 00 00 00       	mov    $0x11,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <unlink>:
SYSCALL(unlink)
 733:	b8 12 00 00 00       	mov    $0x12,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <fstat>:
SYSCALL(fstat)
 73b:	b8 08 00 00 00       	mov    $0x8,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <link>:
SYSCALL(link)
 743:	b8 13 00 00 00       	mov    $0x13,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <mkdir>:
SYSCALL(mkdir)
 74b:	b8 14 00 00 00       	mov    $0x14,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <chdir>:
SYSCALL(chdir)
 753:	b8 09 00 00 00       	mov    $0x9,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <dup>:
SYSCALL(dup)
 75b:	b8 0a 00 00 00       	mov    $0xa,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <getpid>:
SYSCALL(getpid)
 763:	b8 0b 00 00 00       	mov    $0xb,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <sbrk>:
SYSCALL(sbrk)
 76b:	b8 0c 00 00 00       	mov    $0xc,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <sleep>:
SYSCALL(sleep)
 773:	b8 0d 00 00 00       	mov    $0xd,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <uptime>:
SYSCALL(uptime)
 77b:	b8 0e 00 00 00       	mov    $0xe,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    

00000783 <clone>:
SYSCALL(clone)
 783:	b8 16 00 00 00       	mov    $0x16,%eax
 788:	cd 40                	int    $0x40
 78a:	c3                   	ret    

0000078b <join>:
 78b:	b8 17 00 00 00       	mov    $0x17,%eax
 790:	cd 40                	int    $0x40
 792:	c3                   	ret    
 793:	66 90                	xchg   %ax,%ax
 795:	66 90                	xchg   %ax,%ax
 797:	66 90                	xchg   %ax,%ax
 799:	66 90                	xchg   %ax,%ax
 79b:	66 90                	xchg   %ax,%ax
 79d:	66 90                	xchg   %ax,%ax
 79f:	90                   	nop

000007a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 3c             	sub    $0x3c,%esp
 7a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7ac:	89 d1                	mov    %edx,%ecx
{
 7ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 7b1:	85 d2                	test   %edx,%edx
 7b3:	0f 89 7f 00 00 00    	jns    838 <printint+0x98>
 7b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7bd:	74 79                	je     838 <printint+0x98>
    neg = 1;
 7bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 7c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 7c8:	31 db                	xor    %ebx,%ebx
 7ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7d0:	89 c8                	mov    %ecx,%eax
 7d2:	31 d2                	xor    %edx,%edx
 7d4:	89 cf                	mov    %ecx,%edi
 7d6:	f7 75 c4             	divl   -0x3c(%ebp)
 7d9:	0f b6 92 24 0c 00 00 	movzbl 0xc24(%edx),%edx
 7e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7e3:	89 d8                	mov    %ebx,%eax
 7e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 7e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 7eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 7ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7f1:	76 dd                	jbe    7d0 <printint+0x30>
  if(neg)
 7f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7f6:	85 c9                	test   %ecx,%ecx
 7f8:	74 0c                	je     806 <printint+0x66>
    buf[i++] = '-';
 7fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 801:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 806:	8b 7d b8             	mov    -0x48(%ebp),%edi
 809:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 80d:	eb 07                	jmp    816 <printint+0x76>
 80f:	90                   	nop
    putc(fd, buf[i]);
 810:	0f b6 13             	movzbl (%ebx),%edx
 813:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 816:	83 ec 04             	sub    $0x4,%esp
 819:	88 55 d7             	mov    %dl,-0x29(%ebp)
 81c:	6a 01                	push   $0x1
 81e:	56                   	push   %esi
 81f:	57                   	push   %edi
 820:	e8 de fe ff ff       	call   703 <write>
  while(--i >= 0)
 825:	83 c4 10             	add    $0x10,%esp
 828:	39 de                	cmp    %ebx,%esi
 82a:	75 e4                	jne    810 <printint+0x70>
}
 82c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 82f:	5b                   	pop    %ebx
 830:	5e                   	pop    %esi
 831:	5f                   	pop    %edi
 832:	5d                   	pop    %ebp
 833:	c3                   	ret    
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 838:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 83f:	eb 87                	jmp    7c8 <printint+0x28>
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 848:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop

00000850 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 859:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 85c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 85f:	0f b6 13             	movzbl (%ebx),%edx
 862:	84 d2                	test   %dl,%dl
 864:	74 6a                	je     8d0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 866:	8d 45 10             	lea    0x10(%ebp),%eax
 869:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 86c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 86f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 871:	89 45 d0             	mov    %eax,-0x30(%ebp)
 874:	eb 36                	jmp    8ac <printf+0x5c>
 876:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87d:	8d 76 00             	lea    0x0(%esi),%esi
 880:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 883:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 888:	83 f8 25             	cmp    $0x25,%eax
 88b:	74 15                	je     8a2 <printf+0x52>
  write(fd, &c, 1);
 88d:	83 ec 04             	sub    $0x4,%esp
 890:	88 55 e7             	mov    %dl,-0x19(%ebp)
 893:	6a 01                	push   $0x1
 895:	57                   	push   %edi
 896:	56                   	push   %esi
 897:	e8 67 fe ff ff       	call   703 <write>
 89c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 89f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 8a2:	0f b6 13             	movzbl (%ebx),%edx
 8a5:	83 c3 01             	add    $0x1,%ebx
 8a8:	84 d2                	test   %dl,%dl
 8aa:	74 24                	je     8d0 <printf+0x80>
    c = fmt[i] & 0xff;
 8ac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 8af:	85 c9                	test   %ecx,%ecx
 8b1:	74 cd                	je     880 <printf+0x30>
      }
    } else if(state == '%'){
 8b3:	83 f9 25             	cmp    $0x25,%ecx
 8b6:	75 ea                	jne    8a2 <printf+0x52>
      if(c == 'd'){
 8b8:	83 f8 25             	cmp    $0x25,%eax
 8bb:	0f 84 07 01 00 00    	je     9c8 <printf+0x178>
 8c1:	83 e8 63             	sub    $0x63,%eax
 8c4:	83 f8 15             	cmp    $0x15,%eax
 8c7:	77 17                	ja     8e0 <printf+0x90>
 8c9:	ff 24 85 cc 0b 00 00 	jmp    *0xbcc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d3:	5b                   	pop    %ebx
 8d4:	5e                   	pop    %esi
 8d5:	5f                   	pop    %edi
 8d6:	5d                   	pop    %ebp
 8d7:	c3                   	ret    
 8d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8df:	90                   	nop
  write(fd, &c, 1);
 8e0:	83 ec 04             	sub    $0x4,%esp
 8e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 8e6:	6a 01                	push   $0x1
 8e8:	57                   	push   %edi
 8e9:	56                   	push   %esi
 8ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8ee:	e8 10 fe ff ff       	call   703 <write>
        putc(fd, c);
 8f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 8f7:	83 c4 0c             	add    $0xc,%esp
 8fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 8fd:	6a 01                	push   $0x1
 8ff:	57                   	push   %edi
 900:	56                   	push   %esi
 901:	e8 fd fd ff ff       	call   703 <write>
        putc(fd, c);
 906:	83 c4 10             	add    $0x10,%esp
      state = 0;
 909:	31 c9                	xor    %ecx,%ecx
 90b:	eb 95                	jmp    8a2 <printf+0x52>
 90d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	b9 10 00 00 00       	mov    $0x10,%ecx
 918:	6a 00                	push   $0x0
 91a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 91d:	8b 10                	mov    (%eax),%edx
 91f:	89 f0                	mov    %esi,%eax
 921:	e8 7a fe ff ff       	call   7a0 <printint>
        ap++;
 926:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 92a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 92d:	31 c9                	xor    %ecx,%ecx
 92f:	e9 6e ff ff ff       	jmp    8a2 <printf+0x52>
 934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 938:	8b 45 d0             	mov    -0x30(%ebp),%eax
 93b:	8b 10                	mov    (%eax),%edx
        ap++;
 93d:	83 c0 04             	add    $0x4,%eax
 940:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 943:	85 d2                	test   %edx,%edx
 945:	0f 84 8d 00 00 00    	je     9d8 <printf+0x188>
        while(*s != 0){
 94b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 94e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 950:	84 c0                	test   %al,%al
 952:	0f 84 4a ff ff ff    	je     8a2 <printf+0x52>
 958:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 95b:	89 d3                	mov    %edx,%ebx
 95d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 960:	83 ec 04             	sub    $0x4,%esp
          s++;
 963:	83 c3 01             	add    $0x1,%ebx
 966:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 969:	6a 01                	push   $0x1
 96b:	57                   	push   %edi
 96c:	56                   	push   %esi
 96d:	e8 91 fd ff ff       	call   703 <write>
        while(*s != 0){
 972:	0f b6 03             	movzbl (%ebx),%eax
 975:	83 c4 10             	add    $0x10,%esp
 978:	84 c0                	test   %al,%al
 97a:	75 e4                	jne    960 <printf+0x110>
      state = 0;
 97c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 97f:	31 c9                	xor    %ecx,%ecx
 981:	e9 1c ff ff ff       	jmp    8a2 <printf+0x52>
 986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 990:	83 ec 0c             	sub    $0xc,%esp
 993:	b9 0a 00 00 00       	mov    $0xa,%ecx
 998:	6a 01                	push   $0x1
 99a:	e9 7b ff ff ff       	jmp    91a <printf+0xca>
 99f:	90                   	nop
        putc(fd, *ap);
 9a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 9a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 9a6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 9a8:	6a 01                	push   $0x1
 9aa:	57                   	push   %edi
 9ab:	56                   	push   %esi
        putc(fd, *ap);
 9ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9af:	e8 4f fd ff ff       	call   703 <write>
        ap++;
 9b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9bb:	31 c9                	xor    %ecx,%ecx
 9bd:	e9 e0 fe ff ff       	jmp    8a2 <printf+0x52>
 9c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 9c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 9cb:	83 ec 04             	sub    $0x4,%esp
 9ce:	e9 2a ff ff ff       	jmp    8fd <printf+0xad>
 9d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9d7:	90                   	nop
          s = "(null)";
 9d8:	ba c2 0b 00 00       	mov    $0xbc2,%edx
        while(*s != 0){
 9dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 9e0:	b8 28 00 00 00       	mov    $0x28,%eax
 9e5:	89 d3                	mov    %edx,%ebx
 9e7:	e9 74 ff ff ff       	jmp    960 <printf+0x110>
 9ec:	66 90                	xchg   %ax,%ax
 9ee:	66 90                	xchg   %ax,%ax

000009f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f1:	a1 40 12 00 00       	mov    0x1240,%eax
{
 9f6:	89 e5                	mov    %esp,%ebp
 9f8:	57                   	push   %edi
 9f9:	56                   	push   %esi
 9fa:	53                   	push   %ebx
 9fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a08:	89 c2                	mov    %eax,%edx
 a0a:	8b 00                	mov    (%eax),%eax
 a0c:	39 ca                	cmp    %ecx,%edx
 a0e:	73 30                	jae    a40 <free+0x50>
 a10:	39 c1                	cmp    %eax,%ecx
 a12:	72 04                	jb     a18 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a14:	39 c2                	cmp    %eax,%edx
 a16:	72 f0                	jb     a08 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a18:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a1e:	39 f8                	cmp    %edi,%eax
 a20:	74 30                	je     a52 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a22:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a25:	8b 42 04             	mov    0x4(%edx),%eax
 a28:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a2b:	39 f1                	cmp    %esi,%ecx
 a2d:	74 3a                	je     a69 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a2f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a31:	5b                   	pop    %ebx
  freep = p;
 a32:	89 15 40 12 00 00    	mov    %edx,0x1240
}
 a38:	5e                   	pop    %esi
 a39:	5f                   	pop    %edi
 a3a:	5d                   	pop    %ebp
 a3b:	c3                   	ret    
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a40:	39 c2                	cmp    %eax,%edx
 a42:	72 c4                	jb     a08 <free+0x18>
 a44:	39 c1                	cmp    %eax,%ecx
 a46:	73 c0                	jae    a08 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a48:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a4b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a4e:	39 f8                	cmp    %edi,%eax
 a50:	75 d0                	jne    a22 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a52:	03 70 04             	add    0x4(%eax),%esi
 a55:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a58:	8b 02                	mov    (%edx),%eax
 a5a:	8b 00                	mov    (%eax),%eax
 a5c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a5f:	8b 42 04             	mov    0x4(%edx),%eax
 a62:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a65:	39 f1                	cmp    %esi,%ecx
 a67:	75 c6                	jne    a2f <free+0x3f>
    p->s.size += bp->s.size;
 a69:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a6c:	89 15 40 12 00 00    	mov    %edx,0x1240
    p->s.size += bp->s.size;
 a72:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a75:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a78:	89 0a                	mov    %ecx,(%edx)
}
 a7a:	5b                   	pop    %ebx
 a7b:	5e                   	pop    %esi
 a7c:	5f                   	pop    %edi
 a7d:	5d                   	pop    %ebp
 a7e:	c3                   	ret    
 a7f:	90                   	nop

00000a80 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	57                   	push   %edi
 a84:	56                   	push   %esi
 a85:	53                   	push   %ebx
 a86:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a89:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a8c:	8b 3d 40 12 00 00    	mov    0x1240,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a92:	8d 70 07             	lea    0x7(%eax),%esi
 a95:	c1 ee 03             	shr    $0x3,%esi
 a98:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a9b:	85 ff                	test   %edi,%edi
 a9d:	0f 84 9d 00 00 00    	je     b40 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 aa5:	8b 4a 04             	mov    0x4(%edx),%ecx
 aa8:	39 f1                	cmp    %esi,%ecx
 aaa:	73 6a                	jae    b16 <malloc+0x96>
 aac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 ab1:	39 de                	cmp    %ebx,%esi
 ab3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 ab6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 abd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 ac0:	eb 17                	jmp    ad9 <malloc+0x59>
 ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 aca:	8b 48 04             	mov    0x4(%eax),%ecx
 acd:	39 f1                	cmp    %esi,%ecx
 acf:	73 4f                	jae    b20 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ad1:	8b 3d 40 12 00 00    	mov    0x1240,%edi
 ad7:	89 c2                	mov    %eax,%edx
 ad9:	39 d7                	cmp    %edx,%edi
 adb:	75 eb                	jne    ac8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 add:	83 ec 0c             	sub    $0xc,%esp
 ae0:	ff 75 e4             	push   -0x1c(%ebp)
 ae3:	e8 83 fc ff ff       	call   76b <sbrk>
  if(p == (char*)-1)
 ae8:	83 c4 10             	add    $0x10,%esp
 aeb:	83 f8 ff             	cmp    $0xffffffff,%eax
 aee:	74 1c                	je     b0c <malloc+0x8c>
  hp->s.size = nu;
 af0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 af3:	83 ec 0c             	sub    $0xc,%esp
 af6:	83 c0 08             	add    $0x8,%eax
 af9:	50                   	push   %eax
 afa:	e8 f1 fe ff ff       	call   9f0 <free>
  return freep;
 aff:	8b 15 40 12 00 00    	mov    0x1240,%edx
      if((p = morecore(nunits)) == 0)
 b05:	83 c4 10             	add    $0x10,%esp
 b08:	85 d2                	test   %edx,%edx
 b0a:	75 bc                	jne    ac8 <malloc+0x48>
        return 0;
  }
}
 b0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b0f:	31 c0                	xor    %eax,%eax
}
 b11:	5b                   	pop    %ebx
 b12:	5e                   	pop    %esi
 b13:	5f                   	pop    %edi
 b14:	5d                   	pop    %ebp
 b15:	c3                   	ret    
    if(p->s.size >= nunits){
 b16:	89 d0                	mov    %edx,%eax
 b18:	89 fa                	mov    %edi,%edx
 b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b20:	39 ce                	cmp    %ecx,%esi
 b22:	74 4c                	je     b70 <malloc+0xf0>
        p->s.size -= nunits;
 b24:	29 f1                	sub    %esi,%ecx
 b26:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b29:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b2c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 b2f:	89 15 40 12 00 00    	mov    %edx,0x1240
}
 b35:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b38:	83 c0 08             	add    $0x8,%eax
}
 b3b:	5b                   	pop    %ebx
 b3c:	5e                   	pop    %esi
 b3d:	5f                   	pop    %edi
 b3e:	5d                   	pop    %ebp
 b3f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 b40:	c7 05 40 12 00 00 44 	movl   $0x1244,0x1240
 b47:	12 00 00 
    base.s.size = 0;
 b4a:	bf 44 12 00 00       	mov    $0x1244,%edi
    base.s.ptr = freep = prevp = &base;
 b4f:	c7 05 44 12 00 00 44 	movl   $0x1244,0x1244
 b56:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b59:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 b5b:	c7 05 48 12 00 00 00 	movl   $0x0,0x1248
 b62:	00 00 00 
    if(p->s.size >= nunits){
 b65:	e9 42 ff ff ff       	jmp    aac <malloc+0x2c>
 b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b70:	8b 08                	mov    (%eax),%ecx
 b72:	89 0a                	mov    %ecx,(%edx)
 b74:	eb b9                	jmp    b2f <malloc+0xaf>
