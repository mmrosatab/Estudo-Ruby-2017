puts "Entre com a 1° palavra:"
p1 = gets.chomp

puts "Entre com a 2° palavra:"
p2 = gets.chomp

m = Array.new(p1.length + 1) { Array.new(p2.length + 1)}

maior = 0

for i in 0..p1.length
	m[i][0] = 0
end

for j in 1..p2.length
	m[0][j] = 0
end

for i in 1..p1.length
	for j in 1..p2.length

		if p1[i-1] == p2[j-1]

			m[i][j] = m[i-1][j-1] + 1

			if m[i][j] > maior

				maior = m[i][j]
			end
		else 
			m[i][j] = 0

		end
	end
end

for l in m
	print l
	print "\n"
end

print "\n"

print "O valor da maior substring comum entre #{p1} e #{p2} eh: #{maior}"

print "\n"