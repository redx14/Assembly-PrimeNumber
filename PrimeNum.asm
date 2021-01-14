include irvine32.inc
Title PrimeNum
.data
  numin     dw 0
  divisor   dw 0
  count     dw 5
  inMsg     db "Enter A Number Here: ",0
  prime     db " Is a Prime Number",0
  Noprime   db " Is NOT a Prime Number",0
 .code
   main proc
   mov ecx,5
InLooP:
   call GetNum
   call IsPrime
   dec count
   cmp count,0
   jg InLoop
   jmp EndItAll
;=============================================
 GetNum proc
   GetIt:
     mov edx,offset inMsg
     call writestring
     call readint
     mov numin,ax
     call crlf
  ret
  GetNum endp
;=================================================
IsPrime proc
  PrimeNum:
    sub edx,edx
    mov divisor,2
    call writedec
    div divisor
    cmp edx,0
    je NotPrime
    ;push ecx
    mov ecx,eax
 Ploop:
   inc divisor
   sub edx,edx
   mov ax,numin
   div divisor
   cmp edx,0
   je NotPrime
   loop Ploop
  mov edx,offset prime
  mov ax,numin
  ;call writedec
  call writestring
  call crlf
  jmp EndPrime
  NotPrime:
    mov edx,offset NoPrime
    call writestring
    call crlf
  EndPrime:
  ret
  IsPrime endp
EndItAll:
  exit
  main endp
  end main
