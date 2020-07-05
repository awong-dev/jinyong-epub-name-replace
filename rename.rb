require 'csv'
require 'fileutils'
require 'tempfile'

to_pinyin = []
to_traditional = []
to_simplified = []

def print_help
  puts "script {pinyin,trad,simp} infile"
end

to_selected = nil

case ARGV[0]
when 'pinyin'
  to_selected = to_pinyin
when 'trad'
  to_selected = to_traditional
when 'simp'
  to_selected = to_simplified
else
  print_help
  exit 1
end

infile = ARGV[1]
if infile.nil? || infile.empty?
  print_help
  exit 1
end

def make_span(s)
  '<span lang="zh" xml:lang="zh">' + s + '</span>'
end

File.open('name-remap.csv').each do |line|
  parts = line.split(',')
  orig = parts[0].strip
  first = parts[1].strip
  to_pinyin << [orig, first, parts[2].strip]
  to_traditional << [orig, first, make_span(parts[3].strip)]
  to_simplified << [orig, first, make_span(parts[4].strip)]
end

tempfile = Tempfile.new('tmp.xhtml')
File.open(infile, 'r').each do |line|
  to_selected.each do |item|
    orig = item[0]
    first = item[1]
    new = item[2]
    line.gsub! orig, new
    unless first.empty?
      line.gsub! first, new
    end
  end
  tempfile.print line
end
tempfile.close
FileUtils.mv(tempfile.path, infile)

