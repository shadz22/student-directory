@students =[]

def interactive_menu
  loop do 
    # print the interactive menu options
    print_menu
    #do what the user has asked
    process(gets.chomp)
  end
end

def input_student
  puts "please enter the name of the student"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Enter another name"
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  # print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students"
  puts "9. Exit" 
end

def show_students
  # show the students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_student
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again."
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
  
  #nothing happens until we call the methods
interactive_menu

