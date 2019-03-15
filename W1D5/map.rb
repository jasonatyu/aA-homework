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