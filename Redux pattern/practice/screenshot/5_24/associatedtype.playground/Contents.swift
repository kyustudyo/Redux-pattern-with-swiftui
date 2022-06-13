import UIKit

var greeting = "Hello, playground"
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    
//    typealias Item = Int//생략가능
    typealias Item = Int
    // original IntStack implementation
    var items = [Item]()
    mutating func push(_ item: Item) {
        items.append(item)
    }
    mutating func pop() -> Item {
        return items.removeLast()
    }
    // conformance to the Container protocol
    
    mutating func append(_ item: Item) {
        self.push(item)
    }
    var count: Item {
        return items.count
    }
    subscript(i: Item) -> Item {
        return items[i]
    }
}
let a = IntStack(items: [1,3,5])
a[0]

struct Stack<Element>: Container {
    // original Stack<Element> implementation
//    typealias Item = Element
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
let stack = Stack<Int>()
print("rf")
//associated type constraints
protocol Container2 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
