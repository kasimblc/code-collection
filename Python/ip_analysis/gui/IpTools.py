def dot_decimal_to_binary(address):
    list_of_parts = address.split(".")
    res = ""
    for part in list_of_parts:
        p = from_decimal_to_binary(int(part))
        res += str(p)
    return res


def from_decimal_to_binary(n):
    res = ""
    while True:
        digit = n % 2
        res += str(digit)
        n = n // 2
        if n == 0:
            break
    if len(res) < 8:
        while True:
            res += "0"
            if len(res) == 8:
                break
    return res[-1::-1]


def count_ones(net_mask):
    mask_list = net_mask.split(".")
    res = ""
    for elem in mask_list:
        part = from_decimal_to_binary(int(elem))
        res += part
    count = 0
    for i in range(len(res)):
        if res[i] == "1":
            count += 1
    return count


def binary_to_dot_decimal(binary_number):
    res = ""
    low = 0
    high = 8
    for i in range(4):
        part = binary_number[low:high]
        _help = int(part, 2)
        res += str(_help)
        res += "."
        low += 8
        high += 8
    return res.strip(".")


def make_net_mask(number_of_ones):
    curr = ""
    for i in range(number_of_ones):
        curr += "1"
    if len(curr) < 32:
        while True:
            curr += "0"
            if len(curr) == 32:
                break
    return binary_to_dot_decimal(curr)


def make_broadcast_mask(net_mask):
    mask_parts = net_mask.split(".")
    res = ""
    for i in range(4):
        part = int(mask_parts[i]) ^ 0xff
        res += str(part)
        res += "."
    return res.strip(".")


def calculate_net_id(ip, mask):
    ip_parts = ip.split(".")
    mask_parts = mask.split(".")
    res = ""
    for i in range(4):
        part = int(ip_parts[i]) & int(int(mask_parts[i]))
        res += str(part)
        res += "."
    return res.strip(".")


def calculate_broadcast_address(ip, net_mask):
    broadcast_mask = make_broadcast_mask(net_mask)
    broad_parts = broadcast_mask.split(".")
    ip_parts = ip.split(".")
    res = ""
    for i in range(4):
        part = int(ip_parts[i]) | int(broad_parts[i])
        res += str(part)
        res += "."
    return res.strip(".")


def max_hosts(number_of_ones):
    return 2 ** (32 - number_of_ones) - 2


def calculate_all_parameters(ip, net_mask):
    ip_id = calculate_net_id(ip, net_mask)
    ip_id_parts = ip_id.split(".")
    ip_id_parts[3] = str(int(ip_id_parts[3]) + 1)

    broadcast = calculate_broadcast_address(ip, net_mask)
    broadcast_parts = broadcast.split(".")
    broadcast_parts[3] = str(int(broadcast_parts[3]) - 1)

    first = ""
    last = ""
    for i in range(4):
        first += ip_id_parts[i]
        last += broadcast_parts[i]
        first += "."
        last += "."
    first = first.strip(".")
    last = last.strip(".")

    max_number_of_hosts = max_hosts(count_ones(net_mask))
    return ip_id, first, last, broadcast, max_number_of_hosts


if __name__ == '__main__':
    ip = input("Enter ip: ")
    net = input("Ağ Maskesi sayısını yada Ağ Maskesini giriniz: ")
    list = net.split(".")
    if len(list) < 4:
        net = make_net_mask(int(net))
    a = calculate_all_parameters(ip, net)
    for elem in a:
        print(elem)
