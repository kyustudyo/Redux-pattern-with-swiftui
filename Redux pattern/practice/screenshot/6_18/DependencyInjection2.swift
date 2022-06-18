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

// 여기서 1,2번을 해결한다.

struct DependencyInjection2: View {
//    @StateObject private var vm = DependncyInjectionViewModel2()
    @StateObject private var vm: DependncyInjectionViewModel2
    init(dataService: ProductionDataService2){
        _vm = StateObject(wrappedValue: DependncyInjectionViewModel2(dataService: dataService))
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
struct PostsModel2: Identifiable, Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ProductionDataService2 {
    
    // 2. custom init할 경우 만들때 인자를 정해야한다.
    // 3. 특정 DataService만 적용해야한다.
    // singleton을 대신하자 -> Dependnecy Injection
//    static let instance = ProductionDataService2(name: "지금정해야한다.")

//    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel2], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [PostsModel2].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
     }
}

class DependncyInjectionViewModel2: ObservableObject {
    @Published var dataArray: [PostsModel2] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: ProductionDataService2
    init(dataService: ProductionDataService2) {// dependency injection
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




struct DependencyInjection_Previews2: PreviewProvider {
    
    static let dataService = ProductionDataService2(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    static var previews: some View {
        DependencyInjection2(dataService: dataService)
        // init customizing 해결
        // test할때 아주 좋다.
    }
}

