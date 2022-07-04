import UIKit
import Combine

let intArray = [1,3,8,22].publisher
intArray
    .min()
    .sink {
        print($0)
    }
intArray
    .max()
    .sink{
        print($0)
    }

let stringArray = ["a","b","c"].publisher
stringArray
    .first()
    .sink{
        print($0)
    }

stringArray
    .first(where: {
        "con".contains($0)
    })
    .sink{
        print($0)
    }

let publisher = [1,2,3,4].publisher

publisher.output(at: 2).sink {
    print($0)
}

publisher.output(in: (0...2)).sink {
    print($0)
}

let passPublisher = PassthroughSubject<Int, Never>()

passPublisher.count()
    .sink {
        print($0)
    }
//passPublisher.send(5)//안하는 이유는 종료를 안시켜서 끝난지 몰라서
//passPublisher.send(completion: .finished)

passPublisher.send(3)
passPublisher.send(3)
passPublisher.send(3)
passPublisher.send(3)
passPublisher.send(completion: .finished)

let publisher3 = ["a","b","c","d"].publisher//있나 없나
publisher3.contains("e").sink {
    print($0)
}

let publisher4 = [1,2,3,4,5].publisher//전체가 even인지
publisher4.allSatisfy { $0 % 2 == 0}.sink { allEven in
    print(allEven)
}

let publisher5 = [1,2,3,4,5].publisher
publisher5.reduce(0) { accumulator, value in
    print("accumlator: \(accumulator), and the value is \(value)")
    return accumulator + value
}.sink {
    print($0)
}

struct Post: Codable {
    let title: String
    let body: String
}

func getPosts() -> AnyPublisher<[Post], Error> {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        fatalError("Invalid URl")
    }
    return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}

struct ViewModel {
    var posts: [Post]
}

var vm: ViewModel = ViewModel(posts: [])
let cancellable = getPosts().sink(receiveCompletion: {_ in} , receiveValue: {
    print("1")
    vm = ViewModel.init(posts: $0)
    print(vm.posts[0])
})
// 변수에 남겨 놔야한다. 아니면 그 scope에 빠져나오면 사라진다.
print("2")
