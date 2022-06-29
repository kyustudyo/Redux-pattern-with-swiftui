
import Foundation
//전역변수
struct Hike {
    
    let name: String
    let imageURL: String
    let miles: Double
    
}

extension Hike {
    
    static func all() -> [Hike] {
        
        return [
            Hike(name: "Salmonberry Trail", imageURL: "sal", miles: 6),
            Hike(name: "Tom, Dick, and Harry Mountain", imageURL: "tom", miles: 5.8),
            Hike(name: "Tamanawas Falls", imageURL: "tam", miles: 5)
        ]
        
    }
    
}

//MARK: id:\.name But i think it is a little bit dangerous. 같은 이름 존재
//It looks like it needs hashable.

//MARK: List(self.hikes, id: \.name) { hike in
//    NavigationLink(destination: HikeDetail(hike: hike)) {
//    HikeCell(hike: hike)
//    }
//}


//MARK: It is View
//struct HikeCell: View {
//
//    let hike: Hike
//
//    var body: some View {
//    }
//}
