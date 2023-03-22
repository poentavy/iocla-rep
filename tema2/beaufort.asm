%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    xor edi, edi ; edi - counter
    
    loop:
        push eax
        mov al, [ebx + edi]
        sub al, 65 ; al - column

        push ebx
        mov ebx, edi

        normalizeKey:
            cmp ebx, ecx
            jb getKey
            sub ebx, ecx
        jmp normalizeKey

        getKey:
        mov ah, [edx + ebx] ; key[i]
        sub ah, 65
        push edx
        push ecx
        xor edx, edx
        mov dl, ah ; edx - row
        xor ah, ah ; eax - column
        mov ecx, 26
        sub ecx, eax ; 26 - column = offset
        add ecx, edx ; offset + row = character
        cmp ecx, 26
        jb put
        sub ecx, 26

        put:
        add ecx, 65 ; ascii
        mov [esi + edi], cl

        pop ecx
        pop edx
        pop ebx
        pop eax
        inc edi
        cmp edi, eax
    jne loop

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
