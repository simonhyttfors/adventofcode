passports = File.read('passports').split("\n\n").map { |p| p.gsub(/\s+/m, ' ').strip.split(' ').map { |f| [*f.split(':')] }.to_h }
p passports.select { |p| ((['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'] - ['cid']) - p.keys).empty? }.count