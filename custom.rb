module Enumerable

  def my_each
    return to_enum(:my_each) unless block_given?

    for i in self
      yield(i)
    end

    self
  end


  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    my_each do |elem|
      yield(elem, index)
      index += 1
    end

    self
  end


  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each do |elem|
      result << elem if yield(elem)
    end

    result
  end


  def my_all?
    my_each do |elem|
      return false unless yield(elem)
    end
    true
  end


  def my_any?
    my_each do |elem|
      return true if yield(elem)
    end
    false
  end


  def my_none?
    my_each do |elem|
      return false if yield(elem)
    end
    true
  end


  def my_count(item = nil)
    count = 0

    if block_given?
      my_each { |elem| count += 1 if yield(elem) }
    elsif !item.nil?
      my_each { |elem| count += 1 if elem == item }
    else
      my_each { count += 1 }
    end

    count
  end


  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given? || proc

    result = []
    my_each do |elem|
      result << (proc ? proc.call(elem) : yield(elem))
    end

    result
  end


  def my_inject(initial = nil)
    accumulator = initial
    my_each do |elem|
      if accumulator.nil?
        accumulator = elem
      else
        accumulator = yield(accumulator, elem)
      end
    end
    accumulator
  end

end
