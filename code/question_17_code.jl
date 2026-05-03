using JuMP, GLPK

model = Model(GLPK.Optimizer)

 #LP FORMULATION

@variable(model, x1 >= 0)
@variable(model, x2 >= 0)
@variable(model, x3 >= 0)
@variable(model, x4 >= 0)
@variable(model, x5 >= 0)
@variable(model, x6 >= 0)
@variable(model, x7 >= 0)
@variable(model, x8 >= 0)

@objective(model, Min, 1*x1 + 10*x2 + 23*x3 + 16*x4
                        + 34*x5 + 60*x6 + 40*x7 + 92*x8 )

@constraint(model, 1*x2 + 1*x3 + 2*x5 + 2*x6 <= 14)
@constraint(model, 1*x1 + 2*x4 <= 2)
@constraint(model, 1*x3 + 2*x6 + 4*x8 <= 13)
@constraint(model, 1*x2 + 2*x5 + 4*x7 <= 10)
@constraint(model, 1*x3 + 2*x6 + 4*x8 <= 9)
@constraint(model, 4*x7 + 4*x8 <= 8)
@constraint(model, 2*x4 + 2*x5 + 2*x6 + 4*x7 + 4*x8 <= 16)
@constraint(model, x1 + x2 + x3 >= 3)
@constraint(model, x4 + x5 + x6 >= 4)
@constraint(model, x7 + x8 >= 2)


JuMP.optimize!(model)

println("The objective value is: \nz = ", JuMP.objective_value(model))

println("The solution is: ")
println("x1 = ", JuMP.value(x1))
println("x2 = ", JuMP.value(x2))
println("x3 = ", JuMP.value(x3))
println("x4 = ", JuMP.value(x4))
println("x5 = ", JuMP.value(x5))
println("x6 = ", JuMP.value(x6))
println("x7 = ", JuMP.value(x7))
println("x8 = ", JuMP.value(x8))
