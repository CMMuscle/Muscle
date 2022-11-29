//
//  SideMenuView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/25.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        ZStack {
            Color(red: 0.43, green: 0.43, blue: 0.43)
                .ignoresSafeArea()
            HStack {
                VStack(spacing: 0) {
                    Group {
                        
                        
                        Rectangle()
                            .fill(Color(red: 0.31, green: 0.31, blue: 0.31))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.32)
                        
                        Rectangle()
                            .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(.white),
                                alignment: .bottom
                            )
                        Rectangle()
                            .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(.white),
                                alignment: .bottom
                            )
                        Rectangle()
                            .fill(Color(red: 0.43, green: 0.43, blue: 0.43))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.099)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(.white),
                                alignment: .bottom
                            )
                        Rectangle()
                            .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(.white),
                                alignment: .bottom
                            )
                    }
                    Rectangle()
                        .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.white),
                            alignment: .bottom
                        )
                    Rectangle()
                        .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.white),
                            alignment: .bottom
                        )
                    Rectangle()
                        .fill(Color(red: 0.43, green: 0.43, blue: 0.43))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.white),
                            alignment: .bottom
                        )
                    Rectangle()
                        .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.white),
                            alignment: .bottom
                        )
                    Rectangle()
                        .fill(Color(red: 0.43, green: 0.35, blue: 0.66))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.white),
                            alignment: .bottom
                        )
                    
                }
                Spacer()
            }
            
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
