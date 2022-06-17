import UIKit

var greeting = "Hello, playground"

struct Message {
    let sender: String // (보낸 유저의 고유 id)
    let body: String // 채팅 메시지
    let timeStamp: Int // (yyyyMMddhhmm)
    let typeCode: Int // (0 - 일반 채팅, 1 - 입장 채팅)
}

extension Message: CustomStringConvertible {
    var description: String {
        switch type {
        case .normal:
            return "메시지 내용: \(body) 보낸 시간: \(timeStamp)"
        case .entrance:
            return "입장 유저: \(sender) 입장 시간: \(timeStamp)"
        }
    }
}

extension Message {
    var type: MessageType {
        switch typeCode {
        case 0:
            return .normal
        case 1:
            return .entrance
        default:
            fatalError("알 수 없는 메시지 타입")
        }
    }
}

extension Message {
    enum MessageType {
        case normal
        case entrance
    }
}
//let ad = Message(sender: "", body: "", timeStamp: 0, typeCode: 0)
//
//struct a {
//    var k = 0
//}
//
//extension a {
//    enum yangOrEum {
//        case yang
//        case eum
//    }
//}
//extension a {
//    var type: yangOrEum {
//        switch k {
//        case 0:
//            return .eum
//        case 1:
//            return .yang
//        default:
//            return .yang
//        }
//    }
//}

enum ClassRoom: String {
    case math = "수학"
    case english = "영어"
    static func of(_ code: Int) -> Self {
        switch code {
        case 0:
            return .math
        case 1:
            return .english
        default:
            fatalError("정의되지 않음")
        }
    }
}

let a = ClassRoom.english
let b = ClassRoom(rawValue: "수학")
ClassRoom.of(0)
