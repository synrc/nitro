defmodule NITRO.Mixfile do
  use Mix.Project

  def project do
    [
      app: :nitro,
      version: "9.9.7",
      description: "NITRO Nitrogen Web Framework",
      package: package(),
      deps: deps(),
      erlc_options: [:nowarn_export_all, :nowarn_deprecated_function]
    ]
  end

  def application do
    [mod: {:nitro, []}]
  end

  def package do
    [
      files: ~w(include priv lib man src mix.exs rebar.config LICENSE README.md),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :nitro,
      links: %{"GitHub" => "https://github.com/synrc/nitro"}
    ]
  end

  def deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end
end
