import Foundation

func factorial(of number: Int) -> Int? {
    var res: Int?
    
    if number <= 0 {
        res = nil
    } else {
        res = 1
        for factor in 1 ... number {
            res = res! * factor
        }
    }
    return res
}

// :Multiple Optional Bindings in one line
if let x = factorial(of: 3), let y = factorial(of: 2), let z = factorial(of: 4) {
    print("x + y + z = \(x + y + z)")
} else {
    print("One of the factorial returns nil")
}

if let x = factorial(of: 3), let y = factorial(of: -2), let z = factorial(of: 4) {
    print("x + y + z = \(x + y + z)")
} else {
    print("One of the factorial returns nil")
}

