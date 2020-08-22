class Graph
  attr_accessor :row, :col, :graph, :visited, :rowNeighbor, :colNeighbor

  def initialize(row, col, graph)
    @row = row
    @col = col
    @graph = graph
    @visited = Array.new(@row) { Array.new(@col, false) }
    @rowNeighbor = [-1, -1, -1,  0, 0,  1, 1, 1]
    @colNeighbor = [-1,  0,  1, -1, 1, -1, 0, 1]
  end

  def isSafe(i,j)
    i >= 0 and i < @row and j >= 0 and j < @col and @visited[i][j] == false and @graph[i][j] == 1
  end

  def DFS(i,j)
    @visited[i][j] = true
    (0..7).each do |k|
      if isSafe(i + @rowNeighbor[k], j + @colNeighbor[k])
        DFS(i + @rowNeighbor[k], j + @colNeighbor[k])
      end
    end
  end

  def countIslands
    count = 0
    (0..@row-1).each do |i|
      (0..@col-1).each do |j|
        if @graph[i][j] == 1 and @visited[i][j] == false
          DFS(i,j)
          count += 1
        end
      end
    end
    count
  end
end

graph = [[1, 1, 0, 0, 0],
       [0, 1, 0, 0, 1],
       [1, 0, 0, 1, 1],
       [0, 0, 0, 0, 0],
       [1, 0, 1, 0, 1]]

row = graph.length
col = graph[0].length

g = Graph.new(row, col, graph)
puts "Area has #{g.countIslands} Islands"
