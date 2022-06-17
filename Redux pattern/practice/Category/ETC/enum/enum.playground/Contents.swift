import UIKit

var greeting = "Hello, playground"

enum StudyType: String {
    case hard
    case normal
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "haha", "hoho": self = .normal
        case "..", "...": self = .hard
        default: return nil
        }
    }
}

let st = StudyType(rawValue: "..")
