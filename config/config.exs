use Mix.Config

config :draw_something,
  dict_path: "./priv/dictionary.txt",
  with_crash: :true,
  words_per_crawler: 100_000



import_config "#{Mix.env}.exs"
