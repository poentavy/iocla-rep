%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor ecx, ecx
    xor edx, edx

    mov cx, [ebx + point.x] ; points[0].x
    mov dx, [ebx + 4 + point.x] ; points[1].x
    cmp cx, dx
    jne res

    Y:
    mov cx, [ebx + point.y] ; points[0].y
    mov dx, [ebx + 4 + point.y] ; points[1].y

    res:
    cmp cx, dx
    ja putRes
    xchg cx, dx

    putRes:
    sub cx, dx
    mov [eax], ecx
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY