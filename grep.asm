
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
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
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	75 2d                	jne    62 <main+0x62>
  35:	eb 6c                	jmp    a3 <main+0xa3>
  37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	push   -0x20(%ebp)
  4d:	e8 7e 01 00 00       	call   1d0 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 e1 06 00 00       	call   73b <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	push   (%ebx)
  69:	e8 e5 06 00 00       	call   753 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	push   (%ebx)
  7a:	68 c8 0b 00 00       	push   $0xbc8
  7f:	6a 01                	push   $0x1
  81:	e8 fa 07 00 00       	call   880 <printf>
      exit();
  86:	e8 88 06 00 00       	call   713 <exit>
  }
  exit();
  8b:	e8 83 06 00 00       	call   713 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 a8 0b 00 00       	push   $0xba8
  97:	6a 02                	push   $0x2
  99:	e8 e2 07 00 00       	call   880 <printf>
    exit();
  9e:	e8 70 06 00 00       	call   713 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 23 01 00 00       	call   1d0 <grep>
    exit();
  ad:	e8 61 06 00 00       	call   713 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 0c             	sub    $0xc,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
  cf:	0f b6 06             	movzbl (%esi),%eax
  d2:	84 c0                	test   %al,%al
  d4:	75 2d                	jne    103 <matchhere+0x43>
  d6:	e9 7d 00 00 00       	jmp    158 <matchhere+0x98>
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  e0:	0f b6 0f             	movzbl (%edi),%ecx
  if(re[0] == '$' && re[1] == '\0')
  e3:	80 fb 24             	cmp    $0x24,%bl
  e6:	75 04                	jne    ec <matchhere+0x2c>
  e8:	84 c0                	test   %al,%al
  ea:	74 79                	je     165 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  ec:	84 c9                	test   %cl,%cl
  ee:	74 58                	je     148 <matchhere+0x88>
  f0:	38 d9                	cmp    %bl,%cl
  f2:	74 05                	je     f9 <matchhere+0x39>
  f4:	80 fb 2e             	cmp    $0x2e,%bl
  f7:	75 4f                	jne    148 <matchhere+0x88>
    return matchhere(re+1, text+1);
  f9:	83 c7 01             	add    $0x1,%edi
  fc:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
  ff:	84 c0                	test   %al,%al
 101:	74 55                	je     158 <matchhere+0x98>
  if(re[1] == '*')
 103:	0f be d8             	movsbl %al,%ebx
 106:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 10a:	3c 2a                	cmp    $0x2a,%al
 10c:	75 d2                	jne    e0 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 10e:	83 c6 02             	add    $0x2,%esi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 118:	83 ec 08             	sub    $0x8,%esp
 11b:	57                   	push   %edi
 11c:	56                   	push   %esi
 11d:	e8 9e ff ff ff       	call   c0 <matchhere>
 122:	83 c4 10             	add    $0x10,%esp
 125:	85 c0                	test   %eax,%eax
 127:	75 2f                	jne    158 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 129:	0f be 17             	movsbl (%edi),%edx
 12c:	84 d2                	test   %dl,%dl
 12e:	74 0c                	je     13c <matchhere+0x7c>
 130:	83 c7 01             	add    $0x1,%edi
 133:	83 fb 2e             	cmp    $0x2e,%ebx
 136:	74 e0                	je     118 <matchhere+0x58>
 138:	39 da                	cmp    %ebx,%edx
 13a:	74 dc                	je     118 <matchhere+0x58>
}
 13c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13f:	5b                   	pop    %ebx
 140:	5e                   	pop    %esi
 141:	5f                   	pop    %edi
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14b:	31 c0                	xor    %eax,%eax
}
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 15b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 160:	5b                   	pop    %ebx
 161:	5e                   	pop    %esi
 162:	5f                   	pop    %edi
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
    return *text == '\0';
 165:	31 c0                	xor    %eax,%eax
 167:	84 c9                	test   %cl,%cl
 169:	0f 94 c0             	sete   %al
 16c:	eb ce                	jmp    13c <matchhere+0x7c>
 16e:	66 90                	xchg   %ax,%ax

00000170 <match>:
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 5d 08             	mov    0x8(%ebp),%ebx
 178:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 17b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 17e:	75 11                	jne    191 <match+0x21>
 180:	eb 2e                	jmp    1b0 <match+0x40>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 188:	83 c6 01             	add    $0x1,%esi
 18b:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 18f:	74 16                	je     1a7 <match+0x37>
    if(matchhere(re, text))
 191:	83 ec 08             	sub    $0x8,%esp
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
 196:	e8 25 ff ff ff       	call   c0 <matchhere>
 19b:	83 c4 10             	add    $0x10,%esp
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 e6                	je     188 <match+0x18>
      return 1;
 1a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 1b0:	83 c3 01             	add    $0x1,%ebx
 1b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1bc:	e9 ff fe ff ff       	jmp    c0 <matchhere>
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <grep>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 1c             	sub    $0x1c,%esp
 1d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 1dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
 1e3:	8d 47 01             	lea    0x1(%edi),%eax
 1e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 1f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 1f3:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 1f8:	83 ec 04             	sub    $0x4,%esp
 1fb:	29 c8                	sub    %ecx,%eax
 1fd:	50                   	push   %eax
 1fe:	8d 81 a0 10 00 00    	lea    0x10a0(%ecx),%eax
 204:	50                   	push   %eax
 205:	ff 75 0c             	push   0xc(%ebp)
 208:	e8 1e 05 00 00       	call   72b <read>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	0f 8e e5 00 00 00    	jle    2fd <grep+0x12d>
    m += n;
 218:	01 45 dc             	add    %eax,-0x24(%ebp)
 21b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
 21e:	c7 45 e4 a0 10 00 00 	movl   $0x10a0,-0x1c(%ebp)
    buf[m] = '\0';
 225:	c6 81 a0 10 00 00 00 	movb   $0x0,0x10a0(%ecx)
    while((q = strchr(p, '\n')) != 0){
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 0a                	push   $0xa
 235:	ff 75 e4             	push   -0x1c(%ebp)
 238:	e8 63 03 00 00       	call   5a0 <strchr>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	89 c3                	mov    %eax,%ebx
 242:	85 c0                	test   %eax,%eax
 244:	74 72                	je     2b8 <grep+0xe8>
      *q = 0;
 246:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
 249:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
 24c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
 24f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 252:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
 255:	75 12                	jne    269 <grep+0x99>
 257:	eb 47                	jmp    2a0 <grep+0xd0>
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
 260:	83 c6 01             	add    $0x1,%esi
 263:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 267:	74 2b                	je     294 <grep+0xc4>
    if(matchhere(re, text))
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	56                   	push   %esi
 26d:	57                   	push   %edi
 26e:	e8 4d fe ff ff       	call   c0 <matchhere>
 273:	83 c4 10             	add    $0x10,%esp
 276:	85 c0                	test   %eax,%eax
 278:	74 e6                	je     260 <grep+0x90>
        write(1, p, q+1 - p);
 27a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 27d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 280:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 283:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 286:	29 d0                	sub    %edx,%eax
 288:	50                   	push   %eax
 289:	52                   	push   %edx
 28a:	6a 01                	push   $0x1
 28c:	e8 a2 04 00 00       	call   733 <write>
 291:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 294:	8b 45 e0             	mov    -0x20(%ebp),%eax
 297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 29a:	eb 94                	jmp    230 <grep+0x60>
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	56                   	push   %esi
 2a4:	ff 75 d8             	push   -0x28(%ebp)
 2a7:	e8 14 fe ff ff       	call   c0 <matchhere>
 2ac:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
 2af:	85 c0                	test   %eax,%eax
 2b1:	74 e1                	je     294 <grep+0xc4>
 2b3:	eb c5                	jmp    27a <grep+0xaa>
 2b5:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
 2b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2bb:	81 fa a0 10 00 00    	cmp    $0x10a0,%edx
 2c1:	74 2e                	je     2f1 <grep+0x121>
    if(m > 0){
 2c3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 2c6:	85 c9                	test   %ecx,%ecx
 2c8:	0f 8e 22 ff ff ff    	jle    1f0 <grep+0x20>
      m -= p - buf;
 2ce:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
 2d0:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2d3:	2d a0 10 00 00       	sub    $0x10a0,%eax
 2d8:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2da:	51                   	push   %ecx
 2db:	52                   	push   %edx
 2dc:	68 a0 10 00 00       	push   $0x10a0
      m -= p - buf;
 2e1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
 2e4:	e8 f7 03 00 00       	call   6e0 <memmove>
 2e9:	83 c4 10             	add    $0x10,%esp
 2ec:	e9 ff fe ff ff       	jmp    1f0 <grep+0x20>
      m = 0;
 2f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 2f8:	e9 f3 fe ff ff       	jmp    1f0 <grep+0x20>
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <matchstar>:
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	8b 5d 08             	mov    0x8(%ebp),%ebx
 31c:	8b 75 0c             	mov    0xc(%ebp),%esi
 31f:	8b 7d 10             	mov    0x10(%ebp),%edi
 322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 328:	83 ec 08             	sub    $0x8,%esp
 32b:	57                   	push   %edi
 32c:	56                   	push   %esi
 32d:	e8 8e fd ff ff       	call   c0 <matchhere>
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	75 1f                	jne    358 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
 339:	0f be 17             	movsbl (%edi),%edx
 33c:	84 d2                	test   %dl,%dl
 33e:	74 0c                	je     34c <matchstar+0x3c>
 340:	83 c7 01             	add    $0x1,%edi
 343:	39 da                	cmp    %ebx,%edx
 345:	74 e1                	je     328 <matchstar+0x18>
 347:	83 fb 2e             	cmp    $0x2e,%ebx
 34a:	74 dc                	je     328 <matchstar+0x18>
}
 34c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34f:	5b                   	pop    %ebx
 350:	5e                   	pop    %esi
 351:	5f                   	pop    %edi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 358:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 360:	5b                   	pop    %ebx
 361:	5e                   	pop    %esi
 362:	5f                   	pop    %edi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <lock_init>:



void 
lock_init(lock_t *lock)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
  lock->locked = 0;
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	66 90                	xchg   %ax,%ax

00000380 <lock_acquire>:

void 
lock_acquire(lock_t *lock)
{
 380:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 381:	b9 01 00 00 00       	mov    $0x1,%ecx
 386:	89 e5                	mov    %esp,%ebp
 388:	8b 55 08             	mov    0x8(%ebp),%edx
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop
 390:	89 c8                	mov    %ecx,%eax
 392:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&(lock->locked), 1) != 0)
 395:	85 c0                	test   %eax,%eax
 397:	75 f7                	jne    390 <lock_acquire+0x10>
  ;
}
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <lock_release>:
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <thread_create>:
  lock->locked = 0;
}

int 
thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	83 ec 20             	sub    $0x20,%esp
  void * freeStack = malloc(2*PGSIZE);
 3b7:	68 00 20 00 00       	push   $0x2000
 3bc:	e8 ef 06 00 00       	call   ab0 <malloc>
  if(freeStack == 0) return -1;
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	85 c0                	test   %eax,%eax
 3c6:	74 7f                	je     447 <thread_create+0x97>

  void *stack = freeStack;
  if((uint)freeStack % PGSIZE != 0)
 3c8:	89 c2                	mov    %eax,%edx
 3ca:	89 c3                	mov    %eax,%ebx
 3cc:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3d2:	75 4c                	jne    420 <thread_create+0x70>
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);

  int childPid = clone(start_routine, arg1, arg2, stack);
 3d4:	50                   	push   %eax
 3d5:	ff 75 10             	push   0x10(%ebp)
 3d8:	ff 75 0c             	push   0xc(%ebp)
 3db:	ff 75 08             	push   0x8(%ebp)
 3de:	e8 d0 03 00 00       	call   7b3 <clone>
  if(childPid != -1)
 3e3:	83 c4 10             	add    $0x10,%esp
 3e6:	83 f8 ff             	cmp    $0xffffffff,%eax
 3e9:	74 45                	je     430 <thread_create+0x80>
  {
    for(int i = 0; i < SIZE; i++)
 3eb:	31 d2                	xor    %edx,%edx
 3ed:	eb 09                	jmp    3f8 <thread_create+0x48>
 3ef:	90                   	nop
 3f0:	83 c2 01             	add    $0x1,%edx
 3f3:	83 fa 40             	cmp    $0x40,%edx
 3f6:	74 19                	je     411 <thread_create+0x61>
    {
      if(userStackAddr[i] == NULL)
 3f8:	8b 0c 95 a0 15 00 00 	mov    0x15a0(,%edx,4),%ecx
 3ff:	85 c9                	test   %ecx,%ecx
 401:	75 ed                	jne    3f0 <thread_create+0x40>
      {
        userStackAddr[i] = freeStack;
 403:	89 1c 95 a0 15 00 00 	mov    %ebx,0x15a0(,%edx,4)
        valueArray[i] = childPid;
 40a:	89 04 95 a0 14 00 00 	mov    %eax,0x14a0(,%edx,4)
  {
    free(freeStack);
  }

  return childPid;
}
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave  
 415:	c3                   	ret    
 416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    stack = freeStack + PGSIZE -((uint)freeStack % PGSIZE);
 420:	29 d0                	sub    %edx,%eax
 422:	05 00 10 00 00       	add    $0x1000,%eax
 427:	eb ab                	jmp    3d4 <thread_create+0x24>
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    free(freeStack);
 430:	83 ec 0c             	sub    $0xc,%esp
 433:	89 45 f4             	mov    %eax,-0xc(%ebp)
 436:	53                   	push   %ebx
 437:	e8 e4 05 00 00       	call   a20 <free>
 43c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 43f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(freeStack);
 442:	83 c4 10             	add    $0x10,%esp
}
 445:	c9                   	leave  
 446:	c3                   	ret    
  if(freeStack == 0) return -1;
 447:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 44c:	eb c3                	jmp    411 <thread_create+0x61>
 44e:	66 90                	xchg   %ax,%ax

00000450 <thread_join>:

int 
thread_join()
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	56                   	push   %esi
 454:	53                   	push   %ebx
  void *stack;
  int childPid = join(&stack);
 455:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
 458:	83 ec 1c             	sub    $0x1c,%esp
  int childPid = join(&stack);
 45b:	50                   	push   %eax
 45c:	e8 5a 03 00 00       	call   7bb <join>

  if(childPid != -1) {
 461:	83 c4 10             	add    $0x10,%esp
  int childPid = join(&stack);
 464:	89 c6                	mov    %eax,%esi
  if(childPid != -1) {
 466:	83 f8 ff             	cmp    $0xffffffff,%eax
 469:	74 46                	je     4b1 <thread_join+0x61>
    for(int i=0; i < SIZE; i++) {
 46b:	31 db                	xor    %ebx,%ebx
 46d:	eb 09                	jmp    478 <thread_join+0x28>
 46f:	90                   	nop
 470:	83 c3 01             	add    $0x1,%ebx
 473:	83 fb 40             	cmp    $0x40,%ebx
 476:	74 39                	je     4b1 <thread_join+0x61>
      if(valueArray[i] == childPid) {
 478:	39 34 9d a0 14 00 00 	cmp    %esi,0x14a0(,%ebx,4)
 47f:	75 ef                	jne    470 <thread_join+0x20>
        free(userStackAddr[i]);
 481:	83 ec 0c             	sub    $0xc,%esp
 484:	ff 34 9d a0 15 00 00 	push   0x15a0(,%ebx,4)
 48b:	e8 90 05 00 00       	call   a20 <free>
        valueArray[i] = -1;
        userStackAddr[i] = NULL;
 490:	83 c4 10             	add    $0x10,%esp
        valueArray[i] = -1;
 493:	c7 04 9d a0 14 00 00 	movl   $0xffffffff,0x14a0(,%ebx,4)
 49a:	ff ff ff ff 
        userStackAddr[i] = NULL;
 49e:	c7 04 9d a0 15 00 00 	movl   $0x0,0x15a0(,%ebx,4)
 4a5:	00 00 00 00 
    for(int i=0; i < SIZE; i++) {
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	83 fb 40             	cmp    $0x40,%ebx
 4af:	75 c7                	jne    478 <thread_join+0x28>
      }
    }
  }
  return childPid;
}
 4b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4b4:	89 f0                	mov    %esi,%eax
 4b6:	5b                   	pop    %ebx
 4b7:	5e                   	pop    %esi
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    
 4ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004c0 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4c1:	31 c0                	xor    %eax,%eax
{
 4c3:	89 e5                	mov    %esp,%ebp
 4c5:	53                   	push   %ebx
 4c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 4d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 4d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 4d7:	83 c0 01             	add    $0x1,%eax
 4da:	84 d2                	test   %dl,%dl
 4dc:	75 f2                	jne    4d0 <strcpy+0x10>
    ;
  return os;
}
 4de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4e1:	89 c8                	mov    %ecx,%eax
 4e3:	c9                   	leave  
 4e4:	c3                   	ret    
 4e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
 4f4:	8b 55 08             	mov    0x8(%ebp),%edx
 4f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 4fa:	0f b6 02             	movzbl (%edx),%eax
 4fd:	84 c0                	test   %al,%al
 4ff:	75 17                	jne    518 <strcmp+0x28>
 501:	eb 3a                	jmp    53d <strcmp+0x4d>
 503:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 507:	90                   	nop
 508:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 50c:	83 c2 01             	add    $0x1,%edx
 50f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 512:	84 c0                	test   %al,%al
 514:	74 1a                	je     530 <strcmp+0x40>
    p++, q++;
 516:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 518:	0f b6 19             	movzbl (%ecx),%ebx
 51b:	38 c3                	cmp    %al,%bl
 51d:	74 e9                	je     508 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 51f:	29 d8                	sub    %ebx,%eax
}
 521:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 524:	c9                   	leave  
 525:	c3                   	ret    
 526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 530:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 534:	31 c0                	xor    %eax,%eax
 536:	29 d8                	sub    %ebx,%eax
}
 538:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 53b:	c9                   	leave  
 53c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 53d:	0f b6 19             	movzbl (%ecx),%ebx
 540:	31 c0                	xor    %eax,%eax
 542:	eb db                	jmp    51f <strcmp+0x2f>
 544:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop

00000550 <strlen>:

uint
strlen(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 556:	80 3a 00             	cmpb   $0x0,(%edx)
 559:	74 15                	je     570 <strlen+0x20>
 55b:	31 c0                	xor    %eax,%eax
 55d:	8d 76 00             	lea    0x0(%esi),%esi
 560:	83 c0 01             	add    $0x1,%eax
 563:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 567:	89 c1                	mov    %eax,%ecx
 569:	75 f5                	jne    560 <strlen+0x10>
    ;
  return n;
}
 56b:	89 c8                	mov    %ecx,%eax
 56d:	5d                   	pop    %ebp
 56e:	c3                   	ret    
 56f:	90                   	nop
  for(n = 0; s[n]; n++)
 570:	31 c9                	xor    %ecx,%ecx
}
 572:	5d                   	pop    %ebp
 573:	89 c8                	mov    %ecx,%eax
 575:	c3                   	ret    
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi

00000580 <memset>:

void*
memset(void *dst, int c, uint n)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 587:	8b 4d 10             	mov    0x10(%ebp),%ecx
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 d7                	mov    %edx,%edi
 58f:	fc                   	cld    
 590:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 592:	8b 7d fc             	mov    -0x4(%ebp),%edi
 595:	89 d0                	mov    %edx,%eax
 597:	c9                   	leave  
 598:	c3                   	ret    
 599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005a0 <strchr>:

char*
strchr(const char *s, char c)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5aa:	0f b6 10             	movzbl (%eax),%edx
 5ad:	84 d2                	test   %dl,%dl
 5af:	75 12                	jne    5c3 <strchr+0x23>
 5b1:	eb 1d                	jmp    5d0 <strchr+0x30>
 5b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b7:	90                   	nop
 5b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 5bc:	83 c0 01             	add    $0x1,%eax
 5bf:	84 d2                	test   %dl,%dl
 5c1:	74 0d                	je     5d0 <strchr+0x30>
    if(*s == c)
 5c3:	38 d1                	cmp    %dl,%cl
 5c5:	75 f1                	jne    5b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 5c7:	5d                   	pop    %ebp
 5c8:	c3                   	ret    
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 5d0:	31 c0                	xor    %eax,%eax
}
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <gets>:

char*
gets(char *buf, int max)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 5e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 5e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 5e9:	31 db                	xor    %ebx,%ebx
{
 5eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 5ee:	eb 27                	jmp    617 <gets+0x37>
    cc = read(0, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	6a 00                	push   $0x0
 5f8:	e8 2e 01 00 00       	call   72b <read>
    if(cc < 1)
 5fd:	83 c4 10             	add    $0x10,%esp
 600:	85 c0                	test   %eax,%eax
 602:	7e 1d                	jle    621 <gets+0x41>
      break;
    buf[i++] = c;
 604:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 608:	8b 55 08             	mov    0x8(%ebp),%edx
 60b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 60f:	3c 0a                	cmp    $0xa,%al
 611:	74 1d                	je     630 <gets+0x50>
 613:	3c 0d                	cmp    $0xd,%al
 615:	74 19                	je     630 <gets+0x50>
  for(i=0; i+1 < max; ){
 617:	89 de                	mov    %ebx,%esi
 619:	83 c3 01             	add    $0x1,%ebx
 61c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 61f:	7c cf                	jl     5f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 628:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62b:	5b                   	pop    %ebx
 62c:	5e                   	pop    %esi
 62d:	5f                   	pop    %edi
 62e:	5d                   	pop    %ebp
 62f:	c3                   	ret    
  buf[i] = '\0';
 630:	8b 45 08             	mov    0x8(%ebp),%eax
 633:	89 de                	mov    %ebx,%esi
 635:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 639:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63c:	5b                   	pop    %ebx
 63d:	5e                   	pop    %esi
 63e:	5f                   	pop    %edi
 63f:	5d                   	pop    %ebp
 640:	c3                   	ret    
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <stat>:

int
stat(const char *n, struct stat *st)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	56                   	push   %esi
 654:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 655:	83 ec 08             	sub    $0x8,%esp
 658:	6a 00                	push   $0x0
 65a:	ff 75 08             	push   0x8(%ebp)
 65d:	e8 f1 00 00 00       	call   753 <open>
  if(fd < 0)
 662:	83 c4 10             	add    $0x10,%esp
 665:	85 c0                	test   %eax,%eax
 667:	78 27                	js     690 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 669:	83 ec 08             	sub    $0x8,%esp
 66c:	ff 75 0c             	push   0xc(%ebp)
 66f:	89 c3                	mov    %eax,%ebx
 671:	50                   	push   %eax
 672:	e8 f4 00 00 00       	call   76b <fstat>
  close(fd);
 677:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 67a:	89 c6                	mov    %eax,%esi
  close(fd);
 67c:	e8 ba 00 00 00       	call   73b <close>
  return r;
 681:	83 c4 10             	add    $0x10,%esp
}
 684:	8d 65 f8             	lea    -0x8(%ebp),%esp
 687:	89 f0                	mov    %esi,%eax
 689:	5b                   	pop    %ebx
 68a:	5e                   	pop    %esi
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
 68d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 690:	be ff ff ff ff       	mov    $0xffffffff,%esi
 695:	eb ed                	jmp    684 <stat+0x34>
 697:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69e:	66 90                	xchg   %ax,%ax

000006a0 <atoi>:

int
atoi(const char *s)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	53                   	push   %ebx
 6a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6a7:	0f be 02             	movsbl (%edx),%eax
 6aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 6ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 6b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 6b5:	77 1e                	ja     6d5 <atoi+0x35>
 6b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 6c0:	83 c2 01             	add    $0x1,%edx
 6c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 6c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 6ca:	0f be 02             	movsbl (%edx),%eax
 6cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6d0:	80 fb 09             	cmp    $0x9,%bl
 6d3:	76 eb                	jbe    6c0 <atoi+0x20>
  return n;
}
 6d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d8:	89 c8                	mov    %ecx,%eax
 6da:	c9                   	leave  
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	8b 45 10             	mov    0x10(%ebp),%eax
 6e7:	8b 55 08             	mov    0x8(%ebp),%edx
 6ea:	56                   	push   %esi
 6eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6ee:	85 c0                	test   %eax,%eax
 6f0:	7e 13                	jle    705 <memmove+0x25>
 6f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 6f4:	89 d7                	mov    %edx,%edi
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 700:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 701:	39 f8                	cmp    %edi,%eax
 703:	75 fb                	jne    700 <memmove+0x20>
  return vdst;
}
 705:	5e                   	pop    %esi
 706:	89 d0                	mov    %edx,%eax
 708:	5f                   	pop    %edi
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    

0000070b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 70b:	b8 01 00 00 00       	mov    $0x1,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <exit>:
SYSCALL(exit)
 713:	b8 02 00 00 00       	mov    $0x2,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <wait>:
SYSCALL(wait)
 71b:	b8 03 00 00 00       	mov    $0x3,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <pipe>:
SYSCALL(pipe)
 723:	b8 04 00 00 00       	mov    $0x4,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <read>:
SYSCALL(read)
 72b:	b8 05 00 00 00       	mov    $0x5,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <write>:
SYSCALL(write)
 733:	b8 10 00 00 00       	mov    $0x10,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <close>:
SYSCALL(close)
 73b:	b8 15 00 00 00       	mov    $0x15,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <kill>:
SYSCALL(kill)
 743:	b8 06 00 00 00       	mov    $0x6,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <exec>:
SYSCALL(exec)
 74b:	b8 07 00 00 00       	mov    $0x7,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <open>:
SYSCALL(open)
 753:	b8 0f 00 00 00       	mov    $0xf,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <mknod>:
SYSCALL(mknod)
 75b:	b8 11 00 00 00       	mov    $0x11,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <unlink>:
SYSCALL(unlink)
 763:	b8 12 00 00 00       	mov    $0x12,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <fstat>:
SYSCALL(fstat)
 76b:	b8 08 00 00 00       	mov    $0x8,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <link>:
SYSCALL(link)
 773:	b8 13 00 00 00       	mov    $0x13,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <mkdir>:
SYSCALL(mkdir)
 77b:	b8 14 00 00 00       	mov    $0x14,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    

00000783 <chdir>:
SYSCALL(chdir)
 783:	b8 09 00 00 00       	mov    $0x9,%eax
 788:	cd 40                	int    $0x40
 78a:	c3                   	ret    

0000078b <dup>:
SYSCALL(dup)
 78b:	b8 0a 00 00 00       	mov    $0xa,%eax
 790:	cd 40                	int    $0x40
 792:	c3                   	ret    

00000793 <getpid>:
SYSCALL(getpid)
 793:	b8 0b 00 00 00       	mov    $0xb,%eax
 798:	cd 40                	int    $0x40
 79a:	c3                   	ret    

0000079b <sbrk>:
SYSCALL(sbrk)
 79b:	b8 0c 00 00 00       	mov    $0xc,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <sleep>:
SYSCALL(sleep)
 7a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <uptime>:
SYSCALL(uptime)
 7ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <clone>:
SYSCALL(clone)
 7b3:	b8 16 00 00 00       	mov    $0x16,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <join>:
 7bb:	b8 17 00 00 00       	mov    $0x17,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    
 7c3:	66 90                	xchg   %ax,%ax
 7c5:	66 90                	xchg   %ax,%ax
 7c7:	66 90                	xchg   %ax,%ax
 7c9:	66 90                	xchg   %ax,%ax
 7cb:	66 90                	xchg   %ax,%ax
 7cd:	66 90                	xchg   %ax,%ax
 7cf:	90                   	nop

000007d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 3c             	sub    $0x3c,%esp
 7d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7dc:	89 d1                	mov    %edx,%ecx
{
 7de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 7e1:	85 d2                	test   %edx,%edx
 7e3:	0f 89 7f 00 00 00    	jns    868 <printint+0x98>
 7e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7ed:	74 79                	je     868 <printint+0x98>
    neg = 1;
 7ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 7f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 7f8:	31 db                	xor    %ebx,%ebx
 7fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 800:	89 c8                	mov    %ecx,%eax
 802:	31 d2                	xor    %edx,%edx
 804:	89 cf                	mov    %ecx,%edi
 806:	f7 75 c4             	divl   -0x3c(%ebp)
 809:	0f b6 92 40 0c 00 00 	movzbl 0xc40(%edx),%edx
 810:	89 45 c0             	mov    %eax,-0x40(%ebp)
 813:	89 d8                	mov    %ebx,%eax
 815:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 818:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 81b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 81e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 821:	76 dd                	jbe    800 <printint+0x30>
  if(neg)
 823:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 826:	85 c9                	test   %ecx,%ecx
 828:	74 0c                	je     836 <printint+0x66>
    buf[i++] = '-';
 82a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 82f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 831:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 836:	8b 7d b8             	mov    -0x48(%ebp),%edi
 839:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 83d:	eb 07                	jmp    846 <printint+0x76>
 83f:	90                   	nop
    putc(fd, buf[i]);
 840:	0f b6 13             	movzbl (%ebx),%edx
 843:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 846:	83 ec 04             	sub    $0x4,%esp
 849:	88 55 d7             	mov    %dl,-0x29(%ebp)
 84c:	6a 01                	push   $0x1
 84e:	56                   	push   %esi
 84f:	57                   	push   %edi
 850:	e8 de fe ff ff       	call   733 <write>
  while(--i >= 0)
 855:	83 c4 10             	add    $0x10,%esp
 858:	39 de                	cmp    %ebx,%esi
 85a:	75 e4                	jne    840 <printint+0x70>
}
 85c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 85f:	5b                   	pop    %ebx
 860:	5e                   	pop    %esi
 861:	5f                   	pop    %edi
 862:	5d                   	pop    %ebp
 863:	c3                   	ret    
 864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 868:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 86f:	eb 87                	jmp    7f8 <printint+0x28>
 871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop

00000880 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 889:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 88c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 88f:	0f b6 13             	movzbl (%ebx),%edx
 892:	84 d2                	test   %dl,%dl
 894:	74 6a                	je     900 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 896:	8d 45 10             	lea    0x10(%ebp),%eax
 899:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 89c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 89f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 8a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8a4:	eb 36                	jmp    8dc <printf+0x5c>
 8a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
 8b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 8b3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 8b8:	83 f8 25             	cmp    $0x25,%eax
 8bb:	74 15                	je     8d2 <printf+0x52>
  write(fd, &c, 1);
 8bd:	83 ec 04             	sub    $0x4,%esp
 8c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 8c3:	6a 01                	push   $0x1
 8c5:	57                   	push   %edi
 8c6:	56                   	push   %esi
 8c7:	e8 67 fe ff ff       	call   733 <write>
 8cc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 8cf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 8d2:	0f b6 13             	movzbl (%ebx),%edx
 8d5:	83 c3 01             	add    $0x1,%ebx
 8d8:	84 d2                	test   %dl,%dl
 8da:	74 24                	je     900 <printf+0x80>
    c = fmt[i] & 0xff;
 8dc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 8df:	85 c9                	test   %ecx,%ecx
 8e1:	74 cd                	je     8b0 <printf+0x30>
      }
    } else if(state == '%'){
 8e3:	83 f9 25             	cmp    $0x25,%ecx
 8e6:	75 ea                	jne    8d2 <printf+0x52>
      if(c == 'd'){
 8e8:	83 f8 25             	cmp    $0x25,%eax
 8eb:	0f 84 07 01 00 00    	je     9f8 <printf+0x178>
 8f1:	83 e8 63             	sub    $0x63,%eax
 8f4:	83 f8 15             	cmp    $0x15,%eax
 8f7:	77 17                	ja     910 <printf+0x90>
 8f9:	ff 24 85 e8 0b 00 00 	jmp    *0xbe8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 900:	8d 65 f4             	lea    -0xc(%ebp),%esp
 903:	5b                   	pop    %ebx
 904:	5e                   	pop    %esi
 905:	5f                   	pop    %edi
 906:	5d                   	pop    %ebp
 907:	c3                   	ret    
 908:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop
  write(fd, &c, 1);
 910:	83 ec 04             	sub    $0x4,%esp
 913:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 916:	6a 01                	push   $0x1
 918:	57                   	push   %edi
 919:	56                   	push   %esi
 91a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 91e:	e8 10 fe ff ff       	call   733 <write>
        putc(fd, c);
 923:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 927:	83 c4 0c             	add    $0xc,%esp
 92a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 92d:	6a 01                	push   $0x1
 92f:	57                   	push   %edi
 930:	56                   	push   %esi
 931:	e8 fd fd ff ff       	call   733 <write>
        putc(fd, c);
 936:	83 c4 10             	add    $0x10,%esp
      state = 0;
 939:	31 c9                	xor    %ecx,%ecx
 93b:	eb 95                	jmp    8d2 <printf+0x52>
 93d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 940:	83 ec 0c             	sub    $0xc,%esp
 943:	b9 10 00 00 00       	mov    $0x10,%ecx
 948:	6a 00                	push   $0x0
 94a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 94d:	8b 10                	mov    (%eax),%edx
 94f:	89 f0                	mov    %esi,%eax
 951:	e8 7a fe ff ff       	call   7d0 <printint>
        ap++;
 956:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 95a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 95d:	31 c9                	xor    %ecx,%ecx
 95f:	e9 6e ff ff ff       	jmp    8d2 <printf+0x52>
 964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 968:	8b 45 d0             	mov    -0x30(%ebp),%eax
 96b:	8b 10                	mov    (%eax),%edx
        ap++;
 96d:	83 c0 04             	add    $0x4,%eax
 970:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 973:	85 d2                	test   %edx,%edx
 975:	0f 84 8d 00 00 00    	je     a08 <printf+0x188>
        while(*s != 0){
 97b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 97e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 980:	84 c0                	test   %al,%al
 982:	0f 84 4a ff ff ff    	je     8d2 <printf+0x52>
 988:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 98b:	89 d3                	mov    %edx,%ebx
 98d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 990:	83 ec 04             	sub    $0x4,%esp
          s++;
 993:	83 c3 01             	add    $0x1,%ebx
 996:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 999:	6a 01                	push   $0x1
 99b:	57                   	push   %edi
 99c:	56                   	push   %esi
 99d:	e8 91 fd ff ff       	call   733 <write>
        while(*s != 0){
 9a2:	0f b6 03             	movzbl (%ebx),%eax
 9a5:	83 c4 10             	add    $0x10,%esp
 9a8:	84 c0                	test   %al,%al
 9aa:	75 e4                	jne    990 <printf+0x110>
      state = 0;
 9ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 9af:	31 c9                	xor    %ecx,%ecx
 9b1:	e9 1c ff ff ff       	jmp    8d2 <printf+0x52>
 9b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 9c0:	83 ec 0c             	sub    $0xc,%esp
 9c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9c8:	6a 01                	push   $0x1
 9ca:	e9 7b ff ff ff       	jmp    94a <printf+0xca>
 9cf:	90                   	nop
        putc(fd, *ap);
 9d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 9d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 9d6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 9d8:	6a 01                	push   $0x1
 9da:	57                   	push   %edi
 9db:	56                   	push   %esi
        putc(fd, *ap);
 9dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9df:	e8 4f fd ff ff       	call   733 <write>
        ap++;
 9e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9eb:	31 c9                	xor    %ecx,%ecx
 9ed:	e9 e0 fe ff ff       	jmp    8d2 <printf+0x52>
 9f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 9f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 9fb:	83 ec 04             	sub    $0x4,%esp
 9fe:	e9 2a ff ff ff       	jmp    92d <printf+0xad>
 a03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a07:	90                   	nop
          s = "(null)";
 a08:	ba de 0b 00 00       	mov    $0xbde,%edx
        while(*s != 0){
 a0d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 a10:	b8 28 00 00 00       	mov    $0x28,%eax
 a15:	89 d3                	mov    %edx,%ebx
 a17:	e9 74 ff ff ff       	jmp    990 <printf+0x110>
 a1c:	66 90                	xchg   %ax,%ax
 a1e:	66 90                	xchg   %ax,%ax

00000a20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a21:	a1 a0 16 00 00       	mov    0x16a0,%eax
{
 a26:	89 e5                	mov    %esp,%ebp
 a28:	57                   	push   %edi
 a29:	56                   	push   %esi
 a2a:	53                   	push   %ebx
 a2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 a2e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a38:	89 c2                	mov    %eax,%edx
 a3a:	8b 00                	mov    (%eax),%eax
 a3c:	39 ca                	cmp    %ecx,%edx
 a3e:	73 30                	jae    a70 <free+0x50>
 a40:	39 c1                	cmp    %eax,%ecx
 a42:	72 04                	jb     a48 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a44:	39 c2                	cmp    %eax,%edx
 a46:	72 f0                	jb     a38 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a48:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a4b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a4e:	39 f8                	cmp    %edi,%eax
 a50:	74 30                	je     a82 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a52:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a55:	8b 42 04             	mov    0x4(%edx),%eax
 a58:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a5b:	39 f1                	cmp    %esi,%ecx
 a5d:	74 3a                	je     a99 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a5f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a61:	5b                   	pop    %ebx
  freep = p;
 a62:	89 15 a0 16 00 00    	mov    %edx,0x16a0
}
 a68:	5e                   	pop    %esi
 a69:	5f                   	pop    %edi
 a6a:	5d                   	pop    %ebp
 a6b:	c3                   	ret    
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a70:	39 c2                	cmp    %eax,%edx
 a72:	72 c4                	jb     a38 <free+0x18>
 a74:	39 c1                	cmp    %eax,%ecx
 a76:	73 c0                	jae    a38 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a78:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a7b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a7e:	39 f8                	cmp    %edi,%eax
 a80:	75 d0                	jne    a52 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a82:	03 70 04             	add    0x4(%eax),%esi
 a85:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a88:	8b 02                	mov    (%edx),%eax
 a8a:	8b 00                	mov    (%eax),%eax
 a8c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a8f:	8b 42 04             	mov    0x4(%edx),%eax
 a92:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a95:	39 f1                	cmp    %esi,%ecx
 a97:	75 c6                	jne    a5f <free+0x3f>
    p->s.size += bp->s.size;
 a99:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a9c:	89 15 a0 16 00 00    	mov    %edx,0x16a0
    p->s.size += bp->s.size;
 aa2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 aa5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 aa8:	89 0a                	mov    %ecx,(%edx)
}
 aaa:	5b                   	pop    %ebx
 aab:	5e                   	pop    %esi
 aac:	5f                   	pop    %edi
 aad:	5d                   	pop    %ebp
 aae:	c3                   	ret    
 aaf:	90                   	nop

00000ab0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	57                   	push   %edi
 ab4:	56                   	push   %esi
 ab5:	53                   	push   %ebx
 ab6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 abc:	8b 3d a0 16 00 00    	mov    0x16a0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac2:	8d 70 07             	lea    0x7(%eax),%esi
 ac5:	c1 ee 03             	shr    $0x3,%esi
 ac8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 acb:	85 ff                	test   %edi,%edi
 acd:	0f 84 9d 00 00 00    	je     b70 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 ad5:	8b 4a 04             	mov    0x4(%edx),%ecx
 ad8:	39 f1                	cmp    %esi,%ecx
 ada:	73 6a                	jae    b46 <malloc+0x96>
 adc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 ae1:	39 de                	cmp    %ebx,%esi
 ae3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 ae6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 aed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 af0:	eb 17                	jmp    b09 <malloc+0x59>
 af2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 afa:	8b 48 04             	mov    0x4(%eax),%ecx
 afd:	39 f1                	cmp    %esi,%ecx
 aff:	73 4f                	jae    b50 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b01:	8b 3d a0 16 00 00    	mov    0x16a0,%edi
 b07:	89 c2                	mov    %eax,%edx
 b09:	39 d7                	cmp    %edx,%edi
 b0b:	75 eb                	jne    af8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 b0d:	83 ec 0c             	sub    $0xc,%esp
 b10:	ff 75 e4             	push   -0x1c(%ebp)
 b13:	e8 83 fc ff ff       	call   79b <sbrk>
  if(p == (char*)-1)
 b18:	83 c4 10             	add    $0x10,%esp
 b1b:	83 f8 ff             	cmp    $0xffffffff,%eax
 b1e:	74 1c                	je     b3c <malloc+0x8c>
  hp->s.size = nu;
 b20:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b23:	83 ec 0c             	sub    $0xc,%esp
 b26:	83 c0 08             	add    $0x8,%eax
 b29:	50                   	push   %eax
 b2a:	e8 f1 fe ff ff       	call   a20 <free>
  return freep;
 b2f:	8b 15 a0 16 00 00    	mov    0x16a0,%edx
      if((p = morecore(nunits)) == 0)
 b35:	83 c4 10             	add    $0x10,%esp
 b38:	85 d2                	test   %edx,%edx
 b3a:	75 bc                	jne    af8 <malloc+0x48>
        return 0;
  }
}
 b3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b3f:	31 c0                	xor    %eax,%eax
}
 b41:	5b                   	pop    %ebx
 b42:	5e                   	pop    %esi
 b43:	5f                   	pop    %edi
 b44:	5d                   	pop    %ebp
 b45:	c3                   	ret    
    if(p->s.size >= nunits){
 b46:	89 d0                	mov    %edx,%eax
 b48:	89 fa                	mov    %edi,%edx
 b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b50:	39 ce                	cmp    %ecx,%esi
 b52:	74 4c                	je     ba0 <malloc+0xf0>
        p->s.size -= nunits;
 b54:	29 f1                	sub    %esi,%ecx
 b56:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b59:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b5c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 b5f:	89 15 a0 16 00 00    	mov    %edx,0x16a0
}
 b65:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b68:	83 c0 08             	add    $0x8,%eax
}
 b6b:	5b                   	pop    %ebx
 b6c:	5e                   	pop    %esi
 b6d:	5f                   	pop    %edi
 b6e:	5d                   	pop    %ebp
 b6f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 b70:	c7 05 a0 16 00 00 a4 	movl   $0x16a4,0x16a0
 b77:	16 00 00 
    base.s.size = 0;
 b7a:	bf a4 16 00 00       	mov    $0x16a4,%edi
    base.s.ptr = freep = prevp = &base;
 b7f:	c7 05 a4 16 00 00 a4 	movl   $0x16a4,0x16a4
 b86:	16 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b89:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 b8b:	c7 05 a8 16 00 00 00 	movl   $0x0,0x16a8
 b92:	00 00 00 
    if(p->s.size >= nunits){
 b95:	e9 42 ff ff ff       	jmp    adc <malloc+0x2c>
 b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ba0:	8b 08                	mov    (%eax),%ecx
 ba2:	89 0a                	mov    %ecx,(%edx)
 ba4:	eb b9                	jmp    b5f <malloc+0xaf>
