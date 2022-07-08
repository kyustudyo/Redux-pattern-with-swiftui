//
//  Images.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/16.
//

import SwiftUI

struct Images: View {
    @State var isImageClicked: Bool = false
    var body: some View {
        VStack {
            Button {
                isImageClicked.toggle()
            } label: {
                Text("image click")
                    .foregroundColor(.blue)
            }

//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 50, height: 50)
//                Image("1")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: isImageClicked ? 500 : 10)//아래 프레임보다는 안커진다.
//            }
            RoundedRectangle(cornerRadius: 10)
                .aspectRatio(contentMode: .fit)
                .frame(width: isImageClicked ? 500 : 100)
                .overlay(
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isImageClicked ? 500 : 10)//아래 프레임보다는 안커진다.
                )
                .frame(width:300, height: 300)
            
        }
        .fullScreenCover(isPresented: $isImageClicked) {
            Image(systemName: "circle")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
        }
        
        
            
    }
}

struct Images_Previews: PreviewProvider {
    static var previews: some View {
        Images()
    }
}
