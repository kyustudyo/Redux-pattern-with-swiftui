//
//  SwiftUIView.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/23.
//

import SwiftUI

struct viewbuilder: View {
    var body: some View {
        logonStateButton("", label: "", message: "", isPresented: .constant(false)) {
            print("df")
        }
    }
//    @ViewBuilder//없어도된다
    func logonStateButton(_ title: String, label: String, message: String, isPresented: Binding<Bool>, action: @escaping () -> Void) -> some View {
        Button {
            print("f")
        } label: {
            Text("title")
        }
        .alert(label, isPresented: isPresented) {
            Button("취소", role: .cancel) {
                isPresented.wrappedValue.toggle()
            }
            Button("확인", role: .destructive, action: action)
        } message: {
            Text(message)
        }
    }
}

struct viewbuilder_Previews: PreviewProvider {
    static var previews: some View {
        viewbuilder()
    }
}
