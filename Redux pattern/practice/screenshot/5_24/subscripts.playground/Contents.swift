import UIKit

var greeting = "Hello, playground"
protocol Human {
    associatedtype Having
    var items : [Having] { get }
    mutating func attack(count:Having) -> [Having]
    subscript(index:Having,k:Int) -> String {get set}
    var hp: Double { get }
}
//똑똑하게 Human protocol 따르면 typealias 를 ele인것 알지만,
// Having 이 Comparable인것 알아도
//ele:comparable해줘야함.
//따라서 그냥 아래 ele에만 comparable해도된다.

struct Student<ele:Comparable>: Human {
    subscript(index: ele,k:Int) -> String {
        get {
            if items[k] == index {
                return "ok"
        }
            else {
                return "nokay"
            }
        }
        
        set {

            if newValue == "qwe" {
                hp += 500
            }
        }
    }
    var hp: Double
    
    var items: [ele]
    mutating func attack(count:ele) -> [ele] {
        items.append(count)//get 이어도 바깥에서만 set 안하면됨.
        return items
    }
}

