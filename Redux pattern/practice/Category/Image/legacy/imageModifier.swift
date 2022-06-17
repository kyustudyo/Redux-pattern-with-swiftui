//
//  imageModifier.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/17.
//

import SwiftUI
enum number {
    case a
    case b
    
}
struct imageModifier: View {
    var body: some View {
        Image("1")
            .resizable()
            .getSmallSize(width: 300)
    }
}

struct imageModifier_Previews: PreviewProvider {
    static var previews: some View {
        imageModifier()
    }
}

extension Image {
    func getSmallSize(width: Double) -> some View{
        return self.frame(width: width, height: 30)
    }
}
