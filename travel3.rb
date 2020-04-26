# 実行 ruby travel3.rb


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


# 人数の入力

def travel_input

  select_num = @num - 1 
  @select_travel = @table[select_num]
  
  puts <<~EOF
  
  #{@select_travel[:name]}旅行ですね、何人で行きますか？
  
  EOF
  
  print "人数を入力 > "

  catch :out do
    
    while true
      
      @number = gets.to_i
      
      if @number < 0
        puts <<~EOF
        
        入力された値が異常です。
        
        再度入力してください。
        
        EOF
        
        print "人数を入力 > "
        next
      elsif @number > 49
        puts <<~EOF

        入力された数が多いです。
          
        #{@number}人で間違いない場合は「1」を、訂正する場合は「2」を入力してください。
        
        EOF
      
        print "入力 > "
        
        while true 
          
          enter = gets.to_i
          
          if enter == 1
            throw :out
          elsif enter == 2
            puts ""
            print "人数を入力 > "
            break
          else enter < 0 || 3 < enter
            puts <<~EOF

            「1」か「2」を入力してください。
            
            EOF
            print "入力 > "
            next
          end
        end
      else @number == (1..49)
        break
      end
    end
  end
  puts ""
end


# 合計金額は？

def travel_total
  if @number >= 5
    puts "5人以上なので10%割引となります"
    puts ""
    total = @number * @select_travel[:price] - (@select_travel[:price] * 0.1)
  else
    total = @number * @select_travel[:price]
  end
  puts "合計料金:¥#{total.floor}"
end