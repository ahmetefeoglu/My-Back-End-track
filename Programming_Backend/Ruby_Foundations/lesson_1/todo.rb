require 'pry'
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :description, :title, :done 

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end


  def done?
    self.done
  end


  def undone!
    self.done = false
  end

  def to_s
    "[ #{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end


todo1 = Todo.new("Buy milk")
todo1.done!
todo2 = Todo.new("Buy yogurt")
todo3 = Todo.new("Buy cereal!!!")




class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end
  

  def add(todo_objects)
    raise TypeError, 'can only add todo objects' unless todo_objects.instance_of?(Todo) 
      todos << todo_objects
  end


  def to_s
    puts "------- #{title} -------"
    counter = 0
    while counter < todos.size
      puts "[ #{todos[counter].done? ? Todo::DONE_MARKER : Todo::UNDONE_MARKER}] #{todos[counter].title}"
      counter += 1
    end

  end


  def size
    size = todos.size
    
    return size
  end

  def first
    
    todos.first
  end

  def last
    todos.last
  end

  def item_at(num)
     raise(IndexError, 'sorry you should select a lower number') if num > todos.size 

      todos.fetch(num)
    
      
    

  end

  def mark_done_at(num)
    raise(IndexError,  'sorry you should select a lower number')  if num > @todos.size
      item_at(num).done!
    
    
  end

  def mark_undone_at(num)
    raise(IndexError, 'sorry you should select a lower number') if num > @todos.size
    item_at(num).undone!
    
      
    
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(num)
    raise(IndexError, "please select a lower number") if num > todos.size 
      todos.delete_at(num)
    
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      
      list.add(todo) if yield(todo)
    end
    list
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end


  def all_undone
    select do |todo|
      !todo.done?
    end
  end

  def find_by_title(name)
    select  { |todo| todo.name == name }.first 
  end


  def mark_done(mark)
     find_by_title(title) && find_by_title(title).done!
  end

  def to_a
    @todos
  end














  





end


  list = TodoList.new("Monday List")
  list.add(todo1)
  list.add(todo2)
  list.add(todo3)
  list.mark_all_done
  puts list
  
  




  
  

  


