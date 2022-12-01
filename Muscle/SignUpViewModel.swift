//
//  SignUpViewModel.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/12/01.
//

import Foundation
import FirebaseAuth


class SignUpViewModel: ObservableObject {
    
    @Published var mail = ""
    @Published var password = ""
    @Published var subPassword = ""
    
    let mailText = "[^a-zA-Z0-9@.-_]"
    let passwordText = "[^a-zA-Z0-9]"
    
    // SignUpを行う
    func signUp(mail: String, password: String, subPassword: String) {
        
        
        
        if mail == "" { // メールが空白
            print("m空欄")
            return
        } else if password == "" { // パスワード空白
            print("p空欄")
            return
        } else if mail.count < 6 {
            print("6m")
        } else if password.count < 6 {
            print("6p")
        } else if mail.range(of: mailText, options: .regularExpression, range: nil, locale: nil) != nil {
            print("mだめ")
            return
        }  else if password.range(of: passwordText, options: .regularExpression, range: nil, locale: nil) != nil {
            print("pだめ")
            return
        } else {
            Auth.auth().createUser(withEmail: mail, password: password) { result , error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("-==---")
                    print(result)
                }
                
            }
        }
    }
}

extension String {
    func removingWhiteSpace() -> String {
            let whiteSpaces: CharacterSet = [" ", "　"]
            return self.trimmingCharacters(in: whiteSpaces)
        }
}
