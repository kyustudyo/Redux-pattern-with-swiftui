import UIKit
import Combine
class Person {
    let name: String
    init(name:String) {
        self.name = name
    }
}
let person1 = Person(name: "q")
let person2 = Person(name: "w")
let subject = PassthroughSubject<Person, Never>()

//let cancellable = subject
//    .flatMap({ person in
//        person
//    })
//    .sink { str in
//        print(str)
//    }
  
subject.send(person1)
subject.send(person2)

var greeting = "Hello, playground"
