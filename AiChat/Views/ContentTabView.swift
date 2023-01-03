//
//  ContentTabView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/01.
//

import SwiftUI

struct ContentTabView: View {
    
    init() {
      // 文字色
      UITabBar.appearance().unselectedItemTintColor = .orange
      // 背景色
      UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        
        TabView {
            
            TalkView()
                .tabItem {
                    Image(systemName: "mic.circle.fill")
                    Text("Talk")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.circle.fill")
                    Text("Chat")
                }
        }
        // アイコン色
        .accentColor(.orange)
        
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}