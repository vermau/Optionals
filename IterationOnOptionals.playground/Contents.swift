import Foundation

let strings = ["One", "2", "Three", "4", "Five", "6"]

/*
 :Since Int.init(String) is a Failable initializer
 :integers array will be of type [Int?] as inferred by swift
 */
let integers = strings.map{Int($0)}

// :Standard Optional Binding
for integer in integers {
    if let integer = integer {
        print("\(integer)")
    }
}

print("--------------")

// :FOR LOOP with a WHERE clause
for integer in integers where integer != nil {
    print("\(integer!)")
}

print("--------------")

// :Using .some(x) at FOR LOOP level with a CASE statement
// :.some(x) comes from Optionals Enum where an Optional value is either some(x) or nil
for case let .some(integer) in integers {
    print("\(integer)")
}

print("--------------")

// :Using Optional Binding at FOR LOOP level with a CASE statement
for case let integer? in integers {
    print("\(integer)")
}
