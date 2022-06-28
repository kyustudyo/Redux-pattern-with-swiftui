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

// 패스안에 패스
//let publisher3 = PassthroughSubject<String, Never>()
//publisher3.switchToLastest() //자체가 안됨


print("ㅡㅡㅡㅡImages 실험ㅡㅡㅡㅡ")
let images = ["1","2","3"]
var index = 0

func getImage() -> AnyPublisher<UIImage?, Never> {
    return
    Future<UIImage?, Never> { promise in
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
            promise(.success(UIImage(named: images[index])))
        }
    }
    .print()
    .map { $0 }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}

let taps = PassthroughSubject<Void, Never>()

let subscription = taps.map { _ in getImage() }
    .print()
    .switchToLatest().sink {
        print($0)
}

taps.send()

DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
    index += 1
    taps.send()
}

DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
    index += 1
    taps.send()
}


print("ㅡㅡㅡㅡMergeㅡㅡㅡㅡ")
//두개다 받고싶을때
let publisher4 = PassthroughSubject<Int, Never>()
let publisher5 = PassthroughSubject<Int, Never>()

publisher4.merge(with: publisher5).sink {
    print($0)
}

publisher4.send(10)
publisher4.send(20)
publisher5.send(30)
publisher5.send(40)


print("ㅡㅡㅡㅡCombineLatestㅡㅡㅡㅡ")

let publisher10 = PassthroughSubject<Int, Never>()
let publisher11 = PassthroughSubject<String, Never>()

publisher10.combineLatest(publisher11)
    .sink {
        print("1:\($0), 2:\($1)")
    }
publisher10.send(1)
publisher11.send("a")
publisher11.send("b")
publisher11.send("c")//최근것 반영

print("ㅡㅡㅡㅡzipㅡㅡㅡㅡ")

let publisher12 = PassthroughSubject<Int, Never>()
let publisher13 = PassthroughSubject<String, Never>()

publisher12.zip(publisher13).sink {
    print("P1: \($0), P2: \($1)")
}

publisher12.send(1)
publisher12.send(2)
publisher13.send("a")//쌍이 모일때만.
publisher13.send("b")


