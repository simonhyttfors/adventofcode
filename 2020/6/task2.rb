groups = File.read('answers').split("\n\n").map { |a| a.split("\n") }
p groups.map { |group| ('a'..'z').select { |letter| group.map { |answer| answer.include? letter }.count(false) == 0 }.size }.sum