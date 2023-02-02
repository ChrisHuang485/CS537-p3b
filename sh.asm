
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 91 00 00 00    	jg     b2 <main+0xb2>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 a9 14 00 00       	push   $0x14a9
      2b:	e8 83 0f 00 00       	call   fb3 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 02 1c 00 00 20 	cmpb   $0x20,0x1c02
      47:	0f 84 88 00 00 00    	je     d5 <main+0xd5>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 16 0f 00 00       	call   f6b <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 5e                	je     c0 <main+0xc0>
    wait();
      62:	e8 14 0f 00 00       	call   f7b <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 08 14 00 00       	push   $0x1408
      6f:	6a 02                	push   $0x2
      71:	e8 6a 10 00 00       	call   10e0 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 00 1c 00 00       	push   $0x1c00
      82:	e8 59 0d 00 00       	call   de0 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 00 1c 00 00       	push   $0x1c00
      90:	e8 ab 0d 00 00       	call   e40 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 00 1c 00 00 	movzbl 0x1c00,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 77                	je     11a <main+0x11a>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d 01 1c 00 00 64 	cmpb   $0x64,0x1c01
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
      close(fd);
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	50                   	push   %eax
      b6:	e8 e0 0e 00 00       	call   f9b <close>
      break;
      bb:	83 c4 10             	add    $0x10,%esp
      be:	eb a7                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c0:	83 ec 0c             	sub    $0xc,%esp
      c3:	68 00 1c 00 00       	push   $0x1c00
      c8:	e8 93 0a 00 00       	call   b60 <parsecmd>
      cd:	89 04 24             	mov    %eax,(%esp)
      d0:	e8 db 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      d5:	83 ec 0c             	sub    $0xc,%esp
      d8:	68 00 1c 00 00       	push   $0x1c00
      dd:	e8 ce 0c 00 00       	call   db0 <strlen>
      if(chdir(buf+3) < 0)
      e2:	c7 04 24 03 1c 00 00 	movl   $0x1c03,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      e9:	c6 80 ff 1b 00 00 00 	movb   $0x0,0x1bff(%eax)
      if(chdir(buf+3) < 0)
      f0:	e8 ee 0e 00 00       	call   fe3 <chdir>
      f5:	83 c4 10             	add    $0x10,%esp
      f8:	85 c0                	test   %eax,%eax
      fa:	0f 89 67 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     100:	51                   	push   %ecx
     101:	68 03 1c 00 00       	push   $0x1c03
     106:	68 b1 14 00 00       	push   $0x14b1
     10b:	6a 02                	push   $0x2
     10d:	e8 ce 0f 00 00       	call   10e0 <printf>
     112:	83 c4 10             	add    $0x10,%esp
     115:	e9 4d ff ff ff       	jmp    67 <main+0x67>
  exit();
     11a:	e8 54 0e 00 00       	call   f73 <exit>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 0b 14 00 00       	push   $0x140b
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 75 0c             	mov    0xc(%ebp),%esi
     138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 08 14 00 00       	push   $0x1408
     143:	6a 02                	push   $0x2
     145:	e8 96 0f 00 00       	call   10e0 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 8a 0c 00 00       	call   de0 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 e1 0c 00 00       	call   e40 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret    
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 a5 14 00 00       	push   $0x14a5
     17e:	6a 02                	push   $0x2
     180:	e8 5b 0f 00 00       	call   10e0 <printf>
  exit();
     185:	e8 e9 0d 00 00       	call   f73 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 d0 0d 00 00       	call   f6b <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 0b 14 00 00       	push   $0x140b
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 42                	je     200 <runcmd+0x50>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e3 00 00 00    	ja     2aa <runcmd+0xfa>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 c0 14 00 00 	jmp    *0x14c0(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 29                	je     200 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 c8 0d 00 00       	call   fab <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	push   0x4(%ebx)
     1e9:	68 17 14 00 00       	push   $0x1417
     1ee:	6a 02                	push   $0x2
     1f0:	e8 eb 0e 00 00       	call   10e0 <printf>
    break;
     1f5:	83 c4 10             	add    $0x10,%esp
     1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ff:	90                   	nop
    exit();
     200:	e8 6e 0d 00 00       	call   f73 <exit>
    if(fork1() == 0)
     205:	e8 86 ff ff ff       	call   190 <fork1>
     20a:	85 c0                	test   %eax,%eax
     20c:	75 f2                	jne    200 <runcmd+0x50>
     20e:	e9 8c 00 00 00       	jmp    29f <runcmd+0xef>
    if(pipe(p) < 0)
     213:	83 ec 0c             	sub    $0xc,%esp
     216:	8d 45 f0             	lea    -0x10(%ebp),%eax
     219:	50                   	push   %eax
     21a:	e8 64 0d 00 00       	call   f83 <pipe>
     21f:	83 c4 10             	add    $0x10,%esp
     222:	85 c0                	test   %eax,%eax
     224:	0f 88 a2 00 00 00    	js     2cc <runcmd+0x11c>
    if(fork1() == 0){
     22a:	e8 61 ff ff ff       	call   190 <fork1>
     22f:	85 c0                	test   %eax,%eax
     231:	0f 84 a2 00 00 00    	je     2d9 <runcmd+0x129>
    if(fork1() == 0){
     237:	e8 54 ff ff ff       	call   190 <fork1>
     23c:	85 c0                	test   %eax,%eax
     23e:	0f 84 c3 00 00 00    	je     307 <runcmd+0x157>
    close(p[0]);
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	ff 75 f0             	push   -0x10(%ebp)
     24a:	e8 4c 0d 00 00       	call   f9b <close>
    close(p[1]);
     24f:	58                   	pop    %eax
     250:	ff 75 f4             	push   -0xc(%ebp)
     253:	e8 43 0d 00 00       	call   f9b <close>
    wait();
     258:	e8 1e 0d 00 00       	call   f7b <wait>
    wait();
     25d:	e8 19 0d 00 00       	call   f7b <wait>
    break;
     262:	83 c4 10             	add    $0x10,%esp
     265:	eb 99                	jmp    200 <runcmd+0x50>
    if(fork1() == 0)
     267:	e8 24 ff ff ff       	call   190 <fork1>
     26c:	85 c0                	test   %eax,%eax
     26e:	74 2f                	je     29f <runcmd+0xef>
    wait();
     270:	e8 06 0d 00 00       	call   f7b <wait>
    runcmd(lcmd->right);
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	ff 73 08             	push   0x8(%ebx)
     27b:	e8 30 ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     280:	83 ec 0c             	sub    $0xc,%esp
     283:	ff 73 14             	push   0x14(%ebx)
     286:	e8 10 0d 00 00       	call   f9b <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     28b:	58                   	pop    %eax
     28c:	5a                   	pop    %edx
     28d:	ff 73 10             	push   0x10(%ebx)
     290:	ff 73 08             	push   0x8(%ebx)
     293:	e8 1b 0d 00 00       	call   fb3 <open>
     298:	83 c4 10             	add    $0x10,%esp
     29b:	85 c0                	test   %eax,%eax
     29d:	78 18                	js     2b7 <runcmd+0x107>
      runcmd(bcmd->cmd);
     29f:	83 ec 0c             	sub    $0xc,%esp
     2a2:	ff 73 04             	push   0x4(%ebx)
     2a5:	e8 06 ff ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2aa:	83 ec 0c             	sub    $0xc,%esp
     2ad:	68 10 14 00 00       	push   $0x1410
     2b2:	e8 b9 fe ff ff       	call   170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2b7:	51                   	push   %ecx
     2b8:	ff 73 08             	push   0x8(%ebx)
     2bb:	68 27 14 00 00       	push   $0x1427
     2c0:	6a 02                	push   $0x2
     2c2:	e8 19 0e 00 00       	call   10e0 <printf>
      exit();
     2c7:	e8 a7 0c 00 00       	call   f73 <exit>
      panic("pipe");
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	68 37 14 00 00       	push   $0x1437
     2d4:	e8 97 fe ff ff       	call   170 <panic>
      close(1);
     2d9:	83 ec 0c             	sub    $0xc,%esp
     2dc:	6a 01                	push   $0x1
     2de:	e8 b8 0c 00 00       	call   f9b <close>
      dup(p[1]);
     2e3:	58                   	pop    %eax
     2e4:	ff 75 f4             	push   -0xc(%ebp)
     2e7:	e8 ff 0c 00 00       	call   feb <dup>
      close(p[0]);
     2ec:	58                   	pop    %eax
     2ed:	ff 75 f0             	push   -0x10(%ebp)
     2f0:	e8 a6 0c 00 00       	call   f9b <close>
      close(p[1]);
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f4             	push   -0xc(%ebp)
     2f9:	e8 9d 0c 00 00       	call   f9b <close>
      runcmd(pcmd->left);
     2fe:	5a                   	pop    %edx
     2ff:	ff 73 04             	push   0x4(%ebx)
     302:	e8 a9 fe ff ff       	call   1b0 <runcmd>
      close(0);
     307:	83 ec 0c             	sub    $0xc,%esp
     30a:	6a 00                	push   $0x0
     30c:	e8 8a 0c 00 00       	call   f9b <close>
      dup(p[0]);
     311:	5a                   	pop    %edx
     312:	ff 75 f0             	push   -0x10(%ebp)
     315:	e8 d1 0c 00 00       	call   feb <dup>
      close(p[0]);
     31a:	59                   	pop    %ecx
     31b:	ff 75 f0             	push   -0x10(%ebp)
     31e:	e8 78 0c 00 00       	call   f9b <close>
      close(p[1]);
     323:	58                   	pop    %eax
     324:	ff 75 f4             	push   -0xc(%ebp)
     327:	e8 6f 0c 00 00       	call   f9b <close>
      runcmd(pcmd->right);
     32c:	58                   	pop    %eax
     32d:	ff 73 08             	push   0x8(%ebx)
     330:	e8 7b fe ff ff       	call   1b0 <runcmd>
     335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 54                	push   $0x54
     349:	e8 c2 0f 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 83 0a 00 00       	call   de0 <memset>
  cmd->type = EXEC;
     35d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     363:	89 d8                	mov    %ebx,%eax
     365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     368:	c9                   	leave  
     369:	c3                   	ret    
     36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     377:	6a 18                	push   $0x18
     379:	e8 92 0f 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     37e:	83 c4 0c             	add    $0xc,%esp
     381:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	6a 00                	push   $0x0
     387:	50                   	push   %eax
     388:	e8 53 0a 00 00       	call   de0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     390:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     396:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     39f:	8b 45 10             	mov    0x10(%ebp),%eax
     3a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3a5:	8b 45 14             	mov    0x14(%ebp),%eax
     3a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3ab:	8b 45 18             	mov    0x18(%ebp),%eax
     3ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3b1:	89 d8                	mov    %ebx,%eax
     3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b6:	c9                   	leave  
     3b7:	c3                   	ret    
     3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bf:	90                   	nop

000003c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 0c                	push   $0xc
     3c9:	e8 42 0f 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 03 0a 00 00       	call   de0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ef:	89 d8                	mov    %ebx,%eax
     3f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f4:	c9                   	leave  
     3f5:	c3                   	ret    
     3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 02 0f 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
     411:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     413:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 c3 09 00 00       	call   de0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     420:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 08                	push   $0x8
     449:	e8 c2 0e 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
     451:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     453:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 83 09 00 00       	call   de0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     460:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     469:	89 d8                	mov    %ebx,%eax
     46b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     46e:	c9                   	leave  
     46f:	c3                   	ret    

00000470 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	57                   	push   %edi
     474:	56                   	push   %esi
     475:	53                   	push   %ebx
     476:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     479:	8b 45 08             	mov    0x8(%ebp),%eax
{
     47c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     47f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     482:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     484:	39 df                	cmp    %ebx,%edi
     486:	72 0f                	jb     497 <gettoken+0x27>
     488:	eb 25                	jmp    4af <gettoken+0x3f>
     48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     490:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     493:	39 fb                	cmp    %edi,%ebx
     495:	74 18                	je     4af <gettoken+0x3f>
     497:	0f be 07             	movsbl (%edi),%eax
     49a:	83 ec 08             	sub    $0x8,%esp
     49d:	50                   	push   %eax
     49e:	68 e4 1b 00 00       	push   $0x1be4
     4a3:	e8 58 09 00 00       	call   e00 <strchr>
     4a8:	83 c4 10             	add    $0x10,%esp
     4ab:	85 c0                	test   %eax,%eax
     4ad:	75 e1                	jne    490 <gettoken+0x20>
  if(q)
     4af:	85 f6                	test   %esi,%esi
     4b1:	74 02                	je     4b5 <gettoken+0x45>
    *q = s;
     4b3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4b5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     4b8:	3c 3c                	cmp    $0x3c,%al
     4ba:	0f 8f d0 00 00 00    	jg     590 <gettoken+0x120>
     4c0:	3c 3a                	cmp    $0x3a,%al
     4c2:	0f 8f b4 00 00 00    	jg     57c <gettoken+0x10c>
     4c8:	84 c0                	test   %al,%al
     4ca:	75 44                	jne    510 <gettoken+0xa0>
     4cc:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ce:	8b 55 14             	mov    0x14(%ebp),%edx
     4d1:	85 d2                	test   %edx,%edx
     4d3:	74 05                	je     4da <gettoken+0x6a>
    *eq = s;
     4d5:	8b 45 14             	mov    0x14(%ebp),%eax
     4d8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4da:	39 df                	cmp    %ebx,%edi
     4dc:	72 09                	jb     4e7 <gettoken+0x77>
     4de:	eb 1f                	jmp    4ff <gettoken+0x8f>
    s++;
     4e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4e3:	39 fb                	cmp    %edi,%ebx
     4e5:	74 18                	je     4ff <gettoken+0x8f>
     4e7:	0f be 07             	movsbl (%edi),%eax
     4ea:	83 ec 08             	sub    $0x8,%esp
     4ed:	50                   	push   %eax
     4ee:	68 e4 1b 00 00       	push   $0x1be4
     4f3:	e8 08 09 00 00       	call   e00 <strchr>
     4f8:	83 c4 10             	add    $0x10,%esp
     4fb:	85 c0                	test   %eax,%eax
     4fd:	75 e1                	jne    4e0 <gettoken+0x70>
  *ps = s;
     4ff:	8b 45 08             	mov    0x8(%ebp),%eax
     502:	89 38                	mov    %edi,(%eax)
  return ret;
}
     504:	8d 65 f4             	lea    -0xc(%ebp),%esp
     507:	89 f0                	mov    %esi,%eax
     509:	5b                   	pop    %ebx
     50a:	5e                   	pop    %esi
     50b:	5f                   	pop    %edi
     50c:	5d                   	pop    %ebp
     50d:	c3                   	ret    
     50e:	66 90                	xchg   %ax,%ax
  switch(*s){
     510:	79 5e                	jns    570 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     512:	39 fb                	cmp    %edi,%ebx
     514:	77 34                	ja     54a <gettoken+0xda>
  if(eq)
     516:	8b 45 14             	mov    0x14(%ebp),%eax
     519:	be 61 00 00 00       	mov    $0x61,%esi
     51e:	85 c0                	test   %eax,%eax
     520:	75 b3                	jne    4d5 <gettoken+0x65>
     522:	eb db                	jmp    4ff <gettoken+0x8f>
     524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     528:	0f be 07             	movsbl (%edi),%eax
     52b:	83 ec 08             	sub    $0x8,%esp
     52e:	50                   	push   %eax
     52f:	68 dc 1b 00 00       	push   $0x1bdc
     534:	e8 c7 08 00 00       	call   e00 <strchr>
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	75 22                	jne    562 <gettoken+0xf2>
      s++;
     540:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     543:	39 fb                	cmp    %edi,%ebx
     545:	74 cf                	je     516 <gettoken+0xa6>
     547:	0f b6 07             	movzbl (%edi),%eax
     54a:	83 ec 08             	sub    $0x8,%esp
     54d:	0f be f0             	movsbl %al,%esi
     550:	56                   	push   %esi
     551:	68 e4 1b 00 00       	push   $0x1be4
     556:	e8 a5 08 00 00       	call   e00 <strchr>
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	85 c0                	test   %eax,%eax
     560:	74 c6                	je     528 <gettoken+0xb8>
    ret = 'a';
     562:	be 61 00 00 00       	mov    $0x61,%esi
     567:	e9 62 ff ff ff       	jmp    4ce <gettoken+0x5e>
     56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     570:	3c 26                	cmp    $0x26,%al
     572:	74 08                	je     57c <gettoken+0x10c>
     574:	8d 48 d8             	lea    -0x28(%eax),%ecx
     577:	80 f9 01             	cmp    $0x1,%cl
     57a:	77 96                	ja     512 <gettoken+0xa2>
  ret = *s;
     57c:	0f be f0             	movsbl %al,%esi
    s++;
     57f:	83 c7 01             	add    $0x1,%edi
    break;
     582:	e9 47 ff ff ff       	jmp    4ce <gettoken+0x5e>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
  switch(*s){
     590:	3c 3e                	cmp    $0x3e,%al
     592:	75 1c                	jne    5b0 <gettoken+0x140>
    if(*s == '>'){
     594:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
     598:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
     59b:	74 1c                	je     5b9 <gettoken+0x149>
    s++;
     59d:	89 c7                	mov    %eax,%edi
     59f:	be 3e 00 00 00       	mov    $0x3e,%esi
     5a4:	e9 25 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5b0:	3c 7c                	cmp    $0x7c,%al
     5b2:	74 c8                	je     57c <gettoken+0x10c>
     5b4:	e9 59 ff ff ff       	jmp    512 <gettoken+0xa2>
      s++;
     5b9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     5bc:	be 2b 00 00 00       	mov    $0x2b,%esi
     5c1:	e9 08 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	83 ec 0c             	sub    $0xc,%esp
     5d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5e1:	39 f3                	cmp    %esi,%ebx
     5e3:	72 12                	jb     5f7 <peek+0x27>
     5e5:	eb 28                	jmp    60f <peek+0x3f>
     5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ee:	66 90                	xchg   %ax,%ax
    s++;
     5f0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5f3:	39 de                	cmp    %ebx,%esi
     5f5:	74 18                	je     60f <peek+0x3f>
     5f7:	0f be 03             	movsbl (%ebx),%eax
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	50                   	push   %eax
     5fe:	68 e4 1b 00 00       	push   $0x1be4
     603:	e8 f8 07 00 00       	call   e00 <strchr>
     608:	83 c4 10             	add    $0x10,%esp
     60b:	85 c0                	test   %eax,%eax
     60d:	75 e1                	jne    5f0 <peek+0x20>
  *ps = s;
     60f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     611:	0f be 03             	movsbl (%ebx),%eax
     614:	31 d2                	xor    %edx,%edx
     616:	84 c0                	test   %al,%al
     618:	75 0e                	jne    628 <peek+0x58>
}
     61a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61d:	89 d0                	mov    %edx,%eax
     61f:	5b                   	pop    %ebx
     620:	5e                   	pop    %esi
     621:	5f                   	pop    %edi
     622:	5d                   	pop    %ebp
     623:	c3                   	ret    
     624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     628:	83 ec 08             	sub    $0x8,%esp
     62b:	50                   	push   %eax
     62c:	ff 75 10             	push   0x10(%ebp)
     62f:	e8 cc 07 00 00       	call   e00 <strchr>
     634:	83 c4 10             	add    $0x10,%esp
     637:	31 d2                	xor    %edx,%edx
     639:	85 c0                	test   %eax,%eax
     63b:	0f 95 c2             	setne  %dl
}
     63e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     641:	5b                   	pop    %ebx
     642:	89 d0                	mov    %edx,%eax
     644:	5e                   	pop    %esi
     645:	5f                   	pop    %edi
     646:	5d                   	pop    %ebp
     647:	c3                   	ret    
     648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     64f:	90                   	nop

00000650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 2c             	sub    $0x2c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     65f:	90                   	nop
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 59 14 00 00       	push   $0x1459
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 61 ff ff ff       	call   5d0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	0f 84 f6 00 00 00    	je     770 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     67a:	6a 00                	push   $0x0
     67c:	6a 00                	push   $0x0
     67e:	53                   	push   %ebx
     67f:	56                   	push   %esi
     680:	e8 eb fd ff ff       	call   470 <gettoken>
     685:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68e:	50                   	push   %eax
     68f:	53                   	push   %ebx
     690:	56                   	push   %esi
     691:	e8 da fd ff ff       	call   470 <gettoken>
     696:	83 c4 20             	add    $0x20,%esp
     699:	83 f8 61             	cmp    $0x61,%eax
     69c:	0f 85 d9 00 00 00    	jne    77b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6a2:	83 ff 3c             	cmp    $0x3c,%edi
     6a5:	74 69                	je     710 <parseredirs+0xc0>
     6a7:	83 ff 3e             	cmp    $0x3e,%edi
     6aa:	74 05                	je     6b1 <parseredirs+0x61>
     6ac:	83 ff 2b             	cmp    $0x2b,%edi
     6af:	75 af                	jne    660 <parseredirs+0x10>
  cmd = malloc(sizeof(*cmd));
     6b1:	83 ec 0c             	sub    $0xc,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6ba:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6bc:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bf:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6c2:	e8 49 0c 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6c7:	83 c4 0c             	add    $0xc,%esp
     6ca:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6cc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6ce:	6a 00                	push   $0x0
     6d0:	50                   	push   %eax
     6d1:	e8 0a 07 00 00       	call   de0 <memset>
  cmd->type = REDIR;
     6d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6df:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6e2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6e8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6f5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6ff:	89 7d 08             	mov    %edi,0x8(%ebp)
     702:	e9 59 ff ff ff       	jmp    660 <parseredirs+0x10>
     707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70e:	66 90                	xchg   %ax,%ax
  cmd = malloc(sizeof(*cmd));
     710:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     713:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     716:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     719:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     71b:	89 55 d0             	mov    %edx,-0x30(%ebp)
     71e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     721:	e8 ea 0b 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     726:	83 c4 0c             	add    $0xc,%esp
     729:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     72b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     72d:	6a 00                	push   $0x0
     72f:	50                   	push   %eax
     730:	e8 ab 06 00 00       	call   de0 <memset>
  cmd->cmd = subcmd;
     735:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     73b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     73e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     747:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     74a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     74d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     750:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     753:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     75a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     761:	e9 fa fe ff ff       	jmp    660 <parseredirs+0x10>
     766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     770:	8b 45 08             	mov    0x8(%ebp),%eax
     773:	8d 65 f4             	lea    -0xc(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5f                   	pop    %edi
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret    
      panic("missing file for redirection");
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	68 3c 14 00 00       	push   $0x143c
     783:	e8 e8 f9 ff ff       	call   170 <panic>
     788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     78f:	90                   	nop

00000790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 30             	sub    $0x30,%esp
     799:	8b 75 08             	mov    0x8(%ebp),%esi
     79c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     79f:	68 5c 14 00 00       	push   $0x145c
     7a4:	57                   	push   %edi
     7a5:	56                   	push   %esi
     7a6:	e8 25 fe ff ff       	call   5d0 <peek>
     7ab:	83 c4 10             	add    $0x10,%esp
     7ae:	85 c0                	test   %eax,%eax
     7b0:	0f 85 aa 00 00 00    	jne    860 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7b6:	83 ec 0c             	sub    $0xc,%esp
     7b9:	89 c3                	mov    %eax,%ebx
     7bb:	6a 54                	push   $0x54
     7bd:	e8 4e 0b 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7c2:	83 c4 0c             	add    $0xc,%esp
     7c5:	6a 54                	push   $0x54
     7c7:	6a 00                	push   $0x0
     7c9:	50                   	push   %eax
     7ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7cd:	e8 0e 06 00 00       	call   de0 <memset>
  cmd->type = EXEC;
     7d2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7d5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7de:	57                   	push   %edi
     7df:	56                   	push   %esi
     7e0:	50                   	push   %eax
     7e1:	e8 6a fe ff ff       	call   650 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7e6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7ec:	eb 15                	jmp    803 <parseexec+0x73>
     7ee:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7f0:	83 ec 04             	sub    $0x4,%esp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	ff 75 d4             	push   -0x2c(%ebp)
     7f8:	e8 53 fe ff ff       	call   650 <parseredirs>
     7fd:	83 c4 10             	add    $0x10,%esp
     800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     803:	83 ec 04             	sub    $0x4,%esp
     806:	68 73 14 00 00       	push   $0x1473
     80b:	57                   	push   %edi
     80c:	56                   	push   %esi
     80d:	e8 be fd ff ff       	call   5d0 <peek>
     812:	83 c4 10             	add    $0x10,%esp
     815:	85 c0                	test   %eax,%eax
     817:	75 5f                	jne    878 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     819:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     81c:	50                   	push   %eax
     81d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     820:	50                   	push   %eax
     821:	57                   	push   %edi
     822:	56                   	push   %esi
     823:	e8 48 fc ff ff       	call   470 <gettoken>
     828:	83 c4 10             	add    $0x10,%esp
     82b:	85 c0                	test   %eax,%eax
     82d:	74 49                	je     878 <parseexec+0xe8>
    if(tok != 'a')
     82f:	83 f8 61             	cmp    $0x61,%eax
     832:	75 62                	jne    896 <parseexec+0x106>
    cmd->argv[argc] = q;
     834:	8b 45 e0             	mov    -0x20(%ebp),%eax
     837:	8b 55 d0             	mov    -0x30(%ebp),%edx
     83a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     841:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     845:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     848:	83 fb 0a             	cmp    $0xa,%ebx
     84b:	75 a3                	jne    7f0 <parseexec+0x60>
      panic("too many args");
     84d:	83 ec 0c             	sub    $0xc,%esp
     850:	68 65 14 00 00       	push   $0x1465
     855:	e8 16 f9 ff ff       	call   170 <panic>
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     860:	89 7d 0c             	mov    %edi,0xc(%ebp)
     863:	89 75 08             	mov    %esi,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     866:	8d 65 f4             	lea    -0xc(%ebp),%esp
     869:	5b                   	pop    %ebx
     86a:	5e                   	pop    %esi
     86b:	5f                   	pop    %edi
     86c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     86d:	e9 ae 01 00 00       	jmp    a20 <parseblock>
     872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     878:	8b 45 d0             	mov    -0x30(%ebp),%eax
     87b:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     882:	00 
  cmd->eargv[argc] = 0;
     883:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     88a:	00 
}
     88b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	5b                   	pop    %ebx
     892:	5e                   	pop    %esi
     893:	5f                   	pop    %edi
     894:	5d                   	pop    %ebp
     895:	c3                   	ret    
      panic("syntax");
     896:	83 ec 0c             	sub    $0xc,%esp
     899:	68 5e 14 00 00       	push   $0x145e
     89e:	e8 cd f8 ff ff       	call   170 <panic>
     8a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008b0 <parsepipe>:
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 14             	sub    $0x14,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
     8bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8bf:	57                   	push   %edi
     8c0:	56                   	push   %esi
     8c1:	e8 ca fe ff ff       	call   790 <parseexec>
  if(peek(ps, es, "|")){
     8c6:	83 c4 0c             	add    $0xc,%esp
     8c9:	68 78 14 00 00       	push   $0x1478
  cmd = parseexec(ps, es);
     8ce:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8d0:	57                   	push   %edi
     8d1:	56                   	push   %esi
     8d2:	e8 f9 fc ff ff       	call   5d0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 12                	jne    8f0 <parsepipe+0x40>
}
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	89 d8                	mov    %ebx,%eax
     8e3:	5b                   	pop    %ebx
     8e4:	5e                   	pop    %esi
     8e5:	5f                   	pop    %edi
     8e6:	5d                   	pop    %ebp
     8e7:	c3                   	ret    
     8e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ef:	90                   	nop
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 75 fb ff ff       	call   470 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	57                   	push   %edi
     8fe:	56                   	push   %esi
     8ff:	e8 ac ff ff ff       	call   8b0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     90d:	e8 fe 09 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     912:	83 c4 0c             	add    $0xc,%esp
     915:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     917:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     919:	6a 00                	push   $0x0
     91b:	50                   	push   %eax
     91c:	e8 bf 04 00 00       	call   de0 <memset>
  cmd->left = left;
     921:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     924:	83 c4 10             	add    $0x10,%esp
     927:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     92f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     931:	89 7e 08             	mov    %edi,0x8(%esi)
}
     934:	8d 65 f4             	lea    -0xc(%ebp),%esp
     937:	5b                   	pop    %ebx
     938:	5e                   	pop    %esi
     939:	5f                   	pop    %edi
     93a:	5d                   	pop    %ebp
     93b:	c3                   	ret    
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseline>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 24             	sub    $0x24,%esp
     949:	8b 75 08             	mov    0x8(%ebp),%esi
     94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     94f:	57                   	push   %edi
     950:	56                   	push   %esi
     951:	e8 5a ff ff ff       	call   8b0 <parsepipe>
  while(peek(ps, es, "&")){
     956:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     959:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     95b:	eb 3b                	jmp    998 <parseline+0x58>
     95d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 05 fb ff ff       	call   470 <gettoken>
  cmd = malloc(sizeof(*cmd));
     96b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     972:	e8 99 09 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     977:	83 c4 0c             	add    $0xc,%esp
     97a:	6a 08                	push   $0x8
     97c:	6a 00                	push   $0x0
     97e:	50                   	push   %eax
     97f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     982:	e8 59 04 00 00       	call   de0 <memset>
  cmd->type = BACK;
     987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     98a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     98d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     993:	89 5a 04             	mov    %ebx,0x4(%edx)
     996:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     998:	83 ec 04             	sub    $0x4,%esp
     99b:	68 7a 14 00 00       	push   $0x147a
     9a0:	57                   	push   %edi
     9a1:	56                   	push   %esi
     9a2:	e8 29 fc ff ff       	call   5d0 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 b2                	jne    960 <parseline+0x20>
  if(peek(ps, es, ";")){
     9ae:	83 ec 04             	sub    $0x4,%esp
     9b1:	68 76 14 00 00       	push   $0x1476
     9b6:	57                   	push   %edi
     9b7:	56                   	push   %esi
     9b8:	e8 13 fc ff ff       	call   5d0 <peek>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	85 c0                	test   %eax,%eax
     9c2:	75 0c                	jne    9d0 <parseline+0x90>
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	89 d8                	mov    %ebx,%eax
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
     9cd:	c3                   	ret    
     9ce:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9d0:	6a 00                	push   $0x0
     9d2:	6a 00                	push   $0x0
     9d4:	57                   	push   %edi
     9d5:	56                   	push   %esi
     9d6:	e8 95 fa ff ff       	call   470 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	58                   	pop    %eax
     9dc:	5a                   	pop    %edx
     9dd:	57                   	push   %edi
     9de:	56                   	push   %esi
     9df:	e8 5c ff ff ff       	call   940 <parseline>
  cmd = malloc(sizeof(*cmd));
     9e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9ed:	e8 1e 09 00 00       	call   1310 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9f2:	83 c4 0c             	add    $0xc,%esp
     9f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9f9:	6a 00                	push   $0x0
     9fb:	50                   	push   %eax
     9fc:	e8 df 03 00 00       	call   de0 <memset>
  cmd->left = left;
     a01:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a04:	83 c4 10             	add    $0x10,%esp
     a07:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a0f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a11:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret    
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseblock>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 10             	sub    $0x10,%esp
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a2f:	68 5c 14 00 00       	push   $0x145c
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	e8 95 fb ff ff       	call   5d0 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	74 4a                	je     a8c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a42:	6a 00                	push   $0x0
     a44:	6a 00                	push   $0x0
     a46:	56                   	push   %esi
     a47:	53                   	push   %ebx
     a48:	e8 23 fa ff ff       	call   470 <gettoken>
  cmd = parseline(ps, es);
     a4d:	58                   	pop    %eax
     a4e:	5a                   	pop    %edx
     a4f:	56                   	push   %esi
     a50:	53                   	push   %ebx
     a51:	e8 ea fe ff ff       	call   940 <parseline>
  if(!peek(ps, es, ")"))
     a56:	83 c4 0c             	add    $0xc,%esp
     a59:	68 98 14 00 00       	push   $0x1498
  cmd = parseline(ps, es);
     a5e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a60:	56                   	push   %esi
     a61:	53                   	push   %ebx
     a62:	e8 69 fb ff ff       	call   5d0 <peek>
     a67:	83 c4 10             	add    $0x10,%esp
     a6a:	85 c0                	test   %eax,%eax
     a6c:	74 2b                	je     a99 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a6e:	6a 00                	push   $0x0
     a70:	6a 00                	push   $0x0
     a72:	56                   	push   %esi
     a73:	53                   	push   %ebx
     a74:	e8 f7 f9 ff ff       	call   470 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a79:	83 c4 0c             	add    $0xc,%esp
     a7c:	56                   	push   %esi
     a7d:	53                   	push   %ebx
     a7e:	57                   	push   %edi
     a7f:	e8 cc fb ff ff       	call   650 <parseredirs>
}
     a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a87:	5b                   	pop    %ebx
     a88:	5e                   	pop    %esi
     a89:	5f                   	pop    %edi
     a8a:	5d                   	pop    %ebp
     a8b:	c3                   	ret    
    panic("parseblock");
     a8c:	83 ec 0c             	sub    $0xc,%esp
     a8f:	68 7c 14 00 00       	push   $0x147c
     a94:	e8 d7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a99:	83 ec 0c             	sub    $0xc,%esp
     a9c:	68 87 14 00 00       	push   $0x1487
     aa1:	e8 ca f6 ff ff       	call   170 <panic>
     aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	83 ec 04             	sub    $0x4,%esp
     ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aba:	85 db                	test   %ebx,%ebx
     abc:	0f 84 8e 00 00 00    	je     b50 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     ac2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ac5:	77 61                	ja     b28 <nulterminate+0x78>
     ac7:	8b 03                	mov    (%ebx),%eax
     ac9:	ff 24 85 d8 14 00 00 	jmp    *0x14d8(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	push   0x4(%ebx)
     ad6:	e8 d5 ff ff ff       	call   ab0 <nulterminate>
    nulterminate(lcmd->right);
     adb:	58                   	pop    %eax
     adc:	ff 73 08             	push   0x8(%ebx)
     adf:	e8 cc ff ff ff       	call   ab0 <nulterminate>
    break;
     ae4:	83 c4 10             	add    $0x10,%esp
     ae7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aec:	c9                   	leave  
     aed:	c3                   	ret    
     aee:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	ff 73 04             	push   0x4(%ebx)
     af6:	e8 b5 ff ff ff       	call   ab0 <nulterminate>
    break;
     afb:	89 d8                	mov    %ebx,%eax
     afd:	83 c4 10             	add    $0x10,%esp
}
     b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b03:	c9                   	leave  
     b04:	c3                   	ret    
     b05:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b0b:	8d 43 08             	lea    0x8(%ebx),%eax
     b0e:	85 c9                	test   %ecx,%ecx
     b10:	74 16                	je     b28 <nulterminate+0x78>
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b18:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b1b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b1e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b21:	8b 50 fc             	mov    -0x4(%eax),%edx
     b24:	85 d2                	test   %edx,%edx
     b26:	75 f0                	jne    b18 <nulterminate+0x68>
  switch(cmd->type){
     b28:	89 d8                	mov    %ebx,%eax
}
     b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b2d:	c9                   	leave  
     b2e:	c3                   	ret    
     b2f:	90                   	nop
    nulterminate(rcmd->cmd);
     b30:	83 ec 0c             	sub    $0xc,%esp
     b33:	ff 73 04             	push   0x4(%ebx)
     b36:	e8 75 ff ff ff       	call   ab0 <nulterminate>
    *rcmd->efile = 0;
     b3b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b3e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b41:	c6 00 00             	movb   $0x0,(%eax)
    break;
     b44:	89 d8                	mov    %ebx,%eax
}
     b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b49:	c9                   	leave  
     b4a:	c3                   	ret    
     b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b4f:	90                   	nop
    return 0;
     b50:	31 c0                	xor    %eax,%eax
     b52:	eb 95                	jmp    ae9 <nulterminate+0x39>
     b54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b5f:	90                   	nop

00000b60 <parsecmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
  cmd = parseline(&s, es);
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 3b 02 00 00       	call   db0 <strlen>
  cmd = parseline(&s, es);
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
  es = s + strlen(s);
     b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 c0 fd ff ff       	call   940 <parseline>
  peek(&s, es, "");
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 26 14 00 00       	push   $0x1426
  cmd = parseline(&s, es);
     b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 3f fa ff ff       	call   5d0 <peek>
  if(s != es){
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
  nulterminate(cmd);
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 0c ff ff ff       	call   ab0 <nulterminate>
}
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 9a 14 00 00       	push   $0x149a
     bb5:	6a 02                	push   $0x2
     bb7:	e8 24 05 00 00       	call   10e0 <printf>
    panic("syntax");
     bbc:	c7 04 24 5e 14 00 00 	movl   $0x145e,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax

00000bd0 <lock_init>:



void 
lock_init(lock_t *lock)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
  lock->locked = 0;
     bd3:	8b 45 08             	mov    0x8(%ebp),%eax
     bd6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     bdc:	5d                   	pop    %ebp
     bdd:	c3                   	ret    
     bde:	66 90                	xchg   %ax,%ax

00000be0 <lock_acquire>:

void 
lock_acquire(lock_t *lock)
{
     be0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
     be1:	b9 01 00 00 00       	mov    $0x1,%ecx
     be6:	89 e5                	mov    %esp,%ebp
     be8:	8b 55 08             	mov    0x8(%ebp),%edx
     beb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bef:	90                   	nop
     bf0:	89 c8                	mov    %ecx,%eax
     bf2:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&(lock->locked), 1) != 0)
     bf5:	85 c0                	test   %eax,%eax
     bf7:	75 f7                	jne    bf0 <lock_acquire+0x10>
  ;
}
     bf9:	5d                   	pop    %ebp
     bfa:	c3                   	ret    
     bfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bff:	90                   	nop

00000c00 <lock_release>:
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	8b 45 08             	mov    0x8(%ebp),%eax
     c06:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     c0c:	5d                   	pop    %ebp
     c0d:	c3                   	ret    
     c0e:	66 90                	xchg   %ax,%ax

00000c10 <thread_create>:
  lock->locked = 0;
}

int 
thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	53                   	push   %ebx
     c14:	83 ec 20             	sub    $0x20,%esp
  void * freeStack = malloc(2*PGSIZE);
     c17:	68 00 20 00 00       	push   $0x2000
     c1c:	e8 ef 06 00 00       	call   1310 <malloc>
  if(freeStack == 0) return -1;
     c21:	83 c4 10             	add    $0x10,%esp
     c24:	85 c0                	test   %eax,%eax
     c26:	74 7f                	je     ca7 <thread_create+0x97>

  void *stack = freeStack;
  if((uint)freeStack % PGSIZE != 0)
     c28:	89 c2                	mov    %eax,%edx
     c2a:	89 c3                	mov    %eax,%ebx
     c2c:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
     c32:	75 4c                	jne    c80 <thread_create+0x70>
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);

  int childPid = clone(start_routine, arg1, arg2, stack);
     c34:	50                   	push   %eax
     c35:	ff 75 10             	push   0x10(%ebp)
     c38:	ff 75 0c             	push   0xc(%ebp)
     c3b:	ff 75 08             	push   0x8(%ebp)
     c3e:	e8 d0 03 00 00       	call   1013 <clone>
  if(childPid != -1)
     c43:	83 c4 10             	add    $0x10,%esp
     c46:	83 f8 ff             	cmp    $0xffffffff,%eax
     c49:	74 45                	je     c90 <thread_create+0x80>
  {
    for(int i = 0; i < SIZE; i++)
     c4b:	31 d2                	xor    %edx,%edx
     c4d:	eb 09                	jmp    c58 <thread_create+0x48>
     c4f:	90                   	nop
     c50:	83 c2 01             	add    $0x1,%edx
     c53:	83 fa 40             	cmp    $0x40,%edx
     c56:	74 19                	je     c71 <thread_create+0x61>
    {
      if(userStackAddr[i] == NULL)
     c58:	8b 0c 95 80 1d 00 00 	mov    0x1d80(,%edx,4),%ecx
     c5f:	85 c9                	test   %ecx,%ecx
     c61:	75 ed                	jne    c50 <thread_create+0x40>
      {
        userStackAddr[i] = freeStack;
     c63:	89 1c 95 80 1d 00 00 	mov    %ebx,0x1d80(,%edx,4)
        valueArray[i] = childPid;
     c6a:	89 04 95 80 1c 00 00 	mov    %eax,0x1c80(,%edx,4)
  {
    free(freeStack);
  }

  return childPid;
}
     c71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c74:	c9                   	leave  
     c75:	c3                   	ret    
     c76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c7d:	8d 76 00             	lea    0x0(%esi),%esi
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);
     c80:	29 d0                	sub    %edx,%eax
     c82:	05 00 10 00 00       	add    $0x1000,%eax
     c87:	eb ab                	jmp    c34 <thread_create+0x24>
     c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    free(freeStack);
     c90:	83 ec 0c             	sub    $0xc,%esp
     c93:	89 45 f4             	mov    %eax,-0xc(%ebp)
     c96:	53                   	push   %ebx
     c97:	e8 e4 05 00 00       	call   1280 <free>
     c9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     c9f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(freeStack);
     ca2:	83 c4 10             	add    $0x10,%esp
}
     ca5:	c9                   	leave  
     ca6:	c3                   	ret    
  if(freeStack == 0) return -1;
     ca7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     cac:	eb c3                	jmp    c71 <thread_create+0x61>
     cae:	66 90                	xchg   %ax,%ax

00000cb0 <thread_join>:

int 
thread_join()
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	56                   	push   %esi
     cb4:	53                   	push   %ebx
  void *stack;
  int childPid = join(&stack);
     cb5:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
     cb8:	83 ec 1c             	sub    $0x1c,%esp
  int childPid = join(&stack);
     cbb:	50                   	push   %eax
     cbc:	e8 5a 03 00 00       	call   101b <join>

  if(childPid != -1) {
     cc1:	83 c4 10             	add    $0x10,%esp
  int childPid = join(&stack);
     cc4:	89 c6                	mov    %eax,%esi
  if(childPid != -1) {
     cc6:	83 f8 ff             	cmp    $0xffffffff,%eax
     cc9:	74 46                	je     d11 <thread_join+0x61>
    for(int i=0; i < SIZE; i++) {
     ccb:	31 db                	xor    %ebx,%ebx
     ccd:	eb 09                	jmp    cd8 <thread_join+0x28>
     ccf:	90                   	nop
     cd0:	83 c3 01             	add    $0x1,%ebx
     cd3:	83 fb 40             	cmp    $0x40,%ebx
     cd6:	74 39                	je     d11 <thread_join+0x61>
      if(valueArray[i] == childPid) {
     cd8:	39 34 9d 80 1c 00 00 	cmp    %esi,0x1c80(,%ebx,4)
     cdf:	75 ef                	jne    cd0 <thread_join+0x20>
        free(userStackAddr[i]);
     ce1:	83 ec 0c             	sub    $0xc,%esp
     ce4:	ff 34 9d 80 1d 00 00 	push   0x1d80(,%ebx,4)
     ceb:	e8 90 05 00 00       	call   1280 <free>
        valueArray[i] = -1;
        userStackAddr[i] = NULL;
     cf0:	83 c4 10             	add    $0x10,%esp
        valueArray[i] = -1;
     cf3:	c7 04 9d 80 1c 00 00 	movl   $0xffffffff,0x1c80(,%ebx,4)
     cfa:	ff ff ff ff 
        userStackAddr[i] = NULL;
     cfe:	c7 04 9d 80 1d 00 00 	movl   $0x0,0x1d80(,%ebx,4)
     d05:	00 00 00 00 
    for(int i=0; i < SIZE; i++) {
     d09:	83 c3 01             	add    $0x1,%ebx
     d0c:	83 fb 40             	cmp    $0x40,%ebx
     d0f:	75 c7                	jne    cd8 <thread_join+0x28>
      }
    }
  }
  return childPid;
}
     d11:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d14:	89 f0                	mov    %esi,%eax
     d16:	5b                   	pop    %ebx
     d17:	5e                   	pop    %esi
     d18:	5d                   	pop    %ebp
     d19:	c3                   	ret    
     d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d20 <strcpy>:

char*
strcpy(char *s, const char *t)
{
     d20:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     d21:	31 c0                	xor    %eax,%eax
{
     d23:	89 e5                	mov    %esp,%ebp
     d25:	53                   	push   %ebx
     d26:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     d30:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     d34:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     d37:	83 c0 01             	add    $0x1,%eax
     d3a:	84 d2                	test   %dl,%dl
     d3c:	75 f2                	jne    d30 <strcpy+0x10>
    ;
  return os;
}
     d3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d41:	89 c8                	mov    %ecx,%eax
     d43:	c9                   	leave  
     d44:	c3                   	ret    
     d45:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d50 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
     d53:	53                   	push   %ebx
     d54:	8b 55 08             	mov    0x8(%ebp),%edx
     d57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     d5a:	0f b6 02             	movzbl (%edx),%eax
     d5d:	84 c0                	test   %al,%al
     d5f:	75 17                	jne    d78 <strcmp+0x28>
     d61:	eb 3a                	jmp    d9d <strcmp+0x4d>
     d63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d67:	90                   	nop
     d68:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     d6c:	83 c2 01             	add    $0x1,%edx
     d6f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     d72:	84 c0                	test   %al,%al
     d74:	74 1a                	je     d90 <strcmp+0x40>
    p++, q++;
     d76:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     d78:	0f b6 19             	movzbl (%ecx),%ebx
     d7b:	38 c3                	cmp    %al,%bl
     d7d:	74 e9                	je     d68 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     d7f:	29 d8                	sub    %ebx,%eax
}
     d81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d84:	c9                   	leave  
     d85:	c3                   	ret    
     d86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d8d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     d90:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     d94:	31 c0                	xor    %eax,%eax
     d96:	29 d8                	sub    %ebx,%eax
}
     d98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d9b:	c9                   	leave  
     d9c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     d9d:	0f b6 19             	movzbl (%ecx),%ebx
     da0:	31 c0                	xor    %eax,%eax
     da2:	eb db                	jmp    d7f <strcmp+0x2f>
     da4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     daf:	90                   	nop

00000db0 <strlen>:

uint
strlen(const char *s)
{
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     db6:	80 3a 00             	cmpb   $0x0,(%edx)
     db9:	74 15                	je     dd0 <strlen+0x20>
     dbb:	31 c0                	xor    %eax,%eax
     dbd:	8d 76 00             	lea    0x0(%esi),%esi
     dc0:	83 c0 01             	add    $0x1,%eax
     dc3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     dc7:	89 c1                	mov    %eax,%ecx
     dc9:	75 f5                	jne    dc0 <strlen+0x10>
    ;
  return n;
}
     dcb:	89 c8                	mov    %ecx,%eax
     dcd:	5d                   	pop    %ebp
     dce:	c3                   	ret    
     dcf:	90                   	nop
  for(n = 0; s[n]; n++)
     dd0:	31 c9                	xor    %ecx,%ecx
}
     dd2:	5d                   	pop    %ebp
     dd3:	89 c8                	mov    %ecx,%eax
     dd5:	c3                   	ret    
     dd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ddd:	8d 76 00             	lea    0x0(%esi),%esi

00000de0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	57                   	push   %edi
     de4:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
     de7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     dea:	8b 45 0c             	mov    0xc(%ebp),%eax
     ded:	89 d7                	mov    %edx,%edi
     def:	fc                   	cld    
     df0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     df2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     df5:	89 d0                	mov    %edx,%eax
     df7:	c9                   	leave  
     df8:	c3                   	ret    
     df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e00 <strchr>:

char*
strchr(const char *s, char c)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	8b 45 08             	mov    0x8(%ebp),%eax
     e06:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     e0a:	0f b6 10             	movzbl (%eax),%edx
     e0d:	84 d2                	test   %dl,%dl
     e0f:	75 12                	jne    e23 <strchr+0x23>
     e11:	eb 1d                	jmp    e30 <strchr+0x30>
     e13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e17:	90                   	nop
     e18:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     e1c:	83 c0 01             	add    $0x1,%eax
     e1f:	84 d2                	test   %dl,%dl
     e21:	74 0d                	je     e30 <strchr+0x30>
    if(*s == c)
     e23:	38 d1                	cmp    %dl,%cl
     e25:	75 f1                	jne    e18 <strchr+0x18>
      return (char*)s;
  return 0;
}
     e27:	5d                   	pop    %ebp
     e28:	c3                   	ret    
     e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     e30:	31 c0                	xor    %eax,%eax
}
     e32:	5d                   	pop    %ebp
     e33:	c3                   	ret    
     e34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e3f:	90                   	nop

00000e40 <gets>:

char*
gets(char *buf, int max)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     e45:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     e48:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     e49:	31 db                	xor    %ebx,%ebx
{
     e4b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     e4e:	eb 27                	jmp    e77 <gets+0x37>
    cc = read(0, &c, 1);
     e50:	83 ec 04             	sub    $0x4,%esp
     e53:	6a 01                	push   $0x1
     e55:	57                   	push   %edi
     e56:	6a 00                	push   $0x0
     e58:	e8 2e 01 00 00       	call   f8b <read>
    if(cc < 1)
     e5d:	83 c4 10             	add    $0x10,%esp
     e60:	85 c0                	test   %eax,%eax
     e62:	7e 1d                	jle    e81 <gets+0x41>
      break;
    buf[i++] = c;
     e64:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e68:	8b 55 08             	mov    0x8(%ebp),%edx
     e6b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     e6f:	3c 0a                	cmp    $0xa,%al
     e71:	74 1d                	je     e90 <gets+0x50>
     e73:	3c 0d                	cmp    $0xd,%al
     e75:	74 19                	je     e90 <gets+0x50>
  for(i=0; i+1 < max; ){
     e77:	89 de                	mov    %ebx,%esi
     e79:	83 c3 01             	add    $0x1,%ebx
     e7c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     e7f:	7c cf                	jl     e50 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     e81:	8b 45 08             	mov    0x8(%ebp),%eax
     e84:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     e88:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e8b:	5b                   	pop    %ebx
     e8c:	5e                   	pop    %esi
     e8d:	5f                   	pop    %edi
     e8e:	5d                   	pop    %ebp
     e8f:	c3                   	ret    
  buf[i] = '\0';
     e90:	8b 45 08             	mov    0x8(%ebp),%eax
     e93:	89 de                	mov    %ebx,%esi
     e95:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     e99:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e9c:	5b                   	pop    %ebx
     e9d:	5e                   	pop    %esi
     e9e:	5f                   	pop    %edi
     e9f:	5d                   	pop    %ebp
     ea0:	c3                   	ret    
     ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ea8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eaf:	90                   	nop

00000eb0 <stat>:

int
stat(const char *n, struct stat *st)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	56                   	push   %esi
     eb4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     eb5:	83 ec 08             	sub    $0x8,%esp
     eb8:	6a 00                	push   $0x0
     eba:	ff 75 08             	push   0x8(%ebp)
     ebd:	e8 f1 00 00 00       	call   fb3 <open>
  if(fd < 0)
     ec2:	83 c4 10             	add    $0x10,%esp
     ec5:	85 c0                	test   %eax,%eax
     ec7:	78 27                	js     ef0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     ec9:	83 ec 08             	sub    $0x8,%esp
     ecc:	ff 75 0c             	push   0xc(%ebp)
     ecf:	89 c3                	mov    %eax,%ebx
     ed1:	50                   	push   %eax
     ed2:	e8 f4 00 00 00       	call   fcb <fstat>
  close(fd);
     ed7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     eda:	89 c6                	mov    %eax,%esi
  close(fd);
     edc:	e8 ba 00 00 00       	call   f9b <close>
  return r;
     ee1:	83 c4 10             	add    $0x10,%esp
}
     ee4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ee7:	89 f0                	mov    %esi,%eax
     ee9:	5b                   	pop    %ebx
     eea:	5e                   	pop    %esi
     eeb:	5d                   	pop    %ebp
     eec:	c3                   	ret    
     eed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     ef0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     ef5:	eb ed                	jmp    ee4 <stat+0x34>
     ef7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     efe:	66 90                	xchg   %ax,%ax

00000f00 <atoi>:

int
atoi(const char *s)
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	53                   	push   %ebx
     f04:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f07:	0f be 02             	movsbl (%edx),%eax
     f0a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     f0d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     f10:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     f15:	77 1e                	ja     f35 <atoi+0x35>
     f17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f1e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     f20:	83 c2 01             	add    $0x1,%edx
     f23:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     f26:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     f2a:	0f be 02             	movsbl (%edx),%eax
     f2d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     f30:	80 fb 09             	cmp    $0x9,%bl
     f33:	76 eb                	jbe    f20 <atoi+0x20>
  return n;
}
     f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f38:	89 c8                	mov    %ecx,%eax
     f3a:	c9                   	leave  
     f3b:	c3                   	ret    
     f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f40 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f40:	55                   	push   %ebp
     f41:	89 e5                	mov    %esp,%ebp
     f43:	57                   	push   %edi
     f44:	8b 45 10             	mov    0x10(%ebp),%eax
     f47:	8b 55 08             	mov    0x8(%ebp),%edx
     f4a:	56                   	push   %esi
     f4b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f4e:	85 c0                	test   %eax,%eax
     f50:	7e 13                	jle    f65 <memmove+0x25>
     f52:	01 d0                	add    %edx,%eax
  dst = vdst;
     f54:	89 d7                	mov    %edx,%edi
     f56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f5d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     f60:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     f61:	39 f8                	cmp    %edi,%eax
     f63:	75 fb                	jne    f60 <memmove+0x20>
  return vdst;
}
     f65:	5e                   	pop    %esi
     f66:	89 d0                	mov    %edx,%eax
     f68:	5f                   	pop    %edi
     f69:	5d                   	pop    %ebp
     f6a:	c3                   	ret    

00000f6b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f6b:	b8 01 00 00 00       	mov    $0x1,%eax
     f70:	cd 40                	int    $0x40
     f72:	c3                   	ret    

00000f73 <exit>:
SYSCALL(exit)
     f73:	b8 02 00 00 00       	mov    $0x2,%eax
     f78:	cd 40                	int    $0x40
     f7a:	c3                   	ret    

00000f7b <wait>:
SYSCALL(wait)
     f7b:	b8 03 00 00 00       	mov    $0x3,%eax
     f80:	cd 40                	int    $0x40
     f82:	c3                   	ret    

00000f83 <pipe>:
SYSCALL(pipe)
     f83:	b8 04 00 00 00       	mov    $0x4,%eax
     f88:	cd 40                	int    $0x40
     f8a:	c3                   	ret    

00000f8b <read>:
SYSCALL(read)
     f8b:	b8 05 00 00 00       	mov    $0x5,%eax
     f90:	cd 40                	int    $0x40
     f92:	c3                   	ret    

00000f93 <write>:
SYSCALL(write)
     f93:	b8 10 00 00 00       	mov    $0x10,%eax
     f98:	cd 40                	int    $0x40
     f9a:	c3                   	ret    

00000f9b <close>:
SYSCALL(close)
     f9b:	b8 15 00 00 00       	mov    $0x15,%eax
     fa0:	cd 40                	int    $0x40
     fa2:	c3                   	ret    

00000fa3 <kill>:
SYSCALL(kill)
     fa3:	b8 06 00 00 00       	mov    $0x6,%eax
     fa8:	cd 40                	int    $0x40
     faa:	c3                   	ret    

00000fab <exec>:
SYSCALL(exec)
     fab:	b8 07 00 00 00       	mov    $0x7,%eax
     fb0:	cd 40                	int    $0x40
     fb2:	c3                   	ret    

00000fb3 <open>:
SYSCALL(open)
     fb3:	b8 0f 00 00 00       	mov    $0xf,%eax
     fb8:	cd 40                	int    $0x40
     fba:	c3                   	ret    

00000fbb <mknod>:
SYSCALL(mknod)
     fbb:	b8 11 00 00 00       	mov    $0x11,%eax
     fc0:	cd 40                	int    $0x40
     fc2:	c3                   	ret    

00000fc3 <unlink>:
SYSCALL(unlink)
     fc3:	b8 12 00 00 00       	mov    $0x12,%eax
     fc8:	cd 40                	int    $0x40
     fca:	c3                   	ret    

00000fcb <fstat>:
SYSCALL(fstat)
     fcb:	b8 08 00 00 00       	mov    $0x8,%eax
     fd0:	cd 40                	int    $0x40
     fd2:	c3                   	ret    

00000fd3 <link>:
SYSCALL(link)
     fd3:	b8 13 00 00 00       	mov    $0x13,%eax
     fd8:	cd 40                	int    $0x40
     fda:	c3                   	ret    

00000fdb <mkdir>:
SYSCALL(mkdir)
     fdb:	b8 14 00 00 00       	mov    $0x14,%eax
     fe0:	cd 40                	int    $0x40
     fe2:	c3                   	ret    

00000fe3 <chdir>:
SYSCALL(chdir)
     fe3:	b8 09 00 00 00       	mov    $0x9,%eax
     fe8:	cd 40                	int    $0x40
     fea:	c3                   	ret    

00000feb <dup>:
SYSCALL(dup)
     feb:	b8 0a 00 00 00       	mov    $0xa,%eax
     ff0:	cd 40                	int    $0x40
     ff2:	c3                   	ret    

00000ff3 <getpid>:
SYSCALL(getpid)
     ff3:	b8 0b 00 00 00       	mov    $0xb,%eax
     ff8:	cd 40                	int    $0x40
     ffa:	c3                   	ret    

00000ffb <sbrk>:
SYSCALL(sbrk)
     ffb:	b8 0c 00 00 00       	mov    $0xc,%eax
    1000:	cd 40                	int    $0x40
    1002:	c3                   	ret    

00001003 <sleep>:
SYSCALL(sleep)
    1003:	b8 0d 00 00 00       	mov    $0xd,%eax
    1008:	cd 40                	int    $0x40
    100a:	c3                   	ret    

0000100b <uptime>:
SYSCALL(uptime)
    100b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1010:	cd 40                	int    $0x40
    1012:	c3                   	ret    

00001013 <clone>:
SYSCALL(clone)
    1013:	b8 16 00 00 00       	mov    $0x16,%eax
    1018:	cd 40                	int    $0x40
    101a:	c3                   	ret    

0000101b <join>:
    101b:	b8 17 00 00 00       	mov    $0x17,%eax
    1020:	cd 40                	int    $0x40
    1022:	c3                   	ret    
    1023:	66 90                	xchg   %ax,%ax
    1025:	66 90                	xchg   %ax,%ax
    1027:	66 90                	xchg   %ax,%ax
    1029:	66 90                	xchg   %ax,%ax
    102b:	66 90                	xchg   %ax,%ax
    102d:	66 90                	xchg   %ax,%ax
    102f:	90                   	nop

00001030 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	57                   	push   %edi
    1034:	56                   	push   %esi
    1035:	53                   	push   %ebx
    1036:	83 ec 3c             	sub    $0x3c,%esp
    1039:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    103c:	89 d1                	mov    %edx,%ecx
{
    103e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1041:	85 d2                	test   %edx,%edx
    1043:	0f 89 7f 00 00 00    	jns    10c8 <printint+0x98>
    1049:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    104d:	74 79                	je     10c8 <printint+0x98>
    neg = 1;
    104f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1056:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1058:	31 db                	xor    %ebx,%ebx
    105a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    105d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1060:	89 c8                	mov    %ecx,%eax
    1062:	31 d2                	xor    %edx,%edx
    1064:	89 cf                	mov    %ecx,%edi
    1066:	f7 75 c4             	divl   -0x3c(%ebp)
    1069:	0f b6 92 50 15 00 00 	movzbl 0x1550(%edx),%edx
    1070:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1073:	89 d8                	mov    %ebx,%eax
    1075:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1078:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    107b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    107e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1081:	76 dd                	jbe    1060 <printint+0x30>
  if(neg)
    1083:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1086:	85 c9                	test   %ecx,%ecx
    1088:	74 0c                	je     1096 <printint+0x66>
    buf[i++] = '-';
    108a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    108f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1091:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1096:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1099:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    109d:	eb 07                	jmp    10a6 <printint+0x76>
    109f:	90                   	nop
    putc(fd, buf[i]);
    10a0:	0f b6 13             	movzbl (%ebx),%edx
    10a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    10a6:	83 ec 04             	sub    $0x4,%esp
    10a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    10ac:	6a 01                	push   $0x1
    10ae:	56                   	push   %esi
    10af:	57                   	push   %edi
    10b0:	e8 de fe ff ff       	call   f93 <write>
  while(--i >= 0)
    10b5:	83 c4 10             	add    $0x10,%esp
    10b8:	39 de                	cmp    %ebx,%esi
    10ba:	75 e4                	jne    10a0 <printint+0x70>
}
    10bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10bf:	5b                   	pop    %ebx
    10c0:	5e                   	pop    %esi
    10c1:	5f                   	pop    %edi
    10c2:	5d                   	pop    %ebp
    10c3:	c3                   	ret    
    10c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    10c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    10cf:	eb 87                	jmp    1058 <printint+0x28>
    10d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10df:	90                   	nop

000010e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	56                   	push   %esi
    10e5:	53                   	push   %ebx
    10e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    10e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    10ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    10ef:	0f b6 13             	movzbl (%ebx),%edx
    10f2:	84 d2                	test   %dl,%dl
    10f4:	74 6a                	je     1160 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    10f6:	8d 45 10             	lea    0x10(%ebp),%eax
    10f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    10fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    10ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1101:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1104:	eb 36                	jmp    113c <printf+0x5c>
    1106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110d:	8d 76 00             	lea    0x0(%esi),%esi
    1110:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1113:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1118:	83 f8 25             	cmp    $0x25,%eax
    111b:	74 15                	je     1132 <printf+0x52>
  write(fd, &c, 1);
    111d:	83 ec 04             	sub    $0x4,%esp
    1120:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1123:	6a 01                	push   $0x1
    1125:	57                   	push   %edi
    1126:	56                   	push   %esi
    1127:	e8 67 fe ff ff       	call   f93 <write>
    112c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    112f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1132:	0f b6 13             	movzbl (%ebx),%edx
    1135:	83 c3 01             	add    $0x1,%ebx
    1138:	84 d2                	test   %dl,%dl
    113a:	74 24                	je     1160 <printf+0x80>
    c = fmt[i] & 0xff;
    113c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    113f:	85 c9                	test   %ecx,%ecx
    1141:	74 cd                	je     1110 <printf+0x30>
      }
    } else if(state == '%'){
    1143:	83 f9 25             	cmp    $0x25,%ecx
    1146:	75 ea                	jne    1132 <printf+0x52>
      if(c == 'd'){
    1148:	83 f8 25             	cmp    $0x25,%eax
    114b:	0f 84 07 01 00 00    	je     1258 <printf+0x178>
    1151:	83 e8 63             	sub    $0x63,%eax
    1154:	83 f8 15             	cmp    $0x15,%eax
    1157:	77 17                	ja     1170 <printf+0x90>
    1159:	ff 24 85 f8 14 00 00 	jmp    *0x14f8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1160:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1163:	5b                   	pop    %ebx
    1164:	5e                   	pop    %esi
    1165:	5f                   	pop    %edi
    1166:	5d                   	pop    %ebp
    1167:	c3                   	ret    
    1168:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116f:	90                   	nop
  write(fd, &c, 1);
    1170:	83 ec 04             	sub    $0x4,%esp
    1173:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1176:	6a 01                	push   $0x1
    1178:	57                   	push   %edi
    1179:	56                   	push   %esi
    117a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    117e:	e8 10 fe ff ff       	call   f93 <write>
        putc(fd, c);
    1183:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1187:	83 c4 0c             	add    $0xc,%esp
    118a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    118d:	6a 01                	push   $0x1
    118f:	57                   	push   %edi
    1190:	56                   	push   %esi
    1191:	e8 fd fd ff ff       	call   f93 <write>
        putc(fd, c);
    1196:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1199:	31 c9                	xor    %ecx,%ecx
    119b:	eb 95                	jmp    1132 <printf+0x52>
    119d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    11a0:	83 ec 0c             	sub    $0xc,%esp
    11a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    11a8:	6a 00                	push   $0x0
    11aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    11ad:	8b 10                	mov    (%eax),%edx
    11af:	89 f0                	mov    %esi,%eax
    11b1:	e8 7a fe ff ff       	call   1030 <printint>
        ap++;
    11b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    11ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11bd:	31 c9                	xor    %ecx,%ecx
    11bf:	e9 6e ff ff ff       	jmp    1132 <printf+0x52>
    11c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    11c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    11cb:	8b 10                	mov    (%eax),%edx
        ap++;
    11cd:	83 c0 04             	add    $0x4,%eax
    11d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    11d3:	85 d2                	test   %edx,%edx
    11d5:	0f 84 8d 00 00 00    	je     1268 <printf+0x188>
        while(*s != 0){
    11db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    11de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    11e0:	84 c0                	test   %al,%al
    11e2:	0f 84 4a ff ff ff    	je     1132 <printf+0x52>
    11e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    11eb:	89 d3                	mov    %edx,%ebx
    11ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    11f0:	83 ec 04             	sub    $0x4,%esp
          s++;
    11f3:	83 c3 01             	add    $0x1,%ebx
    11f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    11f9:	6a 01                	push   $0x1
    11fb:	57                   	push   %edi
    11fc:	56                   	push   %esi
    11fd:	e8 91 fd ff ff       	call   f93 <write>
        while(*s != 0){
    1202:	0f b6 03             	movzbl (%ebx),%eax
    1205:	83 c4 10             	add    $0x10,%esp
    1208:	84 c0                	test   %al,%al
    120a:	75 e4                	jne    11f0 <printf+0x110>
      state = 0;
    120c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    120f:	31 c9                	xor    %ecx,%ecx
    1211:	e9 1c ff ff ff       	jmp    1132 <printf+0x52>
    1216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    121d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1220:	83 ec 0c             	sub    $0xc,%esp
    1223:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1228:	6a 01                	push   $0x1
    122a:	e9 7b ff ff ff       	jmp    11aa <printf+0xca>
    122f:	90                   	nop
        putc(fd, *ap);
    1230:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1233:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1236:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1238:	6a 01                	push   $0x1
    123a:	57                   	push   %edi
    123b:	56                   	push   %esi
        putc(fd, *ap);
    123c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    123f:	e8 4f fd ff ff       	call   f93 <write>
        ap++;
    1244:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1248:	83 c4 10             	add    $0x10,%esp
      state = 0;
    124b:	31 c9                	xor    %ecx,%ecx
    124d:	e9 e0 fe ff ff       	jmp    1132 <printf+0x52>
    1252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1258:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    125b:	83 ec 04             	sub    $0x4,%esp
    125e:	e9 2a ff ff ff       	jmp    118d <printf+0xad>
    1263:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1267:	90                   	nop
          s = "(null)";
    1268:	ba f0 14 00 00       	mov    $0x14f0,%edx
        while(*s != 0){
    126d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1270:	b8 28 00 00 00       	mov    $0x28,%eax
    1275:	89 d3                	mov    %edx,%ebx
    1277:	e9 74 ff ff ff       	jmp    11f0 <printf+0x110>
    127c:	66 90                	xchg   %ax,%ax
    127e:	66 90                	xchg   %ax,%ax

00001280 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1280:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1281:	a1 80 1e 00 00       	mov    0x1e80,%eax
{
    1286:	89 e5                	mov    %esp,%ebp
    1288:	57                   	push   %edi
    1289:	56                   	push   %esi
    128a:	53                   	push   %ebx
    128b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    128e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1298:	89 c2                	mov    %eax,%edx
    129a:	8b 00                	mov    (%eax),%eax
    129c:	39 ca                	cmp    %ecx,%edx
    129e:	73 30                	jae    12d0 <free+0x50>
    12a0:	39 c1                	cmp    %eax,%ecx
    12a2:	72 04                	jb     12a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12a4:	39 c2                	cmp    %eax,%edx
    12a6:	72 f0                	jb     1298 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12ae:	39 f8                	cmp    %edi,%eax
    12b0:	74 30                	je     12e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    12b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    12b5:	8b 42 04             	mov    0x4(%edx),%eax
    12b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    12bb:	39 f1                	cmp    %esi,%ecx
    12bd:	74 3a                	je     12f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    12bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    12c1:	5b                   	pop    %ebx
  freep = p;
    12c2:	89 15 80 1e 00 00    	mov    %edx,0x1e80
}
    12c8:	5e                   	pop    %esi
    12c9:	5f                   	pop    %edi
    12ca:	5d                   	pop    %ebp
    12cb:	c3                   	ret    
    12cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12d0:	39 c2                	cmp    %eax,%edx
    12d2:	72 c4                	jb     1298 <free+0x18>
    12d4:	39 c1                	cmp    %eax,%ecx
    12d6:	73 c0                	jae    1298 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    12d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12de:	39 f8                	cmp    %edi,%eax
    12e0:	75 d0                	jne    12b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    12e2:	03 70 04             	add    0x4(%eax),%esi
    12e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    12e8:	8b 02                	mov    (%edx),%eax
    12ea:	8b 00                	mov    (%eax),%eax
    12ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    12ef:	8b 42 04             	mov    0x4(%edx),%eax
    12f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    12f5:	39 f1                	cmp    %esi,%ecx
    12f7:	75 c6                	jne    12bf <free+0x3f>
    p->s.size += bp->s.size;
    12f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    12fc:	89 15 80 1e 00 00    	mov    %edx,0x1e80
    p->s.size += bp->s.size;
    1302:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1305:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1308:	89 0a                	mov    %ecx,(%edx)
}
    130a:	5b                   	pop    %ebx
    130b:	5e                   	pop    %esi
    130c:	5f                   	pop    %edi
    130d:	5d                   	pop    %ebp
    130e:	c3                   	ret    
    130f:	90                   	nop

00001310 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	53                   	push   %ebx
    1316:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1319:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    131c:	8b 3d 80 1e 00 00    	mov    0x1e80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1322:	8d 70 07             	lea    0x7(%eax),%esi
    1325:	c1 ee 03             	shr    $0x3,%esi
    1328:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    132b:	85 ff                	test   %edi,%edi
    132d:	0f 84 9d 00 00 00    	je     13d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1333:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1335:	8b 4a 04             	mov    0x4(%edx),%ecx
    1338:	39 f1                	cmp    %esi,%ecx
    133a:	73 6a                	jae    13a6 <malloc+0x96>
    133c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1341:	39 de                	cmp    %ebx,%esi
    1343:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1346:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    134d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1350:	eb 17                	jmp    1369 <malloc+0x59>
    1352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1358:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    135a:	8b 48 04             	mov    0x4(%eax),%ecx
    135d:	39 f1                	cmp    %esi,%ecx
    135f:	73 4f                	jae    13b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1361:	8b 3d 80 1e 00 00    	mov    0x1e80,%edi
    1367:	89 c2                	mov    %eax,%edx
    1369:	39 d7                	cmp    %edx,%edi
    136b:	75 eb                	jne    1358 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    136d:	83 ec 0c             	sub    $0xc,%esp
    1370:	ff 75 e4             	push   -0x1c(%ebp)
    1373:	e8 83 fc ff ff       	call   ffb <sbrk>
  if(p == (char*)-1)
    1378:	83 c4 10             	add    $0x10,%esp
    137b:	83 f8 ff             	cmp    $0xffffffff,%eax
    137e:	74 1c                	je     139c <malloc+0x8c>
  hp->s.size = nu;
    1380:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1383:	83 ec 0c             	sub    $0xc,%esp
    1386:	83 c0 08             	add    $0x8,%eax
    1389:	50                   	push   %eax
    138a:	e8 f1 fe ff ff       	call   1280 <free>
  return freep;
    138f:	8b 15 80 1e 00 00    	mov    0x1e80,%edx
      if((p = morecore(nunits)) == 0)
    1395:	83 c4 10             	add    $0x10,%esp
    1398:	85 d2                	test   %edx,%edx
    139a:	75 bc                	jne    1358 <malloc+0x48>
        return 0;
  }
}
    139c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    139f:	31 c0                	xor    %eax,%eax
}
    13a1:	5b                   	pop    %ebx
    13a2:	5e                   	pop    %esi
    13a3:	5f                   	pop    %edi
    13a4:	5d                   	pop    %ebp
    13a5:	c3                   	ret    
    if(p->s.size >= nunits){
    13a6:	89 d0                	mov    %edx,%eax
    13a8:	89 fa                	mov    %edi,%edx
    13aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13b0:	39 ce                	cmp    %ecx,%esi
    13b2:	74 4c                	je     1400 <malloc+0xf0>
        p->s.size -= nunits;
    13b4:	29 f1                	sub    %esi,%ecx
    13b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    13bf:	89 15 80 1e 00 00    	mov    %edx,0x1e80
}
    13c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13c8:	83 c0 08             	add    $0x8,%eax
}
    13cb:	5b                   	pop    %ebx
    13cc:	5e                   	pop    %esi
    13cd:	5f                   	pop    %edi
    13ce:	5d                   	pop    %ebp
    13cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    13d0:	c7 05 80 1e 00 00 84 	movl   $0x1e84,0x1e80
    13d7:	1e 00 00 
    base.s.size = 0;
    13da:	bf 84 1e 00 00       	mov    $0x1e84,%edi
    base.s.ptr = freep = prevp = &base;
    13df:	c7 05 84 1e 00 00 84 	movl   $0x1e84,0x1e84
    13e6:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    13eb:	c7 05 88 1e 00 00 00 	movl   $0x0,0x1e88
    13f2:	00 00 00 
    if(p->s.size >= nunits){
    13f5:	e9 42 ff ff ff       	jmp    133c <malloc+0x2c>
    13fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1400:	8b 08                	mov    (%eax),%ecx
    1402:	89 0a                	mov    %ecx,(%edx)
    1404:	eb b9                	jmp    13bf <malloc+0xaf>
