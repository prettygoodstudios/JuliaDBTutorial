using JuliaDB


# Example of simple table without column names and no private key

# Create array that will serve as first column using a compreshension
a = [x for x in 1:100]

# Create array that will serve as second column using the rand function
b = rand(1:500, 100)

# Instantiate table using the two arrays
# Each non labeled parameter in the table function is a column
# Columns must be single dimensional arrays

println("Unnamed Table:")
t = table(a, b)
println(t)

# You can optionally declare column names and a private key
# The private key is the default column used for sorting and is used in joins

println("Named Table:")
namedTable = table(a, b, names=[:id, :val], pkey=:id)
println(namedTable)

# In Julia there are mutating and non mutating functions
# Mutating functions manipulate the parameters they recieve
# It is naming convention in Julia for mutating functions to end in u!

# Both of these sorts are sorting by the private key in ascending order

# Non mutating sort of table

println("Sorted Table Output")
println(sort(namedTable))
println("Proof that it did not mutate table:")
println(namedTable)

# Mutating sort of table
# Mutating sort cannot be performed on a table with a private key
println("Mutating Sort Output:")
println(sort!(t))
println("Proof it did mutate table:")
println(t)

# Sort by private key descending order
println("Table sorted by private key in descending order:")
println(sort(namedTable, rev=true))

# Sort by column other than private key
println("Table sorted by val:")
println(sort(namedTable, :val))

# Retrive row by private key
println("Row retrived from table:")
println(namedTable[3])
