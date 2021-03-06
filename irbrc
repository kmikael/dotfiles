require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File.join(Dir.home, '.irb_history')

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

# OS X
def pbcopy(obj)
  IO.popen('pbcopy', 'w') { |f| f << obj }; obj
end

def pbpaste
  `pbpaste`
end
