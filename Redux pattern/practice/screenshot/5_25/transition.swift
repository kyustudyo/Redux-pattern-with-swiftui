////
////  transition.swift
////  Redux pattern
////
////  Created by Hankyu Lee on 2022/05/25.
////
//
//import SwiftUI
//
//struct transition: View {
//    @State private var show = false
//    var body: some View {
//        VStack{
//            Spacer()
//            if show {
//                RoundedRectangle(cornerRadius: 24)
//                    .frame(height:100)
//                    .padding()
//                    .frame(maxWidth:.infinity)
//                    .transition(.move(edge: .leading))
//                    
//                    
//            }
//            Spacer()
//            VStack {
//                Text("werqw")
//            }
//            Text("re")
//                .onTapGesture {
//                    withAnimation(.easeInOut) {
//                        show.toggle()
//                    }
//                }
//            
//        }
//    }
//}
//
//struct transition_Previews: PreviewProvider {
//    static var previews: some View {
//        transition()
//    }
//}
