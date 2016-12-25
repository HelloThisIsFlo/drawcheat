use Mix.Config

config :draw_something,
  dict_path: "./priv/dictionary.txt",
  with_crash: :true,
  # words_per_crawler: 400_000
  words_per_crawler: 100



import_config "#{Mix.env}.exs"
