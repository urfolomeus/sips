person = {:person, "Alan", "Gardner"}

# anonymous function
print_name = fn
  { :person, first_name, last_name } -> "#{first_name} #{last_name}"
end
print_name.(person)


# calling an anonymous function immediately
(fn -> "foo" end).()


# currying
add = fn
  num -> (fn num2 -> num + num2 end)
end

add3 = add.(3)

add3.(5)


# higher order functions
greet_person = fn
  greeter, {:person, first_name, last_name} -> greeter.("#{first_name} #{last_name}")
end

polite_greeter = fn
  name -> "Hello, #{name}, nice to meet you!"
end

terse_greeter = fn
  name -> "Hi, #{name}"
end


greet_person.(polite_greeter, person)
greet_person.(terse_greeter, person)
