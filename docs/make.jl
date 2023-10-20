using Together
using Documenter

DocMeta.setdocmeta!(Together, :DocTestSetup, :(using Together); recursive=true)

makedocs(;
    modules=[Together],
    authors="Stefan Wojcik",
    repo="https://github.com/stefanjwojcik/Together.jl/blob/{commit}{path}#{line}",
    sitename="Together.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://stefanjwojcik.github.io/Together.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/stefanjwojcik/Together.jl",
    devbranch="master",
)
