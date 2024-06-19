
# frozen_string_literal: true

class Node
    attr_accessor :key, :value, :next
    def initialize(key=nil, value=nil)
      @key = key
      @value = value
      @next = nil
    end
end