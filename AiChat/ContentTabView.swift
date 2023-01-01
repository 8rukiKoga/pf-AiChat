//
//  ContentTabView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/01.
//

import SwiftUI

struct ContentTabView: View {
    var body: some View {
        
        TabView {
            
            ChatView()
                .tabItem {
                    Image(systemName: "mic.fill")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                }
        }
        
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}
