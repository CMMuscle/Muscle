//
//  SignUpView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/28.
//

import SwiftUI

struct SignUpView: View {
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
                
                ZStack {
                    Image("FormTrainer")
                        .resizable()
                        .frame(width: screen.width * 0.84, height: screen.height * 0.27)
                        .cornerRadius(49)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                }
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    TextField("メールアドレス", text: $mail)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                }
                
                Text("英数字大文字小文字含めた8文字〜16文字")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                    
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    TextField("パスワード", text: $password)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                }
                
                Text("英数字大文字小文字含めた8文字〜16文字")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    TextField("パスワード（確認用）", text: $password)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                }
                
                Button(action: {
                    
                }, label: {
                    Text("ログイン")
                        .foregroundColor(.white)
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .background(Color("purple"))
                        .cornerRadius(28)
                        .padding()
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                })
                
                Spacer()
                
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
