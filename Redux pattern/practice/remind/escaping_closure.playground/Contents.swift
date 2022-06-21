import UIKit
typealias voVo = ()->()
var handlers : [voVo] = []
func withEscaping(clo: @escaping ()->Void){
    handlers.append(clo)
}
func withNonEscaping(clo: ()->Void){
    clo()
}
class MyClass {
    deinit{
        print("deinit")
    }
    
    var x = 10
    
    func callFunc() {
        withEscaping { [weak self] in// without weak self captured list, strong reference is made. weak self -> nil 이면 deinit됨.
            self?.x += 100
        }
        withNonEscaping {
            x += 10
        }
    }
}
var k:MyClass? = MyClass()
k?.callFunc()
print(k!.x)
handlers.first!()
print(k!.x)
handlers.first!()
print(k!.x)
k?.callFunc()
print(k!.x)
k = nil
print("ㅡㅡㅡㅡㅡ")
class Singer{
    init(){
        print("singer init")
        
    }
    deinit {
        print("singer deinit")
    }
    func playSong() {
        print("lala")
    }
}
func sing() -> () -> Void {
    let taylor = Singer()

    let singing = {
        [weak taylor] in
        taylor?.playSong()
        return
    }

    return singing
}

let singe = sing()
print("is it de?")
singe()
//노래부름. 단 strong ref 일때.
//
func sing2() -> () -> Void {
    let taylor = Singer()

    let singing = { [weak taylor] in
        taylor?.playSong()
        return
    }
    return singing
}
let sing2f = sing2()
//deinit안함.
//weak self 하면 함

