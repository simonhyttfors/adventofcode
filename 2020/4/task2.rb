passports = File.read('passports').split("\n\n").map { |p| p.gsub(/\s+/m, ' ').strip.split(' ').map { |f| [*f.split(':')] }.to_h }
@patterns = {
  'byr' => '(19[2-9]\d|200[0-2])',
  'iyr' => '(201[0-9]|2020)',
  'eyr' => '(202[0-9]|2030)',
  'hgt' => '(((1([5-8][0-9]|9[0-3]))cm)|((59|6[0-9]|7[0-6])in))',
  'hcl' => '(#([0-9a-f]){6})',
  'ecl' => '(amb|blu|brn|gry|grn|hzl|oth)',
  'pid' => '^(\d{9})$'
}
def valid?(passport)
  @patterns.select { |attr, pattern| passport.key?(attr) && passport[attr].match?(/#{pattern}/) }.count == 7
end
p passports.select { |pass| valid? pass }.count