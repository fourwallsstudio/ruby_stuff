require 'thread'
require 'digest/md5'

Thread::abort_on_exception = true

t1 = Time.now

MAXIMUM = 2 ** 128 - 1
DIFFICULTY = 1_000_000.0
GOAL = (MAXIMUM / DIFFICULTY)
NUM_HASHES = 5

NUM_THREADS = 4


def start_thread(thread_idx, queue)
  thread = Thread.new do
    string = "#{thread_idx}"

    while true
      hash = Digest::MD5.hexdigest(string).to_i(16)

      if hash < GOAL
        queue << [string, hash]
      end

      string = hash.to_s
    end
  end

  thread
end

queue = Queue.new
threads = []
NUM_THREADS.times { |thread_idx| threads << start_thread(thread_idx, queue) }

NUM_HASHES.times do
  result = queue.shift
  p result
end

threads.each { |thread| thread.kill }

t2 = Time.now
puts t2 - t1
