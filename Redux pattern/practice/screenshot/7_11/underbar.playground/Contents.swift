import UIKit

var greeting = "Hello, playground"

class A {
    private let a: String = "qqq"
    func B() -> String {
        return a
    }
    var a2: String {
        return a
    }
}

let k = A()
k.B()
k.a2
