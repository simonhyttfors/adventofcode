notes = File.readlines('notes').map { |l| l.split('|').last.split }

pp notes.flatten.select { |s| [2, 3, 4, 7].include? s.length }.count