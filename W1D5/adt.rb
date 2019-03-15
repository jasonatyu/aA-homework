class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack << el 
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack.last
    end
end

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

class Map 

    def initialize 
        @map = Array.new { Array.new }
    end 

    def set(key, value)
        @map.each do |arr|
            if arr[0] == key 
                arr[1] = value 
                return @map 
            end 
        end
        @map << [key, value]
    end 

    def get(key)
        @map.each do |arr|
            if arr[0] == key 
                return arr[1] 
            end 
        end
        return nil  
    end 

    def delete(key)
        @map.each_with_index do |arr, i|
            if arr[0] == key
                @map.delete_at(i)
            end 
        end
    end 

    def show 
        @map 
    end 

end