require 'java'
require 'jbundler'

java_import 'com.itextpdf.text.pdf.PdfReader'
java_import 'com.itextpdf.text.pdf.parser.PdfTextExtractor'

class PdfReader
  def self.get_text(url_or_path)
    reader = PdfReader.new(url_or_path)
    PdfTextExtractor.getTextFromPage(reader, 1)
  end

  def self.output_message(text)
    puts "*" * 30
    puts
    puts "Text from #{ARGV[0]}"
    puts
    puts text
    puts
    puts "*" * 30
  end
end

if text = PdfReader.get_text(ARGV[0])
  PdfReader.output_message(text)
  text
else
  puts "There was an error parsing your PDF"
end

