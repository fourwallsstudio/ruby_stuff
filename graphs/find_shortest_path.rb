require_relative '../queues/queue'

def get_path(parents, start, finish)
  path = []
  current_vector = finish

  while current_vector != start
    path << current_vector
    current_vector = parents[current_vector]
  end

  path.reverse
end

# bfs
def find_sortest_path(start, finish)

  queue = Queue.new
  visited = {}
  parents = {}
  queue.enqueue(start)

  while !queue.empty?
    current_vector = queue.dequeue
    visited[current_vector] = true

    return get_path(parents, start, finish) if current_vector == finish

    current_vector.neighbors.each do |n|
      unless visited[n] || queue.include?(n)
        parents[n] = current_vector
        queue.enqueue(n)
      end
    end
  end

  []
end
