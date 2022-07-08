//
//  Animation4.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/14.
//

import SwiftUI

struct Animation4: View {
    @State var showingSubview = false
    @State var isShowModal = false
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                Image(systemName: "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100, height: 100)
            }
            Button("Show Subview") {
                withAnimation(.easeInOut(duration: 2)) {
                    showingSubview.toggle()
                }
            }

            HStack{
                Text("dfdf")

                    .padding()
    //                .background(Color.green)
                    .padding(.top)
                    .frame(height: showingSubview ? nil : 0, alignment: .leading)
                    .background(.red)
                    .clipped()
            }
            
        }
        .padding()
        .background(Color.yellow)
        .offset(x: showingSubview ? 150 : 0, y: 0)
    }
}

struct Animation4_Previews: PreviewProvider {
    static var previews: some View {
        Animation4()
    }
}
