import UIKit
import Combine
//let av = (data:"q", response:"qw") // data 형식

//let tt = av.map { _ in
//
//}
guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("url ;;")
}
let request = URLSession.shared.dataTaskPublisher(for: url).map{$0.data}.print("A")
let subscription1 = request.sink { _ in
    
} receiveValue: {
    print("a", $0)
}

let subscription2 = request.sink { _ in
    
} receiveValue: {
    print("b", $0)
}
//두번의 api 소통은 좀.. 이라는 결론.
