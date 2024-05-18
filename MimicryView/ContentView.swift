//
//  ContentView.swift
//  MimicryView
//
//  Created by admin on 18.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isExtended: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if !isExtended {
                    Spacer()
                }
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: isExtended ? .infinity : 150, height: isExtended ? 400 : 75)
                        .cornerRadius(25)
                    VStack {
                        HStack {
                            ButtonView(isExtended: $isExtended)
                            if isExtended {
                                Spacer()
                            }
                        }
                        if isExtended {
                            Spacer()
                        }
                    }
                }
                .frame(width: isExtended ? .infinity : 150, height: isExtended ? 400 : 75)
                .padding(.leading, isExtended ? 30 : 0)
            }
            .padding(.trailing, 30)
            .padding(.bottom, 30)
            if isExtended {
                Spacer()
            }
        }
        .animation(.easeOut, value: isExtended)
    }
}

struct ButtonView: View {
    @Binding var isExtended: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring) {
                isExtended.toggle()
            }
            print("Right upper corner pressed")
        }) {
            HStack {
                if isExtended {
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundColor(.white)
                }
                Text(isExtended ? "Back" : "Open")
                    .foregroundColor(.white)
                    .padding(.horizontal)
//                    .animation(nil, value: isExtended)
            }
        }
        .frame(width: 125, height: 75)
    }
}

#Preview {
    ContentView()
}

