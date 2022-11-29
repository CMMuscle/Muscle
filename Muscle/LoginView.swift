//
//  LoginView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/28.
//

import SwiftUI

struct LoginView: View {
    let screen = UIScreen.main.bounds
    @State var mail = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            
            // 背景色
            Color(red: 0.43, green: 0.43, blue: 0.43)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                // ロゴ
                ZStack {
                    Image("FormTrainer")
                        .resizable()
                        .frame(width: screen.width * 0.84, height: screen.height * 0.27)
                        .cornerRadius(49)
                }
                
                Spacer()
                
                // メールアドレス
                ZStack {
                    
                    // ブロック背景
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                    
                    TextField("メールアドレス", text: $mail)
                        .padding(EdgeInsets(top: 0, leading: screen.width * 0.11, bottom: 0, trailing: 0))
                }
                
                // パスワード
                ZStack {
                    
                    // ブロック背景
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .padding()
                    
                    TextField("パスワード", text: $password)
                        .padding(EdgeInsets(top: 0, leading: screen.width * 0.11, bottom: 0, trailing: 0))
                }
                
                // ログイン
                Button(action: {
                    
                }, label: {
                    Text("ログイン")
                        .foregroundColor(.white)
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .background(Color("purple"))
                        .cornerRadius(28)
                })
                
                // パスワード忘れ
                Button(action: {
                    
                }, label: {
                    Text("パスワードを忘れた方はこちら")
                        .foregroundColor(Color(red: 0, green: 0.82, blue: 1))
                        .padding()
                        .underline()
                })
                
                Spacer()
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
