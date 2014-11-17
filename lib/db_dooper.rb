class DbDooper
  require 'git'
  def self.setup
    # run the first time
    branch = Git.open('.').current_branch

    puts 'Copying git hooks...'
    #`rake git_hooks:sync`
    self.sync_hooks

    db_exists = (`psql -l | grep sandh_dev | wc -l`.squish.to_i != 0)

    unless db_exists
      puts 'make it'
      sh "psql -c \"CREATE DATABASE \\\"sandh_dev\\\" WITH TEMPLATE \\\"story-and-heart_development\\\";\""
    end

    puts 'Initializing databases...'
    # `rake db_dooper:switch`
    self.switch
  end

  def self.sync_hooks
    # copies files in /git-hooks to actual git/hooks 
    puts 'Copying git hooks...'
    FileUtils.mkdir_p '.git/hooks'
    
    src_file = File.expand_path(File.dirname(__FILE__)) + "/templates/post-checkout"
    new_file = "#{Dir.pwd}/.git/hooks/post-checkout"

    puts src_file
    puts new_file
    FileUtils.copy_file(src_file, new_file)

    `chmod +x #{new_file}`

  end

  def self.switch
    # switch the database when the branch switches
    branch = Git.open('.').current_branch

    db_exists =  `psql -l | grep sandh_#{branch} | wc -l`.squish.to_i != 0
    
    if db_exists
      puts "Switching database: sandh_#{branch} ..."
    else
      puts "Creating database: sandh_#{branch} ..."
      `psql -c \"CREATE DATABASE \\\"sandh_#{branch}\\\" WITH TEMPLATE \\\"sandh_dev\\\";\"`
    end
  end

  def self.add_hook_files

  end

  def self.test
    branch = Git.open('.').current_branch
    puts "hello there, you're on #{branch}"
    source_path = File.expand_path(File.dirname(__FILE__))
    target_path = "#{Dir.pwd}/.git"

    puts source_path
    puts target_path
  end

end

require 'fileutils'


