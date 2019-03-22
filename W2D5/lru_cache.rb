  class LRUCache
    def initialize(size)
        @store = Array.new(size)
    end

    def count
      # returns number of elements currently in cache
      @store.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @store.include?(el)
        @store.delete(el)
        @store << el 
      else
        @store.shift 
        @store << el 
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @store
    end

    private
    # helper methods go here!

  end