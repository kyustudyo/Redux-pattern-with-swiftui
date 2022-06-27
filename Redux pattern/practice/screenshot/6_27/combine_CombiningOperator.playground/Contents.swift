import UIKit
import Combine

let numbers = (1...5).publisher
let numbers2 = (500...505).publisher

//prepend
numbers
    .prepend(-1, -2)
    .prepend(-100, -200)
    .prepend(numbers2)//가장 먼저 append 됨
    .sink{
        print($0)
    }

//append
numbers
    .append(100,200,300)
    .append(400,500)
    .sink{
        print($0)
    }

// 패스안에 패스
let publisher1 = PassthroughSubject<String, Never>()
let publisher2 = PassthroughSubject<String, Never>()

let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()

publishers.switchToLatest().sink {
    print($0)
}

publishers.send(publisher1)

publisher1.send("hihi")
publisher1.send("byebye")

publishers.send(publisher2)// 바꾸기. 마지막으로 들어온 애한테 집중.
publisher2.send("????")
publisher1.send("!!!!!")// x



