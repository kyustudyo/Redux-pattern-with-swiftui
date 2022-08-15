//
//  DecodingViewController.swift
//  Chungsung
//
//  Created by Hankyu Lee on 2022/08/16.
//

import UIKit

struct AnyKey: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}
struct practice: Codable {
    let mealInfo: abcd
}
struct abcd: Codable {
    let abc: efg
}
struct efg: Codable {
    let k: asdf
}
struct asdf: Codable {
    let dd: String
}
//struct practice: Codable {
//    let mealInfo: String
//    let qwer: String
//}
struct DecodingStrategy {
    
    static var mealInfo: ([CodingKey]) -> CodingKey {
        return { keys -> CodingKey in
            return AnyKey(stringValue: "mealInfo")!
        }
    }
    
}

class DecodingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 괄호 개수 틀려서 안되는 이슈;;  https://jsoneditoronline.org/#left=local.surada
        // 사이트 참고
        //mealInfoqwe 같이 이상한것이 오더라도 아래 Anykey를 통해 해결가능!
        let json3 = """
        {
            "mealInfoqwe": {
                "abc": {
                        "k": {
                    "dd": "xxfg"
                    }
                }
            }
        }
        """
        //
//        {
//            "a.value": 1,
//            "b": {
//                "a.b.value": 2,
//                "c": {
//                    "a.b.c.value": 3
//                }
//            }
//        }
        
//        let json3 = """
//        {
//            "mealInfo": "qwe",
//            "qwer" : "ss"
//        }
//        """
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .custom { keys in
//            if keys.count == 1 {
//                return AnyKey(stringValue: "mealInfo")!
//            } else {
//                return AnyKey(stringValue: keys.last!.stringValue)!
//            }
            print(keys.count)
            print(keys.last!.stringValue)
            if keys.count == 1 {
                return AnyKey(stringValue: "mealInfo")!
            } else {
                return AnyKey(stringValue: keys.last!.stringValue)!
            }
            
            
//            return AnyKey(stringValue: "mealInfo")!
        }

        guard let jsonData = json3.data(using: .utf8) else {
            fatalError()
        }
        guard let army = try? decoder.decode(practice.self, from: jsonData) else {
            return
        }
        print(army.mealInfo)
//        print("??", army.mealInfo)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
