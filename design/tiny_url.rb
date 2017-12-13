CHAR_MAP = {}

down = ('a'..'z').to_a
up = ('A'..'Z').to_a
nums = (0..9).to_a
chars = down + up + nums
chars.each_with_index { |ch, i| CHAR_MAP[i] = ch }

def to_base_62(num)
  nums = []
  while num > 0
    nums << num % 62
    num /= 62
  end
  nums
end

def get_tiny_url(url)
  h = url.hash.abs
  shorter_h = h.to_s[0..13].to_i
  nums = to_base_62(shorter_h)
  nums.map { |n| CHAR_MAP[n] }.join('')
end

puts get_tiny_url('http://google.com/search?q=asdfkjsalfksajfdlkasjdflaksjdfdfjalsdkfjalsd')
