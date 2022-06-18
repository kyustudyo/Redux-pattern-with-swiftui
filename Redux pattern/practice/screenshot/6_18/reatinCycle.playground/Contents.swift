import UIKit

var greeting = "Hello, playground"

class abc {
    var k = 0
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}

var a: abc? = abc()
weak var b: abc? = a // weak 므로 ARC가 증가하지 않는다.
a = nil // weak keyword가 없으면 deinit 되지 않는다.
b = nil // weak이 없을 경우 이 단계를 거쳐양 deinit된다.$
