//
//  SignUpViewModel.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/12/01.
//

import FirebaseAuth
import SwiftUI


struct AlertItem: Identifiable {
    var id = UUID()
    var alert: Alert
}

class SignUpViewModel: ObservableObject {
    
    @Published var mail = ""
    @Published var password = ""
    @Published var subPassword = ""
    
    @Published var showingAlert = AlertItem(alert: Alert(title: Text("アラート１")))
    
    @Published var notAuth = ""
    
    
    let mailText = "[^a-zA-Z0-9@.-_]"
    let passwordText = "[^a-zA-Z0-9]"
    
    // SignUpを行う
    func signUp(mail: String, password: String, subPassword: String) -> AlertItem {

        if mail == "" { // メールが空白
            print("m空欄")
            return AlertItem(alert: Alert(title: Text("メールアドレスが空欄です")))
        } else if password == "" { // パスワード空白
            print("p空欄")
            return AlertItem(alert: Alert(title: Text("パスワードが空欄です")))
        } else if mail.range(of: mailText, options: .regularExpression, range: nil, locale: nil) != nil {
            print("mだめ")
            return AlertItem(alert: Alert(title: Text("メールアドレスが不適切です")))
        }  else if password.range(of: passwordText, options: .regularExpression, range: nil, locale: nil) != nil {
            print("pだめ")
            return AlertItem(alert: Alert(title: Text("パスワードが不適切です")))
        } else if password.count < 8 {
            print("8p")
            return AlertItem(alert: Alert(title: Text("パスワードは最小8文字からです")))
        } else if password != subPassword {
            print("notp")
            return AlertItem(alert: Alert(title: Text("パスワードが一致しません")))
        }else {
            Auth.auth().createUser(withEmail: mail, password: password) { result , error in
                if error != nil {
                    print(error!.localizedDescription)
//                    if error!.localizedDescription == "The email address is badly formatted." {
//                        print("damepppp")
//                        return self.showingAlert = AlertItem(alert: Alert(title: Text("メールアドレスが不適切です")))
//                    }
                } else {
                    print("-==---")
                    print(result)
                    
                }
            }
            return AlertItem(alert: Alert(title: Text("登録できました")))            
        }
    }
}

extension String {
    func removingWhiteSpace() -> String {
        let whiteSpaces: CharacterSet = [" ", "　"]
        return self.trimmingCharacters(in: whiteSpaces)
    }
}
