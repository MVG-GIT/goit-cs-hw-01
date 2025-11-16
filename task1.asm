org  0x100               ; Вказуємо, що це програма .COM

section .data
    a db 5               ; Визначаємо a = 5
    b db 3               ; Визначаємо b = 3
    c db 2               ; Визначаємо c = 2
    resultMsg db 'Result: $' ; Визначення рядка для виведення результату

section .text
_start:
    mov al, [b]          ; Завантажуємо b в AL
    sub al, [c]          ; Віднімаємо c від b  (AL = b - c)
    add al, [a]          ; Додаємо a до результату  (AL = b - c + a)

    add al, 30h          ; Перетворюємо число в ASCII символ (для однозначних чисел)

    ; Виведення тексту "Result: "
    mov ah, 09h
    lea dx, resultMsg
    int 21h

    ; Виведення результату
    mov dl, al
    mov ah, 02h
    int 21h

    ; Завершення програми
    mov ax, 4C00h
    int 21h
