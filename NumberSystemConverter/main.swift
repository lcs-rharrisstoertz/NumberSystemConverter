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
print("Enter your choice (B/O/D/H): ", terminator: "")
var from = readLine()!

var startBase = Double()
var endBase = Double ()

switch from {
case "B":
    startBase = 2
case "O":
    startBase = 8
case "D":
    startBase = 10
case "H":
    startBase = 16
default:
    print("Please enter a valid number system")
}

print("What number system do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H): ", terminator: "")
let to = readLine()!

switch to {
case "B":
    endBase = 2
case "O":
    endBase = 8
case "D":
    endBase = 10
case "H":
    endBase = 16
default:
    print("Please enter a valid number system")
}

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

let decimalValue = getDecimalValue(of: numberToConvert, base: Double(startBase))


func getRepresentation(of valueToConvert: Int, inBase base: Double) -> String {
    var decimalValueLeftToConvert = valueToConvert
    var representation = ""
    while decimalValueLeftToConvert > 0 {
        let nextDigit = decimalValueLeftToConvert % Int(base)
        if base == 16 {
            switch nextDigit {
            case 0...9:
                representation = String(nextDigit) + representation
            case 10:
                representation = "A" + representation
            case 11:
                representation = "B" + representation
            case 12:
                representation = "C" + representation
            case 13:
                representation = "D" + representation
            case 14:
                representation = "E" + representation
            case 15:
                representation = "F" + representation
            default:
                break
            }
        } else {
            representation = String(nextDigit) + representation
        }
        decimalValueLeftToConvert = decimalValueLeftToConvert / Int(base)
    }
    return representation
    
}

let convertedValue = getRepresentation(of: Int(decimalValue), inBase: Double(endBase))
print("Your converted value is \(convertedValue)")
