require_relative 'node'

class LinkedList
    attr_reader :head, :tail
    def initialize
        @head = nil
        @tail = nil
    end
      
    def append(key, value)
        if @head.nil?
            @head = Node.new(key, value)
            @tail = @head
        else
        @tail.next = Node.new(key, value)
        @tail = @tail.next
        end
    end

  def find(key, value)
    count=0
    current=@head
    until current.key == key
      if current.next.nil?
        append(key, value)
        return
      end
      current = current.next
      count += 1
    end
    current.value = value
    count
  end

  def get_value (key)
    current=@head
    until current.key == key
        if current.next.nil?
            return
        end
        current=current.next
    end
    puts current.value
    end

    def has_key? (key)
        current=@head
        until current.key == key
            if current.next.nil?
                return  false
            end
            current=current.next
        end
        true 
    end

    def remove_key(key)
        current=@head
        skip=current.next
        if current.key == key
            @head = current.next
            current.next = nil
            return current.value
        end
        return if skip.nil?
        until skip.key == key
            if skip.next.nil?
                return
            end
            current = skip
            skip=skip.next
        end
        if skip == @tail
            @tail = current
        end
         current.next = skip.next
         skip.next = nil
         return puts skip.value
    end

    def count_keys
        count = 0
        current = @head
        until current.next.nil?
            current = current.next 
            count +=1
        end
        count += 1
    end

    def clearall
        @head = nil
        @tail = nil
    end

    def allkey
        keychain=[]
        current = @head
        until current.next.nil?
            keychain << current.key
            current = current.next
        end
        keychain << current.key
        keychain
    end

    def allvalue
        valuechain=[]
        current = @head
        until current.next.nil?
            valuechain << current.value
            current = current.next
        end
        valuechain << current.value
        valuechain
    end

    def allentries
        entrieschain=[]
        current = @head
        until current.next.nil?
            entrieschain << current.key
            entrieschain << current.value
            current = current.next
        end
        entrieschain << current.key
        entrieschain << current.value
        entrieschain
    end
end