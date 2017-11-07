
# return indicies of string containing substring

def sub_strings(str, sub_str)
  len = sub_str.length
  prime = 101
  sub_str_hash = hash(sub_str, prime)
  prev_hash = nil
  sub_indicies = []

  i = 0
  while (i + len - 1) < str.length
    str_window = str[i...(i + len)]

    if prev_hash.nil?
      prev_hash = hash(str_window, prime)
    else
      dropped_char = str[i-1]
      prev_hash = hash_from_prev(str_window, dropped_char, prev_hash, prime)
    end

    if prev_hash == sub_str_hash
      sub_indicies << i if is_match?(sub_str, str_window)
    end

    i += 1
  end

  sub_indicies
end

def hash(str, prime)
  h = 0
  str.each_char.with_index { |c, i| h += c.ord * (prime ** i) }
  h
end

def hash_from_prev(str_window, dropped_char, prev_hash, prime)
  h = (prev_hash - dropped_char.ord) / prime
  h + str_window[-1].ord * prime ** (str_window.length - 1)
end

def is_match?(sub_str, str_window)
  sub_str.each_char.with_index { |c, i| return false if c != str_window[i] }
  true
end

puts sub_strings('abcr!gh', 'cr!g')
