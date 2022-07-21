//
//  TextField.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/26.
//

import SwiftUI

//알맞게 입력할 때 변하는 텍스트필드
struct TextFieldP: View {
    
    @State var text: String = ""
    @State var isTrue: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("닉네임")
            VStack(alignment: .trailing) {
                getcustomTextfield($text) { text in
                    isTrue = (text == "아령")
                }
                Text(isTrue ? "야호" : "사용하실 닉네임을 입력해라")
                    .customTextStyle(isTrue: isTrue)
            }
            
            
        }
        .padding()
    }
        
        private func getcustomTextfield(_ inputString: Binding<String>, _ checkHandler: ((String)->Void)? = nil) -> some
         View {
             TextField(text: inputString) {
                 Text("입력")
             }
             .textInputAutocapitalization(.never)
             .disableAutocorrection(true)
             .underlineTextField()
             .onSubmit {
                 checkHandler?(inputString.wrappedValue)
                 //optional이면 escaping 안해도된다.
             }
        }
}

struct TextFieldP_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldP()
    }
}
extension View {
    func underlineTextField() -> some View {
        self
            .overlay(Rectangle().frame(height: 2).foregroundColor(.gray.opacity(0.3)).padding(.top, 40).padding(.bottom, 20))
    }
    func customTextStyle(isTrue: Bool) -> some View {
        modifier(CustomTextModifier(isTrue: isTrue))
    }
}

struct CustomTextModifier: ViewModifier {
    var isTrue: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(isTrue ? .green : .black)
            .opacity(isTrue ? 1 : 0.3)
    }
}
