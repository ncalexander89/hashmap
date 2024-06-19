require 'pry-byebug'

require_relative 'linkedlisthash'

class HashMap

    def initialize
        @capacity=16
        @load_factor=0.75
        @buckets = Array.new(@capacity)
    end

    def check_load
        non_nil = @buckets.count {| element | !element.nil? }
        current_loadfactor = (non_nil.to_f / @capacity).round(2) #to_f converts to floating point number
        if current_loadfactor >= @load_factor 
            # resize
            @capacity += @capacity
        end
    end

    # def resize
    #     @new_capacity = @capacity*2
    #     @new_buckets = Array.new(@new_capacity)

    #     @buckets.each do | bucket |
    #         next if bucket.nil?

    #         end
    #     end
    #     @buckets = @new_buckets
    #     @capacity = @new_capacity
    # end

    def hash(key)
        hash_code = 0
        prime_number = 47
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        hash_code % @capacity
    end

    def set(key, value)
        check_load
        if @buckets[hash(key)].nil?
            @buckets[hash(key)]=LinkedList.new
            @buckets[hash(key)].append(key, value)
        else
        @buckets[hash(key)].find(key, value)
        end
    end 

    def get (key)
        @buckets.each do | bucket |
            next if bucket.nil?
            LinkedList.new
            bucket.get_value(key)
        end
    end

    def has? (key)
        @buckets.each do | bucket |
            next if bucket.nil?
            LinkedList.new
            bucket.has_key?(key)
        end
    end

    def remove(key)
        @buckets.each do | bucket |
            next if bucket.nil?
            LinkedList.new
            bucket.remove_key(key)
        end
    end

    def length
        count = 0
        @buckets.each do | bucket |
            next if bucket.nil?
            LinkedList.new
            count += bucket.count_keys
        end 
        p "Count = #{count}"
    end

    def clear
        initialize
    end

    def keys
        keychain = []
        @buckets.each do | bucket |
            next if bucket.nil?
            LinkedList.new
            keychain << bucket.allkey
        end 
        p keychain
    end

    def values
        valuechain = []
        @buckets.each do | bucket |
            next if bucket.nil?
            LinkedList.new
            valuechain << bucket.allvalue
        end 
        p valuechain
    end

    def entries
        entrieschain = []
        @buckets.each do | bucket |
            next if bucket.nil?
            LinkedList.new
            entrieschain << bucket.allentries
        end 
        p entrieschain
    end
end

hm=HashMap.new
hm.set('Carlos', 'Smith')
hm.set('Joseph', 'Sanchez')
hm.set('Allan', 'Magee') #same hash
hm.set('Harold', 'Roth') #same hassh
hm.get('Allan')
hm.has?('Carlos')
# hm.remove('Harold')
hm.length
# hm.clear
hm.keys
hm.values
hm.entries

# p hm