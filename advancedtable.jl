using JuliaDB

# Import Data from a CSV file
println("Table Loaded From CSV:")
t = loadtable("hflights.csv")
println(t)

# Use filter function to select certain rows
# The first parameter is a lambda that returns a boolean
# The lambda recieves an object that represents the row
# If the lambda is true the row will be returned
# The second parameter is the table itself
println("Filtered Table:")
println(filter(x -> (x.Month == 1) && (x.DayofMonth == 1), t))

# The select function is used to return only certain columns
# The first parameter is the table
# The second parameter is a tuple containing the column names
println("Selecting Only the Year and Month Columns:")
println(select(t, (:Month, :Year)))

# Since the select function returns a table it can be nested into the filter function
println("Example showing the select function being nested into the filter function:")
println(filter(x -> (x.Month == 1) && (x.DayofMonth == 1), select(t, (:Month, :DayofMonth))))

# The map function can be used to itterate through each row 
# The first parameter is a lambda
# The second parameter is a table
# The map function returns an array of the value returned by the lambda
println("Return Array of flight speed:")
s = map(x -> x.Distance/x.AirTime, t)
println(s[1:20])

# Add a column to the table using the speed Array
println("Showing table with new column:")
t = transform(t, :Speed => s)
println(t)

# Saving the table in a binary format for faster loading times
save(t, "./data/db")

# Load table from binary to show performance benefits
t = load("./data/db")
println("Table Loaded From Binary: \n $t")