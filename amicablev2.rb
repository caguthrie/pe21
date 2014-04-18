class Amicable

  def initialize(max)
    @max = max
    @hash = {}
  end

  def find_amicable_numbers
    amicable_numbers = []
    @max.times do |i|
      amicable_numbers << (i+1) if is_amicable?(i+1)
    end
    amicable_numbers
  end

  private

  def find_sum_of_divisors(num)
    sum = 0
    (num/2).times do |i|  # optimized this by going up to half of num
      sum += (i+1) if num % (i+1) == 0 && num != (i+1)
    end
    sum
  end

  def is_amicable?(num)
    @hash[num] ||= find_sum_of_divisors(num)
    @hash[@hash[num]] ||= find_sum_of_divisors(@hash[num])
    if num == @hash[@hash[num]] && @hash[num] != @hash[@hash[num]]
      true
    else
      false
    end
  end
end

beginning = Time.now
a = Amicable.new(10000)
total_sum = 0
a.find_amicable_numbers.each do |element|
  total_sum += element
end
puts total_sum
puts "This took #{(Time.now - beginning)} seconds"