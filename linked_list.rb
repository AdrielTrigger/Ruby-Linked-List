class LinkedList

    def initialize
        @head = Node.new(rand(1000), nil)
    end

    def append(value)
        current = @head
        while current.next != nil
            current = current.next
        end
        current.next = Node.new(value, nil)
    end

    def pre_pend(value)
        current = @head
        new_node = Node.new(value, current)
        @head = new_node
    end

    def size
        current = @head
        counter = 0
        while current.next != nil
            current = current.next
            counter += 1
        end
        counter += 1
        print counter
    end

    def head
        print @head.value
    end

    def tails
        current = @head
        while current.next != nil
            current = current.next
        end
        print current.value
    end

    def at(index)
        counter = 1
        current = @head
        found = false
        while found == false
            if index == counter
                print current
                found = true
            elsif counter < index
                counter += 1
                current = current.next
            else
                print 'invalid index'
            end
        end
    end

    def pop
        current = @head
        while current.next != nil and current.next.next != nil
            current = current.next
        end
        current.next = nil
    end

    def contains?(data)
        current = @head
        found = false
        while found == false
            if current.value == data
                print 'true'
                found = true
            elsif current.next != nil
                current = current.next
            else
                print 'false'
                found = true
            end
        end
    end

    def find(data)
        current = @head
        node_index = 1
        found = false
        while found == false
            if current.value == data
                print "this data is at index #{node_index}"
                found = true
            elsif current.next != nil
                current = current.next
                node_index += 1
            else
                print 'not found'
                found = true
            end
        end
    end

    def to_s
        current = @head
        while current.next != nil
            print "(#{current.value}) -> "
            current = current.next
        end
        print "(#{current.value}) -> nil"
    end

    def insert_at(index)
        if index == 1
            self.pre_pend(rand(1000))
        elsif index > 0
            current = @head
            looking_at = 1
            found = false
            while found == false
                if current.next == nil
                    puts 'invalid index'
                    break
                elsif looking_at == index - 1
                    new_node = Node.new(rand(1000), current.next)
                    current.next = new_node
                    found = true                    
                end
                current = current.next
                looking_at += 1
            end
        end
    end

    def remove_at(index)
        current = @head
        previous = nil
        counter = 1
        found = false
        while found == false
            if index == 1
                @head = current.next
                found = true
            elsif counter == index - 1
                previous = current
                previous.next = current.next
                found = true
            else
                counter += 1
                current = current.next
            end
            if counter > index - 1 and found == false
                puts 'nothing to be removed here'
                break
            end
        end
    end

end

class Node

    attr_accessor :value, :next

    def initialize(value, next_node)
        @value = value
        @next = next_node
    end

end

list = LinkedList.new
10.times do
    list.append(rand(1000))
end

while 1
    puts 'input action'
    action = gets.chomp
    case action
    when 'size'
        list.size
    when 'at'
        puts 'say an index'
        index = gets.chomp.to_i
        list.at(index)
    when 'head'
        list.head
    when 'tails'
        list.tails
    when 'append'
        list.append(rand(1000))
        puts 'value appended'
    when 'append 10'
        10.times do
            list.append(rand(1000))
        end
        puts '10 values appended'
    when 'prepend'
        list.pre_pend(rand(1000))
        puts 'value prepended'
    when 'pop'
        list.pop
        puts 'value popped'
    when 'contains'
        puts 'what are you looking for?'
        num = gets.chomp.to_i
        list.contains?(num)
    when 'find'
        puts 'what are you looking for?'
        num = gets.chomp
        list.find(num.to_i)
    when 'to string'
        list.to_s
    when 'insert'
        puts 'in which index'
        slot = gets.chomp.to_i
        list.insert_at(slot)
    when 'remove'
        puts 'from which index'
        slot = gets.chomp.to_i
        list.remove_at(slot)
    end
    puts ''
end