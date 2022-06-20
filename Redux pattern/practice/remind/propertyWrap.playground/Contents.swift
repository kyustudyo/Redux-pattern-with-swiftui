import UIKit
print("t")
@propertyWrapper
class multiMulti {
    var value: Int = 0
    var wrappedValue: Int {
        get { value }
        set {
            if newValue > 0 {
                value = newValue * newValue
            } else {
                value = newValue
            }
        }
    }
}
struct mathClub {
    @multiMulti
    var val: Int
}
var math = mathClub()
math.val = -5
print(math.val)
math.val = 5
print(math.val)

@propertyWrapper
class UrlEncode {
    private(set) var value : String = ""
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
                value = url
            }
                
        }
    }
}
struct Resource {
    @UrlEncode
    var city: String
    var url : String {
        "https://www.ave\(city).com"
    }
}
extension Resource {//bug not yet to be fixed.
    init(city:String) {
        self.city = city
    }
}
let r = Resource(city: "ho")
print(r.url)

