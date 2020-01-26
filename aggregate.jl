using JuliaDB

a = [x for x in 1:100]
b = rand(1:1000, 100)

t = table(a, b, names=[:id, :val])

# Example of reduce
# The first parameter is the function that is applied to each value 
# The second parameter is the table 
# This finds the sum of the value column
println("Sum of value column val:")
println(reduce(+, t, select = :val))

# Example how tuple of functions can be passed to first parameter
println("Min and Max of column val:")
println(reduce((min, max), t, select = :val))

# Example of how using defined function can be passed in
function sum(a, b)
    return a+b 
end 
println("Custom multiply function passed to reduce:")
println(reduce(sum, t, select = :val)) 



