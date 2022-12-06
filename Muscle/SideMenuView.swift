//
//  SideMenuView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/25.
//

import SwiftUI

struct SideMenuView: View {
    @StateObject var sideMenuViewModel = SideMenuViewModel()
    var body: some View {
        NavigationStack(path: $sideMenuViewModel.path) {
            ZStack {
                HStack {
                    VStack(spacing: 0) {
                        Group {
                            Rectangle()
                                .fill(Color(red: 0.31, green: 0.31, blue: 0.31))
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.32)
                            ZStack {
                                Rectangle()
                                    .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(.white),
                                        alignment: .bottom
                                    )
                                
                                Text("名前")
                                    .foregroundColor(.white)
                            }
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(.white),
                                        alignment: .bottom
                                    )
                                
                                Text("測定結果入力")
                                    .foregroundColor(.white)
                            }
                            Rectangle()
                                .fill(Color(red: 0.43, green: 0.43, blue: 0.43))
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.099)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(.white),
                                    alignment: .bottom
                                )
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(.white),
                                        alignment: .bottom
                                    )
                                
                                Text("ユーザー情報")
                                    .foregroundColor(.white)
                            }
                        }
                        NavigationLink(destination: MainDataView()) {
                            ZStack {
                                
                                Rectangle()
                                    .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(.white),
                                        alignment: .bottom
                                    )
                                
                                Text("統計")
                                    .foregroundColor(.white)
                            }
                        }
                        NavigationLink(destination: MissionView()) {
                            ZStack {
                                
                                Rectangle()
                                    .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(.white),
                                        alignment: .bottom
                                    )
                                Text("ミッション")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Rectangle()
                            .fill(Color(red: 0.43, green: 0.43, blue: 0.43))
                            .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.15)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(.white),
                                alignment: .bottom
                            )
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(.white),
                                    alignment: .bottom
                                )
                            
                            Text("設定")
                                .foregroundColor(.white)
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(.white),
                                    alignment: .bottom
                                )
                            
                            Text("ログアウト")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
