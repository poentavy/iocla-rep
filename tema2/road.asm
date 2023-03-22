%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    dec ecx
    loop:
        push ecx
        xor ecx, ecx
        xor edx, edx

        ; Same as in task 1 (aproape)
        mov cx, [eax + point.x] ; points[0].x
        mov dx, [eax + 4 + point.x] ; points[1].x
        cmp cx, dx
        jne res

        Y:
        mov cx, [eax + point.y] ; points[0].y
        mov dx, [eax + 4 + point.y] ; points[1].y

        res:
        cmp cx, dx
        ja putRes
        xchg cx, dx

        putRes:
        sub cx, dx
        mov [ebx], ecx

        add eax, 4
        add ebx, 4

        pop ecx
        dec ecx
    jnz loop


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY