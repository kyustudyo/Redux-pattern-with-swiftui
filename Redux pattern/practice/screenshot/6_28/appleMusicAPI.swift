//
//  ContentView.swift
//  appleMusicClone
//
//  Created by Hankyu Lee on 2022/06/28.
//
//https://leemartin.dev/creating-an-apple-music-api-token-e0e5067e4281
//eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjRCWVhMSlY1M0IifQ.eyJpYXQiOjE2NTY0MDM0OTIsImV4cCI6MTY3MTk1NTQ5MiwiaXNzIjoiSDVQRDNQOTVGNSJ9.p3e6xK9OFpdIAwbhpN-Lqav9r42QZHRiPU8PoHIFJMBRtcQVLegLYM8XMpWoEMpn0SQnwHuUyKoht1vVEZ0IYw
import SwiftUI
import StoreKit
import MediaPlayer

struct MusicAPIView: View {
    
    @State private var location = ""
    @State private var vm: ListViewModel?
    
    var body: some View {
        VStack {
            Text("Hello, IU!")
                .padding()
//                .onAppear {
//                    API.getData(url: url)
//
//
//                }
            TextField("Your Location", text: $location)
                        .onChange(of: location) {
                            print($0)
                            print(123123)
                            API.getData2(text: location) { result in
                                switch result {
                                case .success(let welcom):
                                    vm = ListViewModel(welcome: welcom)
                                case .failure(.noData):
                                    vm = nil
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        }
                        .padding()
            
            Rectangle()
                .frame(height:3)
                .padding()
            ForEach(vm?.welcome.results.terms ?? [], id: \.self) { string in
                Text(string)
            }
            Spacer()
        }
    }
}

struct MusicAPIView_Previews: PreviewProvider {
    static var previews: some View {
        MusicAPIView()
    }
}

//let urlString = "https://api.music.apple.com/v1/catalog/us/search/suggestions?term=아이&kinds=terms"

//let urlString = "https://api.music.apple.com/v1/catalog/us/search/suggestions?term=billie+eilish&kinds=terms&limit=10"
//activities, albums, apple-curators, artists, curators, music-videos, playlists, record-labels, songs, stations

// search suggestion
//let urlString = "https://api.music.apple.com/v1/catalog/kr/search/suggestions?term=아이&kinds=terms"
//let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//let url = URL(string: encodedString)!

// search hints



//let urlString = "https://api.music.apple.com/v1/catalog/kr/search/hints?term="
//let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//let url = URL(string: encodedString)!

enum NetworkError: Error {
    case badURL
    case badNet
    case badData
    case noData
}

struct API {
    
    static func getData(url:URL) {
        var getRequest = URLRequest(url: url)
        
        getRequest.httpMethod = "GET"
        getRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        getRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let token = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjRCWVhMSlY1M0IifQ.eyJpYXQiOjE2NTY0MDM0OTIsImV4cCI6MTY3MTk1NTQ5MiwiaXNzIjoiSDVQRDNQOTVGNSJ9.p3e6xK9OFpdIAwbhpN-Lqav9r42QZHRiPU8PoHIFJMBRtcQVLegLYM8XMpWoEMpn0SQnwHuUyKoht1vVEZ0IYw"
        
        getRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        getRequest.addValue("\(token)", forHTTPHeaderField: "Authorization")
        let getTask = URLSession.shared.dataTask(with: getRequest) { (data, response, error) in
                if let data = data {
//                    print("--------GET REQUEST RESPONSE START--------")
//                    print("CODE: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
//                    print("Response Data:")
                    
                    DispatchQueue.main.async {
                        print(String(data: data, encoding: .utf8) ?? "")
                    }
                }
        }
        getTask.resume()
    }
    
    static func getData2(text: String, completion: @escaping (Result<Welcome, NetworkError>) -> Void) {
        
        
        let urlString = "https://api.music.apple.com/v1/catalog/kr/search/hints?term=\(text)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        
        
        var getRequest = URLRequest(url: url)
        
        getRequest.httpMethod = "GET"
        getRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        getRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let token = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjRCWVhMSlY1M0IifQ.eyJpYXQiOjE2NTY0MDM0OTIsImV4cCI6MTY3MTk1NTQ5MiwiaXNzIjoiSDVQRDNQOTVGNSJ9.p3e6xK9OFpdIAwbhpN-Lqav9r42QZHRiPU8PoHIFJMBRtcQVLegLYM8XMpWoEMpn0SQnwHuUyKoht1vVEZ0IYw"
        
        getRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let getTask = URLSession.shared.dataTask(with: getRequest) { data, _, error in
            guard error == nil else {
                completion(.failure(.badURL))
                return
            }
            print("?s",data)
            guard let data = data else {
                completion(.failure(.badNet))
                return
            }
            if let welcome = try? JSONDecoder().decode(Welcome.self, from: data) {
                DispatchQueue.main.async {
                    print("결과: \(welcome)")
                    completion(.success(welcome))
                }
            } else {
                completion(.failure(.noData))
            }
            
        }
        getTask.resume()
    }
    
}

struct ListViewModel {
    let welcome: Welcome
}

// MARK: - Welcome
struct Welcome: Codable {
    let results: Results
}

// MARK: - Results
struct Results: Codable {
    let terms: [String]
}

