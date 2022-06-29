import UIKit
import Combine

["A", "B", "C", "D"].publisher.collect(3).sink {
    print($0)
}

// map
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123,456].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}

// key

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x), y is \(y)")
}

publisher.send(Point(x: 5, y: 4))

// flatMap
print("ㅡㅡㅡㅡㅡㅡㅡflatMapㅡㅡㅡㅡㅡㅡㅡ")
struct School {
    
    let name: String
    let noOfStudents: CurrentValueSubject<Int, Never>

    init(name: String, noOfStudents: Int) {
        
        self.name = name
        self.noOfStudents = CurrentValueSubject(noOfStudents)
        
    }
    
}

let citySchool = School(name: "Fo Head School", noOfStudents: 100)

let school = CurrentValueSubject<School, Never>(citySchool)

school.sink {
    print($0)
}

//내부 값
school.flatMap {
                    $0.noOfStudents
            }
            .sink {
                print($0)
            }

let townSchool = School(name: "TTTT", noOfStudents: 45)

school.value = townSchool

citySchool.noOfStudents.value += 1 // flatMap 하지 않으면 여기서 fire 하지 않음.

print("replace nil")

["A", "B", nil, "D"].publisher.replaceNil(with: "*")
    .sink {
    print($0)
}

// optional 빼고싶을 때
["A", "B", nil, "D"].publisher
    .replaceNil(with: "*")
    .compactMap {
        $0
    }
    .sink {
    print($0)
}

// optional 빼고싶을 때2
["A", "B", nil, "D"].publisher
    .replaceNil(with: "*")
    .map {$0!}
    .sink {
    print($0)
}

print("ㅡㅡㅡㅡ empty ㅡㅡㅡㅡ")
let empty = Empty<Int, Never>()

empty
    .replaceEmpty(with: 1)
    .sink(receiveCompletion: {print($0)}, receiveValue: {print($0)})

print("ㅡㅡㅡㅡscanㅡㅡㅡㅡ")

let scanPublisher = (1...10).publisher
scanPublisher.scan([]) { numbers, value -> [Int] in
    numbers + [value]
}.sink {
    print($0)
}

print("ㅡㅡㅡㅡfilterㅡㅡㅡㅡ")

let numbers = (1...20).publisher
numbers.filter { $0 % 2 == 0}
    .sink {
        print($0)
    }

let words = "ap ap fr ma wa ap".components(separatedBy: " ").publisher

words.sink {
    print($0)
}
print("ㅡㅡㅡㅡremoveDuplicatesㅡㅡㅡㅡ")
words
    .removeDuplicates()//바로옆 중복된 애만 제거
    .sink {
        print($0)
    }

let strings = ["a", "1.24", "b", "3.45", "6.7"].publisher.compactMap { Float($0) }.sink {
    print($0)
}

let numbers2 = (1...500).publisher

numbers2.sink {
    print($0,"__!")
} receiveValue: {
    print($0)
}
//출력 무시하고 싶을때
numbers2.ignoreOutput()
    .sink(receiveCompletion: {print($0)}, receiveValue: {print($0)})
//

numbers2.first(where: { $0 % 2 == 0})//첫번째거 발견하고 끝냄
    .sink {
        print($0)
    }

numbers2.last(where: { $0 % 2 == 0})
    .sink {
        print($0)
    }

numbers2.dropFirst(42)//42개 버린다
    .sink {
        print($0)
    }

numbers.drop {
    $0 % 3 != 0//3으로 나누어 떨어지면 살림. 한번 살리고부터는 계속 다른모든거 살림.
}.sink {
    print($0)
}

let isReady = PassthroughSubject<Void, Never>()
let taps = PassthroughSubject<Int, Never>()

taps.drop(untilOutputFrom: isReady).sink {// isReady돼야 작동
    print($0)
}

(1...10).forEach { n in
    if n == 3 {//3일때 작동
        isReady.send()
    }
    taps.send(n)
    
}
print("ㅡㅡㅡㅡprefixㅡㅡㅡㅡ")
numbers.prefix(2).sink {
    print($0)
}

numbers.prefix(while: {
    $0 < 3
}).sink {
    print($0)
}

let problemNumbersPublisher = (1...100).publisher

problemNumbersPublisher
    .dropFirst(50)
    .prefix(20)
    .filter{ $0 % 2 == 0 }
    .sink { print($0) }

