# 実行 ruby travel2.rb


puts <<~EOF

旅行プランを選択してください

EOF

def choose(name, price, id)
  " #{id}. #{name}旅行(¥#{price})"
end

puts choose("沖縄", 10000, 1)
puts choose("北海道", 20000, 2)
puts choose("九州", 15000, 3)

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

  break if (1..50).include?(number)
    puts <<~EOF

    入力された値が異常です。
    
    再度入力してください。

    EOF

    print "人数を入力 > "
  next
  
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