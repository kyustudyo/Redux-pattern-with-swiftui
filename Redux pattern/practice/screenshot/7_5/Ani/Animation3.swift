//
//  Animation3.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/14.
//

import SwiftUI

struct Animation3: View {
    @State var showingSubview = false

    var body: some View {
        VStack(spacing: 0) {
            Button("Show Subview") {
                withAnimation(.easeInOut(duration: 2)) {
                    showingSubview.toggle()
                }
            }

            Text("Subview")
                .padding()
                .background(Color.green)
                .padding(.top)
                .frame(height: showingSubview ? nil : 0, alignment: .top)
                .padding(.bottom)
                .background(Color.yellow)
                .clipped()
                .opacity(showingSubview ? 1 : 0)
        }
        .padding([.horizontal, .top])
        .background(Color.yellow)
        .padding(.bottom)
        .offset(x: showingSubview ? 50 : 0, y: 0)
    }
}
struct Animation3_Previews: PreviewProvider {
    static var previews: some View {
        Animation3()
    }
}
