class DbDooper
  def self.hi(language)
    translator = Translator.new(language)
    translator.hi
  end
end

require 'db_dooper/translator'
