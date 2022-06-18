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

struct DependencyInjection: View {
    @StateObject private var vm = DependncyInjectionViewModel()
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
struct PostsModel: Identifiable, Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ProductionDataService {
    
    // 2. custom init할 경우 만들때 인자를 정해야한다.
    // 3. 특정 DataService만 적용해야한다. 뷰모델에
    // singleton을 대신하자 -> Dependnecy Injection
    static let instance = ProductionDataService(name: "지금정해야한다.")
    init(name: String) {
        
    }
    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
     }
}

class DependncyInjectionViewModel: ObservableObject {
    @Published var dataArray: [PostsModel] = []
    var cancellables = Set<AnyCancellable>()
    init() {
        loadPosts()
    }
    private func loadPosts() {
        ProductionDataService.instance.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnPosts in
                self?.dataArray = returnPosts
            }
            .store(in: &cancellables)
    }
}




struct DependencyInjection_Previews: PreviewProvider {
    static var previews: some View {
        DependencyInjection()
    }
}
