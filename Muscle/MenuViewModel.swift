//
//  MenuViewModel.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/09/26.
//

import Foundation

class MenuViewModel: ObservableObject {
    @Published var showingModal = false
    @Published var SettingModal = false
    let leftMenu = ["プランク","ブルガリアンスクワット","腹筋"]
    let rightMenu = ["バックプランク","スクワット","腕立て"]
}