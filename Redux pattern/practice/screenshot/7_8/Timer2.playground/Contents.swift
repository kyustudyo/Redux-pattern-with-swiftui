import UIKit
import Combine

let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .scan(0) { int, _ in
        return int + 1
    }
    .sink { int in
        print(int)
    }
    
