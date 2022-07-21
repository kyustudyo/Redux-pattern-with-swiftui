
import Foundation
import Combine

struct Resource<T: Codable> {
    let urlString: String
}
protocol Webservice {
    static func searchTask<Thema>(resource: Resource<Thema>) -> AnyPublisher<Thema, Error>
}
struct HintResponse:Codable {
    let results: [HintSuggestion]
}
struct HintResult {
    let suggestions: [HintSuggestion]
}
struct HintSuggestion:Codable {
    let displayTerm: String
}

struct FakeSearchService: Webservice {
    static func searchTask<Thema>(resource: Resource<Thema>) -> AnyPublisher<Thema, Error> where Thema : Codable {
        print(Thema.self)
        switch Thema.self {
        case let thema as HintResponse.Type://.type 붙여야함. is 안됨
            print("kk")
            return Just(HintResponse(results: [HintSuggestion(displayTerm: "sdfd")]))
                .tryMap{$0 as! Thema}.eraseToAnyPublisher()
        default :
            print("fd")
            return Just(HintResponse(results: [HintSuggestion(displayTerm: "sdfd")]))
                .tryMap{$0 as! Thema}.eraseToAnyPublisher()
        }
    }
    
    
}
FakeSearchService.searchTask(resource: Resource<HintResponse>(urlString: "df"))
