//
//  MenuViewModel.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/09/26.
//

import SwiftUI
import UIKit

class MenuViewModel: ObservableObject {
    @Published var showingModal = false
    @Published var SettingModal = false
    let leftMenu = ["プランク","ブルガリアンスクワット","腹筋"]
    let rightMenu = ["バックプランク","スクワット","腕立て"]
    
    init() {
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color("purple"))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
}
