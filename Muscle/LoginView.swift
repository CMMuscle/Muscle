//
//  LoginView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/28.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    @State private var showing: AlertItem?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            // 背景色
            Color(red: 0.43, green: 0.43, blue: 0.43)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("<")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                    }
                    
                    Spacer()

                }

                
                
                // ロゴ
                ZStack {
                    Image("FormTrainer")
                        .resizable()
                        .frame(width: loginViewModel.screen.width * 0.84, height: loginViewModel.screen.height * 0.27)
                        .cornerRadius(49)
                }
                
                Spacer()
                
                // メールアドレス
                ZStack {
                    
                    // ブロック背景
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: loginViewModel.screen.width * 0.84, height: loginViewModel.screen.height * 0.05)
                    
                    TextField("メールアドレス", text: $loginViewModel.mail)
                        .padding(EdgeInsets(top: 0, leading: loginViewModel.screen.width * 0.11, bottom: 0, trailing: 0))
                }
                
                // パスワード
                ZStack {
                    
                    // ブロック背景
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: loginViewModel.screen.width * 0.84, height: loginViewModel.screen.height * 0.05)
                        .padding()
                    
                    SecureField("パスワード", text: $loginViewModel.password)
                        .padding(EdgeInsets(top: 0, leading: loginViewModel.screen.width * 0.11, bottom: 0, trailing: 0))
                }
                
                // ログイン
                Button(action: {
                    loginViewModel.login()
                    loginViewModel.viewChange = true
                    DispatchQueue.main.asyncAfter ( deadline: DispatchTime.now() + 3.5) {
                        if loginViewModel.sucess {
                            loginViewModel.showingAlert = AlertItem(alert: Alert(title: Text("ログインしました"), dismissButton: .default(Text("OK"),action: {
                                loginViewModel.menuModal = true
                            })))
                        }
                        showing = loginViewModel.showingAlert
                        loginViewModel.viewChange = false
                    }
                }, label: {
                    Text("ログイン")
                        .foregroundColor(.white)
                        .frame(width: loginViewModel.screen.width * 0.84, height: loginViewModel.screen.height * 0.05)
                        .background(Color("purple"))
                        .cornerRadius(28)
                })
                .fullScreenCover(isPresented: $loginViewModel.menuModal) {
                    MenuView()
                }
                
                // パスワード忘れ
                Button(action: {
                    loginViewModel.showingModal = true
                }, label: {
                    Text("パスワードを忘れた方はこちら")
                        .foregroundColor(Color(red: 0, green: 0.82, blue: 1))
                        .padding()
                        .underline()
                })
                .alert(item: $showing) { alert in
                    alert.alert
                }
                .sheet(isPresented: $loginViewModel.showingModal) {
                    ForgetView(showingModal: $loginViewModel.showingModal)
                }
                
                Spacer()
                
            }
            
            if loginViewModel.viewChange {
                ProgressView()
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
