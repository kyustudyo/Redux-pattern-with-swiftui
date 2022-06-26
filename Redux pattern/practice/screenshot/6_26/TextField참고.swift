//출처 MC2 싹쓰리 팀
//  SignUpView.swift
//  Taxi
//
//  Created by sanghyo on 2022/06/08.
//
//focus state를 반영하여 텍스트 필드에 순차적으로 넘어갈 수 있도록 구현
//코드의 값이 맞는 경우 다음 필드로 넘어가고 코드는 더이상의 수정이 불가능하도록, 값이 틀린경우 해당 필드에 머무르도록 구현
//onAppear에 시간차를 주지 않으면 자동으로 커서가 focusing 하지 못하는 이슈 발생

import SwiftUI

struct SignUpView: View {
    enum Field: Hashable {
        case code, nickname
    }
    @State private var signUpCode: String = ""
    @State private var nickName: String = ""
    @State private var codeIsCorrect: Bool?
    @FocusState private var focusField: Field?
    private let developerCode: String = "레몬"

    var body: some View {
        VStack(alignment: .leading) {
            Text("가입 코드").fontWeight(.bold).opacity(0.3)
            underlinedTextField($signUpCode)
                .focused($focusField, equals: .code)
                .disabled(codeIsCorrect == true)
            Text(codeFieldMessage(codeIsCorrect))
                .font(.caption)
                .foregroundColor(codeFieldMessageColor(codeIsCorrect))
                .frame(maxWidth: .infinity, alignment: .trailing)
            Text("닉네임").fontWeight(.bold).opacity(0.3)
            underlinedTextField($nickName)
                .focused($focusField, equals: .nickname)
            Group {
                Text("* 사용하실 닉네임을 입력해주세요")
                Text("(아카데미 내의 닉네임을 권장드립니다)")
            }.font(.caption).opacity(0.3).frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()
            Button {
                UserDefaults.standard.set(true, forKey: "isLogin")
            } label: {
                Text("버튼")
                    .frame(maxWidth: .infinity)
            }
            .disabled(!(codeIsCorrect == true) || nickName.isEmpty)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                focusField = .code
            }
        }
        .onSubmit {
            switch focusField {
            case .code:
                codeIsCorrect = (signUpCode == developerCode)
                guard codeIsCorrect == true else {
                    focusField = .code
                    return
                }
                focusField = .nickname
            case .nickname:
                focusField = nil
            default:
                break
            }
        }
        .padding()
    }

    private func underlinedTextField( _ inputString: Binding<String>) -> some View {
        TextField("", text: inputString)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .underlineTextField()
    }

    private func codeFieldMessage( _ isCorrect: Bool?) -> String {
        guard let isCorrect = isCorrect else { return "* 최초 인증 및 가입에 활용됩니다" }
        if isCorrect {
            return "✅ 인증 완료되었습니다"
        } else {
            return "올바른 코드를 입력해주세요"
        }
    }

    private func codeFieldMessageColor( _ isCorrect: Bool?) -> Color {
        guard let isCorrect = isCorrect else { return Color.black.opacity(0.3) }
        if isCorrect {
            return Color.green
        } else {
            return Color.red
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

