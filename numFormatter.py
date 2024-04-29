# script to format 16 bit hex numbers into nicely padded 32 bit hex numbers

toConvert = []
converted = []
hexDigits = "0123456789abcdef"
print("Numbers to convert:")
temp = input()
while temp!="":
    toConvert.append(temp)
    temp = input()
print(toConvert)

def padTo8(num):
    num = "0" * (8 - len(num)) + num
    return num


"""def complement(num):
    complementNum = ""
    # invert
    for digit in num:
        val = hexDigits.index(digit)
        val = 15 - val
        complementNum+=hexDigits[val]
    # add 1
    if complementNum[-1] != 'f': # no overflow
        complementNum = complementNum[0:-1] + hexDigits[hexDigits.index(complementNum[-1])+1]
        return complementNum
    # dealing with overflow:
    i = -1
    while complementNum[i] == 'f':
        complementNum = complementNum[:i] + '0' + complementNum[i+1:]
        i-=1
    complementNum = complementNum[:i] + hexDigits[hexDigits.index(complementNum[i])+1] + complementNum[i+1:]
    return complementNum
"""
def convert(num):
    if len(num) < 4:
        return padTo8(num)
    if int(num[0], base=16) < 8: # first bit is 0 -> number is positive
        return padTo8(num)
    # dealing with a negative:
    return "f"*4 + num

    

for num in toConvert:
    converted.append("0x" + convert(num).upper())

for num in converted:
    print(num, end=", ")