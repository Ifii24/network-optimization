using JuMP, GLPK

model = Model(GLPK.Optimizer)

 #IP FORMULATION

@variable(model, xAB_1 >= 0, Int)
@variable(model, xAD_1 >= 0, Int)
@variable(model, xBC_1 >= 0, Int)
@variable(model, xBD_1 >= 0, Int)
@variable(model, xCD_1 >= 0, Int)
@variable(model, xDA_1 >= 0, Int)
@variable(model, xDB_1 >= 0, Int)
@variable(model, xDE_1 >= 0, Int)
@variable(model, xEA_1 >= 0, Int)
@variable(model, xAB_2 >= 0, Int)
@variable(model, xAD_2 >= 0, Int)
@variable(model, xBC_2 >= 0, Int)
@variable(model, xBD_2 >= 0, Int)
@variable(model, xCD_2 >= 0, Int)
@variable(model, xDA_2 >= 0, Int)
@variable(model, xDB_2 >= 0, Int)
@variable(model, xDE_2 >= 0, Int)
@variable(model, xEA_2 >= 0, Int)
@variable(model, xAB_3 >= 0, Int)
@variable(model, xAD_3 >= 0, Int)
@variable(model, xBC_3 >= 0, Int)
@variable(model, xBD_3 >= 0, Int)
@variable(model, xCD_3 >= 0, Int)
@variable(model, xDA_3 >= 0, Int)
@variable(model, xDB_3 >= 0, Int)
@variable(model, xDE_3 >= 0, Int)
@variable(model, xEA_3 >= 0, Int)


@objective(model, Min, 8*xAB_1 + 1*xAD_1 + 7*xBC_1 + 2*xBD_1
                        + 8*xCD_1 + 1*xDA_1 + 2*xDB_1 + 1*xDE_1 + 7*xEA_1
                        + 16*xAB_2 + 2*xAD_2 + 14*xBC_2 + 4*xBD_2
                        + 16*xCD_2 + 2*xDA_2 + 4*xDB_2 + 2*xDE_2 + 14*xEA_2
                        + 32*xAB_3 + 4*xAD_3 + 28*xBC_3 + 8*xBD_3
                        + 32*xCD_3 + 4*xDA_3 + 8*xDB_3 + 4*xDE_3 + 28*xEA_3)

@constraint(model, xDB_1 + xAB_1 - xBD_1 - xBC_1 = 0)
@constraint(model, xBC_1 + xCD_1 = 0)
@constraint(model, xDE_1 + xEA_1 = 0)
@constraint(model, xEA_2 + xDA_2 - xAB_2 - xAD_2 = 0)
@constraint(model, xDB_2 + xAB_2 - xBD_2 - xBC_2 = 0)
@constraint(model, xBC_2 - xCD_2 = 0)
@constraint(model, xBC_3 - xCD_3 = 0)
@constraint(model, xCD_3 + xBD_3 + xAD_3  - xDB_3 - xDA_3 - xDE_3 = 0)
@constraint(model, xDB_1 + xAB_1 - xBD_1 - xBC_1 = 0)
@constraint(model, xEA_1 + xDA_1 - xAB_1 + xAD_1 = -3)
@constraint(model, xDE_2 + xEA_2 = -4)
@constraint(model, xDB_3 + xAB_3 - xBD_3 - xBC_3 = -2)
@constraint(model, xCD_1 + xBD_1 + xAD_1  - xDB_1 - xDA_1 - xDE_1 = 3)
@constraint(model, xCD_2 + xBD_2 + xAD_2  - xDB_2 - xDA_2 - xDE_2 = 4)
@constraint(model, xEA_3 + xDA_3 - xAB_3 + xAD_3 = 2)
@constraint(model, 1*xAB_1 + 2*xAB_2 + 4*xAB_3 <= 14)
@constraint(model, 1*xBC_1 + 2*xBC_2 + 4*xBC_3 <= 13)
@constraint(model, 1*xBD_1 + 2*xBD_2 + 4*xBD_3 <= 10)
@constraint(model, 1*xCD_1 + 2*xCD_2 + 4*xCD_3 <= 9)
@constraint(model, 1*xDA_1 + 2*xDA_2 + 4*xDA_3 <= 2)
@constraint(model, 1*xDB_1 + 2*xDB_2 + 4*xDB_3 <= 3)
@constraint(model, 1*xDE_1 + 2*xDE_2 + 4*xDE_3 <= 8)
@constraint(model, 1*xEA_1 + 2*xEA_2 + 4*xEA_3 <= 16)


JuMP.optimize!(model)

println("The objective value is: \nz = ", JuMP.objective_value(model))


8*xAB_1 + 1*xAD_1 + 7*xBC_1 + 2*xBD_1
                        + 8*xCD_1 + 1*xDA_1 + 2*xDB_1 + 1*xDE_1 + 7*xEA_1
                        + 16*xAB_2 + 2*xAD_2 + 14*xBC_2 + 4*xBD_2
                        + 16*xCD_2 + 2*xDA_2 + 4*xDB_2 + 2*xDE_2 + 14*xEA_2
                        + 32*xAB_3 + 4*xAD_3 + 28*xBC_3 + 8*xBD_3
                        + 32*xCD_3 + 4*xDA_3 + 8*xDB_3 + 4*xDE_3 + 28*xEA_3)

println("The solution is: ")
println("xAB_1 = ", JuMP.value(xAB_1))
println("xAB_2 = ", JuMP.value(xAB_2))
println("xAB_3 = ", JuMP.value(xAB_3))
println("xAD_1 = ", JuMP.value(xAD_1))
println("xAD_2 = ", JuMP.value(xAD_2))
println("xAD_3 = ", JuMP.value(xAD_3))
println("xBC_1 = ", JuMP.value(xBC_1))
println("xBC_2 = ", JuMP.value(xBC_2))
println("xBC_3 = ", JuMP.value(xBC_3))
println("xBD_1 = ", JuMP.value(xBD_1))
println("xBD_2 = ", JuMP.value(xBD_2))
println("xBD_3 = ", JuMP.value(xBD_3))
println("xCD_1 = ", JuMP.value(xCD_1))
println("xCD_2 = ", JuMP.value(xCD_2))
println("xCD_3 = ", JuMP.value(xCD_3))
println("xDA_1 = ", JuMP.value(xDA_1))
println("xDA_2 = ", JuMP.value(xDA_2))
println("xDA_3 = ", JuMP.value(xDA_3))
println("xDB_1 = ", JuMP.value(xDB_1))
println("xDB_2 = ", JuMP.value(xDB_2))
println("xDB_3 = ", JuMP.value(xDB_3))
println("xDE_1 = ", JuMP.value(xDE_1))
println("xDE_2 = ", JuMP.value(xDE_2))
println("xDE_3 = ", JuMP.value(xDE_3))
println("xEA_1 = ", JuMP.value(xEA_1))
println("xEA_2 = ", JuMP.value(xEA_2))
println("xEA_3 = ", JuMP.value(xEA_3))
