require './lib/rusty_rack'
require './app/models/Grid'
require './app/models/ModernDice'

require File.join(File.dirname(__FILE__), 'app/silent_bggl_app.rb')

run SilentBggl
