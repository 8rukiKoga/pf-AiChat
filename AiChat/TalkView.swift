//
//  TalkView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/01.
//

import SwiftUI

struct TalkView: View {
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            // チャット部分
            ScrollView {
                VStack {
                    HStack {
                        VStack {
                            Text("こんにちは")
                        }
                        .padding()
                        .background(RoundedCorners(color: Color(.systemGray5), tl: 26, tr: 26, bl: 2, br: 26))
                        Spacer()
                    }
                    
                    HStack {
                        VStack {
                            Text("あなたの名前はなんですか？")
                        }
                        .padding()
                        .background(RoundedCorners(color: Color(.systemGray5), tl: 26, tr: 26, bl: 2, br: 26))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        VStack {
                            Text("ハルキです。")
                        }
                        .padding()
                        .background(RoundedCorners(color: Color(.systemBrown), tl: 26, tr: 26, bl: 26, br: 2))
                    }
                }
                
            }
            .padding()
        }
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView()
    }
}
