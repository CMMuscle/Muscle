//
//  SignUpView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/28.
//

import SwiftUI
import Combine

struct SignUpView: View {
    let screen = UIScreen.main.bounds
    
    @StateObject var SignUpModel = SignUpViewModel()
    @State var showing: AlertItem?
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
                    
                    TextField("メールアドレス", text: $SignUpModel.mail)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                }
                
                Text("受信できるメールアドレスを使用してください")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    SecureField("パスワード", text: $SignUpModel.password)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                    
                }
                
                Text("英数字記号(. _ -)のみ使用可能")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    SecureField("パスワード（確認用）", text: $SignUpModel.subPassword)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                    
                }
                
                Button(action: {
                    SignUpModel.signUp()
                    SignUpModel.viewChange = true
                    DispatchQueue.main.asyncAfter ( deadline: DispatchTime.now() + 3.5) {
                        showing = SignUpModel.showingAlert
                        SignUpModel.viewChange = false
                    }
                    
                    
                }, label: {
                    Text("登録")
                        .foregroundColor(.white)
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .background(Color("purple"))
                        .cornerRadius(28)
                        .padding()
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                })
                .alert(item: $showing) { alert in
                    alert.alert
                }
                
                Spacer()
                
            }
            if SignUpModel.viewChange {
                ProgressView()
            } else {
                
            }
        }
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
