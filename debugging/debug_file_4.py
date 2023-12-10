# The function expects an integer
def palindrome(number):
    number = int(number)
    print("original number", number)
    original_num = number
    
    # reverse the given number
    reverse_num = 0
    while number > 0:
        reminder = number % 10
        reverse_num = (reverse_num * 10) + reminder
        number = number // 10

    # check numbers
    if original_num != reverse_num:
        # print("Given number is a palindrome")
        print("Given number is not a palindrome")
    else:
        # print("Given number is not a palindrome")
        print("Given number is a palindrome")

a = palindrome('11881118811')
print(f'a: {a}')
b = palindrome(125542628)
print(f'b: {b}')
c = palindrome(123789987321)
print(f'c: {c}')
# NOT COMPLETED!