import Foundation
//: [Previous](@previous)

//: # Strings

let firstName = "Rafał"
print(firstName)
// Rafał

let lastName = "Kwiatkowski"
print(lastName)
// Kwiatkowski


//: ## Combining Strings
let fullName = firstName + " " + lastName
print(fullName)
// Michał Dąbrowski

//: ## Modifying a String
var someString = "Cześć!"
print(someString)
// Cześć

someString += " Jak się masz?"
print(someString)
// Cześć! Jak się masz?

//: ## String interpolation
let a = 6			// Inferred as Int
let b = 7			// Inferred as Int
let complexMath = "\(a) times \(b) equals \(a * b)"
print(complexMath)
// 6 times 7 equals 42

//: ### You cannot modify constant Strings
let stringConstant = "Wydział"
//stringConstant += " WEITI"	// Cannot modify a String constant

//: ## String enumeration
for character in fullName {
	print(character)
}

//: [Next](@next)
