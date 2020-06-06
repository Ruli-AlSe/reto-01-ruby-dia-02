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
      mat[i, j] = go_dead?(rules_to_live(i, j, matrix)) ? '_' : 'X'
      mat[i, j] = will_born?(rules_to_die(i, j, matrix)) ? 'X' : '_'
    end
  end

  mat
end

def rules_to_live(i, j, matrix)
  counter = 0
  if(matrix[i, j] == 'X')
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

def rules_to_die(i, j, matrix)
  counter = 0
  if(matrix[i, j] == '_')
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

20.times { |row| p matrix.row(row) }
matrix = play_game(matrix)
puts "\n\n"
20.times { |row| p matrix.row(row) }
