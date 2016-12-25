use Mix.Config

config :draw_something, dict_path: "./priv/dictionary.txt"

import_config "#{Mix.env}.exs"
