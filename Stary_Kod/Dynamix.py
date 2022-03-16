def checksum(lista):
    sum =0
    for el in lista:
        sum = sum + el

    sum = sum - 0xFF - 0xFF
    sum = bytes(sum)
    sum = ~sum
    sum = int(sum)
    lista.append(sum)


a = [0xFF,0xFF,0xFE,0x05,0x03,0x1E,0x00,0x02]
checksum(a)
print(a)
