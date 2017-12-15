def delimiters_matching?(str)
        chars = str.split('')
        stack = []
        op_del = { 
                '{' => '}',
                '[' => ']',
                '(' => ')'
        }
        cl_del = {
                '}' => '{',
                ']' => '[',
                ')' => '('
        }

        i = 0
        while i < str.length
                if cl_del[str[i]]
                        return false if stack[stack.length - 1] != cl_del[str[i]]
                        stack.pop
                end
                stack << str[i] if op_del[str[i]]
                i += 1
        end

        stack.length == 0 ? true : false
end

puts delimiters_matching?('() => { console.log([1,2,3]) }')
puts delimiters_matching?('([)]')
