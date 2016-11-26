#!/usr/bin/ruby

$stdout.sync

system "clear"
puts "\n**** multi-rename tool ****\n\n"

print "Enter a target directory: "
target_dir = gets.chomp

Dir.foreach("#{target_dir}") {|file| puts "#{file}"}

print "\nEnter a pattern to find: "
find_pattern = gets.chomp
print "Replace given pattern with: "
replace_pattern = gets.chomp

puts "\n** Options **\n\n"
puts "Press a to replace all occurrences"
puts "Press f to replace only the first occurrence"

user_option = gets.chomp

pwd_init = Dir.pwd
Dir.chdir("#{target_dir}")

Dir["*"].each do |file|
  if user_option == "a"
    new_name = File.basename(file).gsub(find_pattern, replace_pattern)
  elsif user_option == "f"
    new_name = File.basename(file).sub(find_pattern, replace_pattern)
  else
    # TO DO: resolve the case when user imputs a wrong option.
    # Something like GO TO LINE 20 and start over (wait for another input)
    puts "Wrong option. Try again."
  end
  File.rename( file, "#{new_name}" )
end

Dir.chdir("#{pwd_init}")
