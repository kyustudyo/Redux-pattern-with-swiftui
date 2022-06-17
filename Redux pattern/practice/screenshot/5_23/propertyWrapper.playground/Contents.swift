import UIKit

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
