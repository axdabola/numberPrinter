%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    call start
    xor eax, eax
    ret ;end of program
    
start:
    GET_DEC 4, ebx ;base val
    GET_DEC 4, edx ;max val
    cmp ebx, edx ;compare base val with max val
    jg err ;if ebx > edx, goto end
    mov ecx, ebx ;counter starts at base value
    call cycle ;start cycle
    
cycle:
    PRINT_DEC 4, ecx ;print counter
    PRINT_CHAR ' ' ;print space
    inc ecx ;increment counter
    cmp ecx,edx ;compare counter with max cycle val
    jge end ; if ecx >= edx, goto end
    call cycle ; else goto cycle

end:
    lea eax, [0] ;clear eax before return
    ret ;return eax
    
err:
    stc ;set carry flag
    PRINT_STRING "Error, base value is greater than max value." ;display error type
    NEWLINE
    lea eax, [0] ;clear eax before return
    ret ;return eax