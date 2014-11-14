class DbDooper
  def self.add_hooks
    # adds hooks directory if it doesn't exist
    FileUtils.mkdir_p '.git/hooks'

    # if post-checkout file exists merge it in

    # else duplicate file 

  end
end

require 'db_dooper/translator'
require 'fileutils'


