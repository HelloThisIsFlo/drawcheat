use Mix.Config

config :draw_something,
  dict_path: "./priv/dictionary.txt",
  with_crash: :true



import_config "#{Mix.env}.exs"
