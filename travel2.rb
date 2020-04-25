# 実行 ruby travel2.rb


travel_plans = [
  { name:"沖縄", price:10000 },
  { name:"北海道", price:20000 },
  { name:"九州", price:15000 },
]

@table = travel_plans


# 旅行プランの表示

def travel_display
  puts "旅行プランを選択してください"
  
  @table.each.with_index(1) do |travel_plan, i|
    puts " #{i}. #{travel_plan[:name]}旅行(¥#{travel_plan[:price]})"
  end
end

travel_display


# 旅行プランの選択

def travel_choose
  puts ""
  print "プランを選択 > "
  
  while true
    @num = gets.to_i
  
    break if (1..3).include?(@num)
      puts <<~EOF
  
      1〜3の番号で入力してください。  
     
      EOF
      print "プランを選択 > "
    next
    
  end
end

travel_choose


# 人数の入力

def travel_input
  select_num = @num - 1 
  @select_travel = @table[select_num]
  
  puts <<~EOF
  
  #{@select_travel[:name]}旅行ですね、何人で行きますか？
  
  EOF
  
  print "人数を入力 > "
  
  while true
  
    @number = gets.to_i
  
    break if (1..50).include?(@number)
      puts <<~EOF
  
      入力された値が異常です。
      
      再度入力してください。
  
      EOF
  
      print "人数を入力 > "
    next
  end
  puts ""
end

travel_input


# 合計金額は？

def travel_total
  if @number >= 5
    puts "5人以上なので10%割引となります"
    total = @number * @select_travel[:price] - (@select_travel[:price] * 0.1)
  else
    total = @number * @select_travel[:price]
  end
  puts ""
  puts "合計料金:¥#{total.floor}"
end

travel_total