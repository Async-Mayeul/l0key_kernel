read_port:
  mov edx, [esp + 4]
  in al, dx
  re 

write_port:
  mov edx, [esp + 4]
  mov al, [esp + 4 + 4]
  out dx, al
  ret
