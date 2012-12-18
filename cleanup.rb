#!/usr/bin/ruby
require 'fileutils'
home_path = '/home/dvivek' 
actual_path = home_path + '/publish_artifact'
directories = Dir.entries(actual_path).sort {|a,b| File.ctime(actual_path + '/' + a) <=> File.ctime(actual_path + '/' + b) }
for i in 0...5
    directory_name = directories[i]
    delete_directory = actual_path + '/' + directory_name
    if !( directory_name == '.' || directory_name == '..')
        FileUtils.rm_r delete_directory
    end
end
    
   
#files = Dir.entries(actual_path).select {|entry| File.directory? !(entry =='.' || entry == '..')}.sort {|a,b| File.ctime(actual_path + '/' + a) <=> File.ctime(actual_path + '/' + b) }
#puts files
