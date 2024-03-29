# Used by "mix format"
[
  import_deps: [:phoenix],
  inputs: ["{mix,.formatter,demo}.exs", "{config,lib,test,priv}/**/*.{ex,exs}"],
  plugins: [Phoenix.LiveView.HTMLFormatter]
]
