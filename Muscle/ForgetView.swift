//
//  ForgetView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/29.
//

import SwiftUI

struct ForgetView: View {
    
    @StateObject var forgetViewModel = ForgetViewModel()
    @State private var showing: AlertItem?
    
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
                        .frame(width: forgetViewModel.screen.width * 0.84, height: forgetViewModel.screen.height * 0.27)
                        .cornerRadius(49)
                }
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: forgetViewModel.screen.width * 0.84, height: forgetViewModel.screen.height * 0.05)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    TextField("メールアドレス", text: $forgetViewModel.mail)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                }
                
                Text("登録されているメールアドレスに送信します")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                
                // ログイン
                Button(action: {
                    
                    // パスワードリセット
                    forgetViewModel.resetPassword()
                    forgetViewModel.viewChange = true
                    
                    // 処理の遅延を調節
                    DispatchQueue.main.asyncAfter ( deadline: DispatchTime.now() + 1.0) {
                        showing = forgetViewModel.showingAlert
                        forgetViewModel.viewChange = false
                    }
                    
                }, label: {
                    Text("送信")
                        .foregroundColor(.white)
                        .frame(width: forgetViewModel.screen.width * 0.84, height: forgetViewModel.screen.height * 0.05)
                        .background(Color("purple"))
                        .cornerRadius(28)
                })
                .alert(item: $showing) { alert in
                    alert.alert
                }
                
                Spacer()
                
            }
            if forgetViewModel.viewChange {
                ProgressView()
            } else {
                
            }
        }
    }
}

struct ForgetView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetView()
    }
}
