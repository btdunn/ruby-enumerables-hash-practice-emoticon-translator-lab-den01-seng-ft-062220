# require modules here
require 'yaml'
require 'pry'


def load_library(file_path)
 #code goes here
  emoticons = YAML.load_file(file_path)
  emoticon_lib  = {}
  emoticons.each do |name,arrays|
      emoticon_lib[name] ||= {}
      emoticon_lib[name][:english] = arrays[0]
      emoticon_lib[name][:japanese] = arrays[1]
  end
emoticon_lib
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_lib = load_library(file_path)
  
  emoticon_lib.each do |meaning, values|
  values[:japanese] if values[:english] == emoticon
end
  "Sorry, that emoticon was not found"
end 


def get_english_meaning(file_path, emoji)
  emoticon_lib = load_library(file_path)
  
  emoticon_lib.each do |meaning, values|
  return meaning if values[:japanese] == emoji
end
"Sorry, that emoticon was not found"
end