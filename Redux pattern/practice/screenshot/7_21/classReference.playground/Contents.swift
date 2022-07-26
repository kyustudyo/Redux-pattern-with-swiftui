import UIKit

var greeting = "Hello, playground"


class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//class b {
//    
//}
//class Word {
//    let a: String
//    init(a: String) {
//        self.a = a
//    }
//    weak var words: [Word]?
//}
//
//let w1 = Word(words: [Word])
