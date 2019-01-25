require_relative '../app/models/comedian.rb'

Comedian.destroy_all
Comedian.create(name: "Pete Holmes", age: 39, city: "Los Angeles, CA")
Comedian.create(name: "Jerry Seinfeld", age: 64, city: "New York City, NY")
Comedian.create(name: "Larry David", age: 71, city: "New York City, NY")
Comedian.create(name: "Mike Birbiglia", age: 55, city: "Brookline, MA")
Comedian.create(name: "Jon Stewart", age: 56, city: "Lawrenceville, NJ")
Comedian.create(name: "John Oliver", age: 41, city: "Birmingham, England")
Comedian.create(name: "Hannibal Buress", age: 35, city: "Chicago, IL")
Comedian.create(name: "Tig Notaro", age: 47, city: "Jackson, MS")
Comedian.create(name: "Ryan Hamilton", age: 42, city: "Ashton, ID")
Comedian.create(name: "Hasan Minhaj", age: 33, city: "Davis, CA")
Comedian.create(name: "Neal Brennan", age: 45, city: "Villanova, PA")
Comedian.create(name: "Dave Chappelle", age: 45, city: "Washington D.C.")
Comedian.create(name: "Mark Normand", age: 34, city: "New Orleans, LA")
