# Rules
watch('spec/.*_spec.rb') {|m| system("turn #{m[0]}") }

# Signal Handling
Signal.trap('QUIT') { ruby tests  } # Ctrl-\
Signal.trap('INT' ) { abort("\n") } # Ctrl-C
