%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    loop:
        push eax

        ; Implementing C code:
        ; for (int i = 1; i * i <= n; i++) {
        ;   if ((n % i == 0) && (n / i == i)) {
        ;       return true;
        ;   }
        ; }
        ; return false;
        push ecx
        mov eax, 1
        mov ecx, [ebx] ; ecx = dist

        cmp ecx, 0 ; caz special pentru 0
        je true

        for:
            mov edi, eax ; edi = i

            mul eax ; eax = i * i
            cmp eax, ecx
            ja false ; i * i <= n

            mov eax, ecx
            div edi

            cmp edx, 0 ; n % i == 0
            jne next

            cmp eax, edi ; n / i == i
            jne next

            jmp true

            next:
            mov eax, edi
            inc eax
        jmp for

        false:
        pop ecx
        mov DWORD [ecx], 0
        jmp nextLoop

        true:
        pop ecx
        mov DWORD [ecx], 1

        nextLoop:
        add ebx, 4
        add ecx, 4
        pop eax
        dec eax
    jnz loop

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY