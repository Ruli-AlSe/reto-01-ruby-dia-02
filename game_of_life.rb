require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

def set_init_figure(figure, matrix)
  figure.each do |val|
    matrix[val.first, val.last] = 'X'
  end

  matrix
end

def play_game(matrix)
  mat = matrix
  20.times do |i|
    20.times do |j|
      mat[i, j] = go_dead?(check_nearby_cells(i, j, matrix, 'X')) ? '_' : matrix[i, j]
      mat[i, j] = will_born?(check_nearby_cells(i, j, matrix, '_')) ? 'X' : matrix[i, j]
    end
  end

  mat
end

def check_nearby_cells(i, j, matrix, cond)
  counter = 0
  if(matrix[i, j] == cond)
    counter += 1 if(i-1 > 0 && j-1 > 0 && matrix[i-1, j-1] == 'X')
    counter += 1 if(i-1 > 0 && matrix[i-1, j] == 'X')
    counter += 1 if(i-1 > 0 && j+1 < 20 && matrix[i-1, j+1] == 'X')
    counter += 1 if(j+1 < 20 && matrix[i, j+1] == 'X')
    counter += 1 if(i+1 < 20 && j+1 < 20 && matrix[i+1, j+1] == 'X')
    counter += 1 if(i+1 < 20 && matrix[i+1, j] == 'X')
    counter += 1 if(i+1 < 20 && j-1 > 0 && matrix[i+1, j-1] == 'X')
    counter += 1 if(j-1 > 0 && matrix[i, j-1] == 'X')
  end

  counter
end

def go_dead?(counter)
  counter < 2 || counter > 3 
end

def will_born?(counter)
  counter == 3 
end


figure = [ [2, 5], [2, 6], [2, 7], [1, 5], [1, 7], [4, 4], [4, 5] ]

matrix = Matrix.build(20, 20) { '_' }
matrix = set_init_figure(figure, matrix)

10.times do
  20.times { |row| p matrix.row(row) }
  matrix = play_game(matrix)
  puts "\n\n"
end
