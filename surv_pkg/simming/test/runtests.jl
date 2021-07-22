using Test
using Random, Distributions, Roots, QuadGK, simming
include("../src/simming.jl")

@test 1 == 1

A=greet()
@test length(A)== 11

B=greet2(6)
@test length(B)==6


Random.seed!(1)
C = Jsim(1,2,"prepackaged")
Random.seed!(1)
D = Jsim(1,2,"analytic")
Random.seed!(1)
E= Jsim(1,2,"numerical")
@test C == D == E
