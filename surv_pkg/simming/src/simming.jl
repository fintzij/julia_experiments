module simming

using Random, Distributions, Roots, QuadGK

export greet, greet2, Jsim

greet() = "Hello World"
greet2(n) = rand(n)

function Jsim(n, 𝛌, method) 
    simtime = []
    for i in 1:n
        u = rand(1)
        if method == "prepackaged"
            f1(x) = (log(cdf(Exponential(1/𝛌),x))) - log(u[1])
            q=find_zero(f1,(0,10))
        elseif method == "analytic"
             f2(x) = (log1p(-exp(-𝛌 * x))) - log(u[1])
             q=find_zero(f2,(0,10))
        else
             f3(x)= (quadgk(x -> 𝛌*exp(-𝛌*x), 0, x)[1]) - (u[1])
             q=find_zero(f3,(0,10))
        end
        push!(simtime,q)
    end
    return(simtime)
end

end