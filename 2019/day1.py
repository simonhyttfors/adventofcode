def sol1(input_list):
    val = 0

    for freq in input_list:
        val += int(freq)

    return val

def sol1_1(input_list):
    return sum(input_list)

def sol2(input_list):
    val  = 0
    past = set()

    while True:
        for freq in input_list:
            val += freq

            if val in past:
                return val

            past.add(val)

with open('input.txt') as input_file:
    input_list = [eval(x) for x in input_file.readlines()]

print sol1_1(input_list)
print sol2(input_list)
