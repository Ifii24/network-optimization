using JuMP, GLPK

model = Model(GLPK.Optimizer)

@variable(model, xAB >= 0)
@variable(model, xAD >= 0)
@variable(model, xBC >= 0)
@variable(model, xBE >= 0)
@variable(model, xDB >= 0)
@variable(model, xDE >= 0)
@variable(model, xDG >= 0)
@variable(model, xEC >= 0)
@variable(model, xEF >= 0)
@variable(model, xFC >= 0)
@variable(model, xFD >= 0)
@variable(model, xGF >= 0)

@objective(model, Min, 4*xAB + 2*xAD + 8*xBC + 5*xBE + 1*xDB + 7*xDE + 3*xDG + 1*xEC + 4*xEF + 3*xFC + 6*xFD + 2*xGF)

@constraint(model, xAB + xAD == 6)
@constraint(model, xBC + xBE - xAB - xDB == -1)
@constraint(model, -xBC - xEC - xFC == -1)
@constraint(model, xDB + xDE + xDG - xAD - xFD == -1)
@constraint(model, xEC + xEF - xBE - xDE == -1)
@constraint(model, xFC + xFD - xEF - xGF == -1)
@constraint(model, xGF - xDG == -1)

JuMP.optimize!(model)
