# frozen_string_literal: true
Pry.config.should_load_plugins = true
Pry.config.print = proc { |output, value| output.puts "=> #{value.pretty_inspect}" }
Pry.config.color = true
Pry.config.auto_indent = true
Pry.config.correct_indent = true
Pry.config.editor = 'nano'
