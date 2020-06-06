require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

def set_matrix(width, height)
  width.times do |i|
    height.times do |j|

    end
  end
end

def set_figure(figure, matrix)
  figure.each_value do |val|
    matrix[val.first, val.last] = 'X'
  end

  matrix
end


figure = { 1 => [0, 5], 2 => [0, 6], 3 => [0, 7], 4 => [1, 4], 5 => [1, 7], 6 => [1, 6], 7 => [2, 7] }

matrix = Matrix.build(20, 20) { '_' }
matrix = set_figure(figure, matrix)

20.times { |row| p matrix.row(row) }
