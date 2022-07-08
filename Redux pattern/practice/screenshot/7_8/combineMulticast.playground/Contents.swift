import UIKit
import Combine
import Foundation
//let av = (data:"q", response:"qw") // data 형식

//let tt = av.map { _ in
//
//}
let subject = PassthroughSubject<Data, URLError>()
var subscription3: AnyCancellable? = nil
guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("url ;;")
}
let request = URLSession.shared.dataTaskPublisher(for: url).map{$0.data}.print("A").multicast(subject: subject)
let subscription1 = request.sink { _ in
    
} receiveValue: {
    print("sub 1")
    print("a", $0)
}

let subscription2 = request.sink { _ in
    
} receiveValue: {
    print("sub 2")
    print("b", $0)
}

//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    subscription3 = request.sink(receiveCompletion: { _ in
        
    }, receiveValue: {
        print("sub 3")
        print($0)
    })
//}
request.connect()
subject.send(Data())
