//
//  scrollview.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/14.
//

import SwiftUI

struct scrollview: View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to #8") {
                    value.scrollTo(38, anchor: .bottom)
                }
                .padding()

                ForEach(0..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        .frame(height: 350)
    }
}
struct scrollview_Previews: PreviewProvider {
    static var previews: some View {
        scrollview()
    }
}


