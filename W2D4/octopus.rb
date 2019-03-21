require 'byebug'

fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#O(n^2)
def sluggish_octopus(fish_array)
    longest = 0 
    (0...fish_array.size - 1).each do |i|
        (i+1...fish_array.size).each do |j|
            if fish_array[i].length > fish_array[j].length && fish_array[i].length > longest
                longest = i 
            elsif fish_array[j].length > fish_array[i].length && fish_array[j].length > longest
                longest = j 
            end
        end
    end
    fish_array[longest]
end

#O(nlog(n))
def dominant_octopus(fish_array)
    return fish_array if fish_array.size < 2
    pivot = fish_array[0]
    left = fish_array[1..-1].select { |fish| fish.length < pivot.length }
    right = fish_array[1..-1].select { |fish| fish.length >= pivot.length }
    dominant_octopus(left) + [pivot] + dominant_octopus(right)
end

#sorted = dominant_octopus(fish_array)
#p sorted.last

def clever_octopus(fish_array)
    longest = ""
    fish_array.each do |fish|
        if fish.length > longest.length
            longest = fish 
        end
    end
    longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |dir, i|
        if dir == direction 
            return 1
        end 
    end
end

tiles_hash = { "up": 1, "right-up": 2, "right": 3, "right-down": 4, "down": 5, "left-down": 6, "left": 7,  "left-up": 8 }

def fast_dance(direction, tiles_hash)
    tiles_hash[direction.to_s]
end
