//
//  DependencyInjection.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/18.
//

import SwiftUI
import Combine

// Dependency injection 의 필요성
// singleton 문제됨
// 1. global -> 어디서나 접근가능. 여러 스레드에서 접근할 경우 문제

// 여기서 3번을 해결한다.

struct DependencyInjection3: View {
//    @StateObject private var vm = DependncyInjectionViewModel2()
    @StateObject private var vm: DependncyInjectionViewModel3
    init(dataService: DataServiceProtocol){
        _vm = StateObject(wrappedValue: DependncyInjectionViewModel3(dataService: dataService))
    }
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}
struct PostsModel3: Identifiable, Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostsModel3], Error>
    
}
class ProductionDataService3: DataServiceProtocol {
    
    // 2. custom init할 경우 만들때 인자를 정해야한다.
    // 3. 특정 DataService만 적용해야한다.
    // singleton을 대신하자 -> Dependnecy Injection
//    static let instance = ProductionDataService2(name: "지금정해야한다.")

//    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel3], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [PostsModel3].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
     }
}

class MockDataService: DataServiceProtocol {
//    let testData: [PostsModel3] = [
//        PostsModel3(userId: 1, id: 1, title: "1", body: "1"),
//        PostsModel3(userId: 2, id: 2, title: "2", body: "2")
//    ]
    let testData: [PostsModel3]
    init(data: [PostsModel3]?) {
        self.testData = data ?? [
                PostsModel3(userId: 1, id: 1, title: "1", body: "1"),
                PostsModel3(userId: 2, id: 2, title: "2", body: "2")
        ]
    }
    func getData() -> AnyPublisher<[PostsModel3], Error> {
        Just(testData)
            .tryMap({$0})
            .eraseToAnyPublisher()
    }
    
    
}
class DependncyInjectionViewModel3: ObservableObject {
    @Published var dataArray: [PostsModel3] = []
    var cancellables = Set<AnyCancellable>()
//    let dataService: ProductionDataService3
    let dataService: DataServiceProtocol
    init(dataService: DataServiceProtocol) {// dependency injection
        self.dataService = dataService
        loadPosts()
    }
    private func loadPosts() {
//        ProductionDataService2.instance.getData()
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnPosts in
                self?.dataArray = returnPosts
            }
            .store(in: &cancellables)
    }
}




struct DependencyInjection_Previews3: PreviewProvider {
    static let dataService = MockDataService(data: nil)
//    static let dataService = ProductionDataService3(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    static var previews: some View {
        //protocol을 줬기때문에 어떠한 dataservice를 swap in and out 할 수 있다.
        DependencyInjection3(dataService: dataService)
        // init customizing 해결
        // test할때 아주 좋다.
    }
}

