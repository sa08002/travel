# 実行 ruby travel.rb

travel_plans = [
  { name:"沖縄", price:10000 },
  { name:"北海道", price:20000 },
  { name:"九州", price:15000 },
]

puts "旅行プランを選択してください"

travel_plans.each.with_index(1) do |travel_plan, i|
  puts " #{i}. #{travel_plan[:name]}旅行(¥#{travel_plan[:price]})"
end


puts ""
print "プランを選択 > "

while true
  num = gets.to_i

  break if (1..3).include?(num)
    puts <<~EOF

    1〜3の番号で入力してください。  
   
    EOF
    print "プランを選択 > "
  next
  
end

select_num = num -1 
select_travel = travel_plans[select_num]

puts <<~EOF

#{select_travel[:name]}旅行ですね、何人で行きますか？

EOF

print "人数を入力 > "

while true

  number = gets.to_i

  if number > 50
    puts "入力された人数が多いです。"
    puts ""
    puts "#{number}人でお間違えなければ「1」を、人数を再入力する場合は「2」を入力してください。"
  else
    break
  end
  
  print " > "
  
  verification = gets.to_i

  if verification == 1
    break
  elsif
    verification == 2
    print "人数を再入力 > "
    next
  else
    puts "1か2を入力してください"
    print " > "
    next
  end
  
end

puts ""

if number >= 5
  puts "5人以上なので10%割引となります"
  total = number * select_travel[:price] - (select_travel[:price] * 0.1)
else
  total = number * select_travel[:price]
end

puts ""
puts "合計料金:¥#{total.floor}"