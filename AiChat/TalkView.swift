//
//  TalkView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/01.
//

import SwiftUI

struct TalkView: View {
    
    @State private var isTalking: Bool = false
    @State private var inputText: String = ""
    
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
            
            VStack {
                Spacer()
                
                if isTalking {
                    Text("入力テキスト")
                        .padding()
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .foregroundColor(Color(.systemGray5))
                                .frame(minWidth: 250)
                        )
                        .padding(.bottom)
                }
                
                Button {
                    isTalking.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(isTalking ? Color(.systemBrown) : Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(.systemBrown), lineWidth: 7)
                            )
                        
                        Image(systemName: isTalking ? "mic.fill" : "mic")
                            .font(.title3.bold())
                            .foregroundColor(isTalking ? Color(.label) : Color(.systemGray))
                    }
                    .frame(width: 80, height: 80)
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
