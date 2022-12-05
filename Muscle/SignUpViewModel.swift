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
    func signUp(mail: String, password: String, subPassword: String) {
        
        
        
        if mail == "" { // メールが空白
            print("m空欄")
            return notAuth  = "mailBlank"
        } else if password == "" { // パスワード空白
            print("p空欄")
            return notAuth  = "passBlank"
        } else if mail.range(of: mailText, options: .regularExpression, range: nil, locale: nil) != nil {
            print("mだめ")
            return notAuth = "mailFail"
        }  else if password.range(of: passwordText, options: .regularExpression, range: nil, locale: nil) != nil {
            print("pだめ")
            return notAuth = "passFail"
        } else if mail.count < 6 {
            print("6m")
            return notAuth = "mailCount"
        } else if password.count < 6 {
            print("6p")
            return notAuth = "passCount"
        } else if password != subPassword {
            print("notp")
            return notAuth = "passMatch"
        }else {
            Auth.auth().createUser(withEmail: mail, password: password) { result , error in
                if error != nil {
                    print(error!.localizedDescription)
                    if error!.localizedDescription == "The email address is badly formatted." {
                        print("damepppp")
                        return self.notAuth = "mailFormat"
                    }
                        
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
