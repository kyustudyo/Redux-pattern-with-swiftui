//
//  Animation.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/14.
//

import SwiftUI

struct Animation: View {
    @State private var animationAmount = 1.0
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    animationAmount += 50
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            Text("asdasdsad")
            .offset(y: animationAmount)
        }
    }
}
struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
