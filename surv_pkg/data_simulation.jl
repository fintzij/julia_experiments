# This is the code for survival data simulation julia
# see R markdown docs to see code implemented as R or Julia
# by: mah 17 Jul 2021
# using Julia REPL, import and load packages in REPL 1st - packages will not load from script (find out why)
#cntl + shift + p for REPL

#using Pkg
#using Random, Distributions, Roots, QuadGK (run in REPL)

#this is the QC function

function solver(method, lambda)
    Random.seed!(1)
      u = rand(1)
        if method == "prepackaged"
          f1(x) = (log(cdf(Exponential(1/lambda),x))) - log(u[1])
          find_zero(f1,(0,10))
         elseif method == "analytic"
           f2(x) = (log1p(-exp(-lambda * x))) - log(u[1])
           find_zero(f2,(0,10))
         else
           f3(x)= (quadgk(x -> lambda*exp(-lambda*x), 0, x)[1]) - (u[1])
           find_zero(f3,(0,10))
          end
    end
    
    solver("prepackaged",3)
    solver("analytic",3)
    solver("numerically", 3)


#for now for built function where n can be specified in the call
function JsimTime(n, lambda, method)
    simdata = []
    for i = 1:n
      u = rand(1)
        if method == "prepackaged"
          f1(x) = (log(cdf(Exponential(1/lambda),x))) - log(u[1])
          q=find_zero(f1,(0,10))
         elseif method == "analytic"
           f2(x) = (log1p(-exp(-lambda * x))) - log(u[1])
           q=find_zero(f2,(0,10))
         else
           f3(x)= (quadgk(x -> lambda*exp(-lambda*x), 0, x)[1]) - (u[1])
           q=find_zero(f3,(0,10))
          end
        push!(simdata,q)
        end
      return(simdata)
    end