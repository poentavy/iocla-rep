%include "../include/io.mac"

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    mov [N], eax ; salvam n-ul
    mov [high], eax ; valoarea maxima
    mov DWORD [low], 0 ; valoarea minima pentru y
    mov DWORD [xPos], 0 ; pozitia x
    mov DWORD [yPos], 0 ; pozitia y
    mov DWORD [dir], 0 ; directia de deplasare (0 - dreapta, 1 - jos, 2 - stanga, 3 - sus)
    mov DWORD [xlow], -1 ; valoarea minima pentru x

    loop:
        mov al, [ebx] ; luam plain textl

        cmp al, 0 ; daca dam de null terminator putem iesi
        je done

        mov esi, [xPos]
        mov edi, [yPos]
        push esi
        push edi

        push ebx
        mov ebx, [N]
        push eax
        mov eax, edi
        push edx
        mul ebx ; calculam offsetul in matrice (offset = y * n + x)
        pop edx
        mov edi, eax
        pop eax
        add esi, edi
        pop ebx

        mov ah, [ecx + esi * 4] ; scoatem cheia

        add al, ah
        mov [edx], al ; punem rezultatul

        pop edi
        pop esi

        check:
        cmp DWORD [dir], 0 ; daca mergeam in dreapta si am ajuns in capat, mutam directia in jos
        jne check2
        inc esi
        cmp esi, [high]
        jne n1
        mov DWORD [dir], 1
        dec esi
        inc edi
        n1:
        mov [xPos], esi
        mov [yPos], edi
        jmp next

        check2: ; daca mergem in jos si ma ajuns in capat, mutam directia in stanga
        cmp DWORD [dir], 1
        jne check3
        inc edi
        cmp edi, [high]
        jne n2
        mov DWORD [dir], 2
        dec edi
        dec esi
        n2:
        mov [xPos], esi
        mov [yPos], edi
        jmp next

        check3: ; daca mergem la stanga si am ajuns in capat, mutam directia in sus
        cmp DWORD [dir], 2
        jne check4
        dec esi
        cmp esi, [xlow]
        jne n3
        mov DWORD [dir], 3
        dec DWORD [high]
        inc esi
        dec edi
        n3:
        mov [xPos], esi
        mov [yPos], edi
        jmp next

        check4: ; daca mergeam in sus si am ajuns in capat, mutam directia in dreapta
        dec edi
        cmp edi, [low]
        jne n4
        mov DWORD [dir], 0
        inc DWORD [low]
        inc DWORD [xlow]
        inc edi
        inc esi
        n4:
        mov [xPos], esi
        mov [yPos], edi

        next:
        inc ebx
        inc edx
    jmp loop

section .data
    xPos: dd 0
    yPos: dd 0
    dir: dd 0
    N: dd 0
    high: dd 0
    low: dd 0
    xlow: dd -1

section .text

    done:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
    
