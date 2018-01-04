def get_missing_nums(arr)
        potentials = Array.new(9) {true}
        arr.each { |n| potentials[n - 1] = false }
        missing = []
        potentials.each_with_index { |pt, i| missing << i + 1 if pt }
        missing
end

# arr = [1,3,5,6,7,6,5,6,6,6,5,6,6,6,5,6,6,6,5,6,6,6,5,6,6,6,5,6,6]
# p arr
# p get_missing_nums(arr)

def get_row(matrix, row)
        matrix[row].select { |n| !n.nil? }
end

def get_col(matrix, col)
        nums = []
        matrix.each do |row|
                nums << row[col] unless row[col].nil?
        end
        nums
end

def get_cube(matrix, row, col)
        cube_row = row / 3 * 3
        cube_col = col / 3 * 3
        row_end = cube_row + 3
        col_end = cube_col + 3
        nums = []
        
        (cube_row...row_end).each do |row|
                (cube_col...col_end).each do |col|
                        num = matrix[row][col]
                        nums << num unless num.nil?
                end
        end

        nums
end

def potential_moves(sudoku, row, col)
        r_n = get_row(sudoku, row)
        c_n = get_col(sudoku, col)
        cube = get_cube(sudoku, row, col)
        arr = r_n + c_n + cube
        get_missing_nums(arr)
end

def get_row_pts(sudoku, potentials, row)
        sudoku[row].map.with_index { |_, c| potentials[row][c] }.select { |a| a.kind_of?(Array) }.flatten 
end

def get_col_pts(sudoku, potentials, col)
        sudoku.map.with_index { |_, r| potentials[r][col] }.select { |a| a.kind_of?(Array) }.flatten
end

def inverse_moves(sudoku, potentials, row, col)
#       cube_pts = get_inv_cube_pts(sudoku, potentials, row, col)
        row_pts = get_row_pts(sudoku, potentials, row)
        col_pts = get_col_pts(sudoku, potentials, col)
        p get_missing_nums(row_pts + col_pts)
end


def solve_sudoku(sudoku)
       potentials = Array.new(9) { Array.new(9) { nil } }
       over = false

       until over
                over = true
                sudoku.length.times do |row|
                          sudoku.length.times do |col|
                                  next unless sudoku[row][col].nil?
                                  #inverse_moves(sudoku, potentials, row, col)
                                  pt_mvs = potential_moves(sudoku, row, col)
                                  if pt_mvs.length == 1
                                          sudoku[row][col] = pt_mvs[0]
                                          potentials[row][col] = nil if potentials[row][col]
                                          over = false
                                  else
                                          potentials[row][col] = pt_mvs
                                  end
                          end
                end
        end

        return sudoku
end

def solved?(sudoku)
        sudoku.flatten.select { |i| !i.nil? }.length == 9 * 9
end

# easy
s1 = [
        [nil, 2, nil, nil, 8, nil, nil, nil, nil],
        [1, 5, 8, nil, 6, nil, nil, nil, 4], 
        [9, nil, nil, 1, 2, 5, nil, 6, nil],
        [7, 1, nil, nil, 4, nil, 3, nil, nil],
        [4, 9, nil, nil, nil, nil, nil, 2, 1],
        [nil, nil, 3, nil, 5, nil, nil, 4, 9],
        [nil, 7, nil, 2, 9, 4, nil, nil, 5],
        [3, nil, nil, nil, 1, nil, 4, 7, 2], 
        [nil, nil, nil, nil, 3, nil, nil, 1, nil]
 ]

# hard!!
s2 = [
        [nil, nil, nil, 5, nil, nil, nil, nil, nil],
        [nil, 8, nil, nil, nil, 1, 4, 9, nil],
        [2, nil, 9, 4, 8, nil, nil, nil, nil],
        [nil, nil, nil, nil, 7, nil, 5, 2, nil],
        [3, nil, nil, nil, nil, nil, nil, nil, 1],
        [nil, 6, 2, nil, 3, nil, nil, nil, nil],
        [nil, nil, nil, nil, 1, 6, 9, nil, 4],
        [nil, 3, 8, 2, nil, nil, nil, 6, nil],
        [nil, nil, nil, nil, nil, 7, nil, nil, nil]
]

# med
s3 = [
        [8, 7, nil, nil, 1, 4, 9, nil, nil],
        [6, nil, 2, 5, nil, nil, nil, nil, 3],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [2, 4, nil, 6, nil, nil, nil, nil, nil],
        [nil, nil, 5, 8, nil, 3, 6, nil, nil],
        [nil, nil, nil, nil, nil, 5, nil, 2, 1],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil],
        [1, nil, nil, nil, nil, 9, 2, nil, 6],
        [nil, nil, 7, 1, 4, nil, nil, 8, 9]
]

solve_sudoku(s3).each { |r| p r }
