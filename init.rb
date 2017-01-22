# Link all dotfiles

FILES = %w[
  gemrc gitconfig iex.exs irbrc psqlrc
  zshrc ghci gitignore octaverc vimrc
]

FILES.each do |file|
  from = File.join(Dir.home, "dotfiles", file)
  to = File.join(Dir.home, ".#{File.basename(file)}")
  File.unlink(to) if File.exist?(to)
  File.symlink(from, to)
end
