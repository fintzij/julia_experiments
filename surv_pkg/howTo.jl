"""
steps
#http://pkgdocs.julialang.org/v1/creating-packages/
 <]> to activate pkg
"""
#use the command generate to create a package with structure
"""
<]>
generate simming
"""
readdir()
"""
4-element Vector{String}:
"data_simulation.jl"
"simming"
"steps.jl"
"test.jl"
"""

cd("simming")

using Revise #this is a package that saves revisions to modules/package without having to restart REPL

#from pkg <]>
activate .
"""
Activating environment at `C:\Users\hartwickma\Documents\JULIA\github_Julia\julia_experiments\surv_pkg\simming\Project.toml`
"""
#<cntrl> + C

using simming

simming.greet()
"""
Hello World
"""
simming.greet2(3)
"""
[0.7269214040651277, 0.8794388633722241, 0.3184953582302934]
"""

"""
adding tests
pkg> activate ./test
#add Test (this adds to the .toml - only need to do once)
#also add any packages that are dependancies -for some reason the test.toml doesn't see pkg toml
make file named "runtests.jl" in same folder at test toml files
create unit tests in the runtests.jl
making sure to `using` the dependancies for any thing being tested
to use include("path/to/modules") to test functions in the package
reactivate the package that you are testing 
from pkg run command test
"""