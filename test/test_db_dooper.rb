require 'minitest/autorun'
require 'db_dooper'

class DbDooperTest < Minitest::Test
  def test_english_hello
    assert_equal "hello world", DbDooper.hi("english")
  end

  def test_any_hello
    assert_equal "hello world", DbDooper.hi("ruby")
  end

  def test_spanish_hello
    assert_equal "hola mundo", DbDooper.hi("spanish")
  end
end
