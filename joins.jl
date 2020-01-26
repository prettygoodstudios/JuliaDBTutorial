using JuliaDB


c = [x for x in 1:5]
d = [
    "Bob",
    "Thomas",
    "John",
    "Nick",
    "Samantha"
]
e = [
    "Mike",
    "John",
    "Nate",
    "Mars",
    "Samy"
]
f = [x for x in 4:8]

t1 = table(c, d, names=[:id, :name], pkey= :id)
t2 = table(f, e, names=[:id, :nick_name], pkey= :id)
# Example of joining tables
# The column are matched using the table private keys
# The how parameter indicates the method for joining
# There are three options :inner, :outer, :left

println("Inner Join:")
println(join(t1, t2, how = :inner))

println("Outer Join:")
println(join(t1, t2, how = :outer))

println("Left Join:")
println(join(t1, t2, how = :left))
println("Left Join Switching Order of Tables:")
println(join(t2, t1, how = :left))