%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    encrypt:
        mov al, [esi]
        add al, dl
        cmp al, 90 ; Ascii 90 = 'Z'
        jbe move
        sub al, 26 ; Scadem 26 pentru a primi un caracter in limita alfabetului
    move:
        mov [edi], al
        inc esi
        inc edi
        dec ecx
    jnz encrypt



    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
