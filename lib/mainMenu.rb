# VINCENT
def mainMenu(user)
    # puts welcome user   

    input = ''
    puts "SELECT: (1)**New-Game** (2)**Continue** (3)**Stats**"
    input = gets.chomp

    while input != '1' && input != '2' && input != '3' do
        puts "invalid entry"
        puts "SELECT: (1)**New-Game** (2)**Continue** (3)**Stats**"
        input = gets.chomp
    end

    input.to_i

end