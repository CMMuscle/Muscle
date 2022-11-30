//
//  MenuViewModel.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/09/26.
//

import SwiftUI
import Combine
import UIKit

class MenuViewModel: ObservableObject {
    @Published var showingModal = false
    let menu = ["プランク","ブルガリアンスクワット","腹筋","バックプランク","スクワット","腕立て"]
    
    // 各itemの幅
    private let ITEM_PADDING: CGFloat = 20
    
    // offset移動アニメーション時間
    private let OFFSET_X_ANIMATION_TIME: Double = 0.2
    private var cancellableSet: Set<AnyCancellable> = []
    
    
    // 無限カルーセル用に加工した配列
    @Published var infinityArray: [String] = []
    // 初期位置は2に設定する
    @Published var currentIndex = 2
    // アニメーションの有無を操作
    @Published private var isOffsetAnimation: Bool = false
    // アニメーション
    @Published var dragAnimation: Animation? = nil
    
    
    init() {
        
        // Navigationbarの色変更
        setupNavigationBar()
        
        // カールセルの個数分の配列を入れる
        self.infinityArray = createInfinityArray(menu)
        
        $currentIndex
            .receive(on: RunLoop.main)
            .sink { index in
                
                // 2要素未満の場合は、無限スクロールにしないため処理は必要なし
                if self.menu.count < 2 {
                    return
                }
                
                // 無限スクロールを実現させるため、オフセット移動アニメーション後（0.2s後）にcurrentIndexをリセットする
                DispatchQueue.main.asyncAfter(deadline: .now() + self.OFFSET_X_ANIMATION_TIME) {
                    if index <= 1 {
                        self.isOffsetAnimation = false
                        self.currentIndex = 1 + self.menu.count
                    } else if index >= 2 + self.menu.count {
                        self.isOffsetAnimation = false
                        self.currentIndex = 2
                    }
                }
            }
            .store(in: &cancellableSet)
        
        $isOffsetAnimation
            .receive(on: RunLoop.main)
            .map { isAnimation in
                return isAnimation ? .linear(duration: self.OFFSET_X_ANIMATION_TIME) : .none
            }
            .assign(to: \.dragAnimation, on: self)
            .store(in: &cancellableSet)
    }
    
    // navigationbarの色変更
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color("purple"))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    // 擬似無限スクロール用の配列を生成
    private func createInfinityArray(_ targetArray: [String]) -> [String] {
        if targetArray.count > 1 {
            var result: [String] = []
            
            // 最後の2要素
            result += targetArray.suffix(2)
            
            // 本来の配列
            result += targetArray
            
            // 最初の2要素
            result += targetArray.prefix(2).map { $0 }
            
            return result
        } else {
            return targetArray
        }
    }
}

// 各種メソッド
extension MenuViewModel{
    
    // itemPadding
    func carouselItemPadding() -> CGFloat {
        return ITEM_PADDING
    }
    
    // カルーセル各要素のWidth
    func carouselItemWidth() -> CGFloat {
        return UIScreen.main.bounds.width * 0.84
    }
    
    func carouselItemHeight() -> CGFloat {
        return UIScreen.main.bounds.height * 0.39
    }
    
    // itemを中央に配置するためにカルーセルのleading paddingを返す
    func carouselLeadingPadding(index: Int, bodyView: GeometryProxy) -> CGFloat {
        return index == 0 ? bodyView.size.width * 0.081 : 0
    }
    
    // カルーセルのOffsetのX値を返す
    func carouselOffsetX(bodyView: GeometryProxy) -> CGFloat {
        return -CGFloat(self.currentIndex) * (UIScreen.main.bounds.width * 0.84 + self.ITEM_PADDING)
    }
    
    // ドラッグ操作
    func onChangedDragGesture() {
        // ドラッグ時にはアニメーション有効
        if self.isOffsetAnimation == false {
            self.isOffsetAnimation = true
        }
    }
    
    // ドラッグ操作によるcurrentIndexの操作
    func updateCurrentIndex(dragGestureValue: _ChangedGesture<GestureStateGesture<DragGesture, CGFloat>>.Value, bodyView: GeometryProxy) {
        var newIndex = currentIndex
        
        // ドラッグ幅からページングを判定
        if abs(dragGestureValue.translation.width) > bodyView.size.width * 0.3 {
            newIndex = dragGestureValue.translation.width > 0 ? self.currentIndex - 1 : self.currentIndex + 1
        }
        
        // 最小ページ、最大ページを超えないようチェック
        if newIndex < 0 {
            newIndex = 0
        } else if newIndex > (self.infinityArray.count - 1) {
            newIndex = self.infinityArray.count - 1
        }
        
        self.isOffsetAnimation = true
        self.currentIndex = newIndex
    }
}
