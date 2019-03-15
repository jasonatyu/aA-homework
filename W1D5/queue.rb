class Queue
    def initialize
      @queue = []
    end

    def enqueue(el)
      # adds an element to the queue
      @queue.unshift(el)
    end

    def dequeue
      # removes one element from the queue
      @queue.shift 
    end

    def peek
      # returns, but doesn't remove, the first element in the stack
      @queue.first
    end
end