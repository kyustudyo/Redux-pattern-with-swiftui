//
//  Combine.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/26.
//

import SwiftUI
import Combine

enum CombineError: Error {
    case subscribeError
}
class StringSubscriber: Subscriber {
    func receive(completion: Subscribers.Completion<CombineError>) {
        print("complete")
    }
    
    func receive(subscription: Subscription) {
        print("subscription success")
        subscription.request(.max(1))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(input, "from subscriber")
        return .max(1)// 매번 받을 때 마다 하나 더 요청
//        return .unlimited
    }
    
//    func receive(completion: Subscribers.Completion<Never>) {
//        print("complete!")
//    }
    
    typealias Input = String
    
//    typealias Failure = Never
    typealias Failure = CombineError
    
    
}
struct Combine: View {
    
    let publisher = ["a","b","c","d","e","f","g"].publisher
    
    let subscriber = StringSubscriber()
    
    let subject = PassthroughSubject<String, CombineError>()
    
    let typeEraserSubject = PassthroughSubject<String, CombineError>().eraseToAnyPublisher()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
//                publisher.subscribe(subscriber)
                
                // subscribe를 통해서
                subject.subscribe(subscriber)
                
                // sink를 통해서
                let subscription = subject.sink { completion in
                    print("from sink")
                } receiveValue: { value in
                    print(value, "from sink")
                }
                
                // subscript한 후에 send 해야함
                // subject는 publish, subscribe 둘 다 할 수 있어서 좋다.
                
                subject.send("A")
                subject.send("B")
                subscription.cancel()// 도중에 끊기
                subject.send("C")
                subject.send("D")

            }
    }
}

struct Combine_Previews: PreviewProvider {
    static var previews: some View {
        Combine()
    }
}
