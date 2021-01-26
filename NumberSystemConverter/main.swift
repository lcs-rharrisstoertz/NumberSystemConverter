//
//  main.swift
//  NumberSystemConverter
//
//  Created by Harris-Stoertz, Rowan on 2021-01-26.
//

import Foundation

print("What number system do you want to convert from?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H): ", terminator: "") //keep following output on the same line
let from = readLine()!

var startBase = 0.0

switch from {
case "B":
    var startBase = 2.0
case "O":
    var startBase = 8.0
case "D":
    var startBase = 10.0
case "H":
    var startBase = 16.0
default:
    print("Please enter a valid number system")
}

print("What number system do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H): ", terminator: "") //keep following output on the same line
let to = readLine()!

print("What number do you want to convert?")
let numberToConvert = readLine()!

func getDecimalValue (of value: String, base: Double) -> Double {
    var exponent = 0.0
    var decimalEquivalent = 0.0
    for character in value.reversed() {
        if let digit = Double(String(character)){
            decimalEquivalent += digit * pow(base, exponent)
        } else {
            let nextCharacter = String(character)
            for scalar in nextCharacter.unicodeScalars {
                decimalEquivalent += Double(scalar.value - 55) * pow(base, exponent)
            }
        }
        exponent += 1
    }
    return (decimalEquivalent)
    
}

let decimalValue=getDecimalValue(of: numberToConvert, base: startBase)

switch to {
case:
    
}
