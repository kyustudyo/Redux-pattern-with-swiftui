//
//  Animation5.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/14.
//

import SwiftUI

struct Animation5: View {
    @Namespace var topID
    @Namespace var bottomID

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll to Bottom") {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }
                .id(topID)

                VStack(spacing: 0) {
                    ForEach(0..<50) { i in
                        Text("\(i)")
                    }
                }

                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(topID)
                    }
                }
                .id(bottomID)
            }
        }
    }

    func color(fraction: Double) -> Color {
        Color(red: fraction, green: 1 - fraction, blue: 0.5)
    }
}

struct Animation5_Previews: PreviewProvider {
    static var previews: some View {
        Animation5()
    }
}
