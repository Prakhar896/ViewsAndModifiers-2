//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Prakhar Trivedi on 25/2/23.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueTitle() -> some View {
        modifier(LargeBlueTitle())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World!")
//                .modifier(Title()) // Use the .modifier modifier to apply our custom Title view modifier
                .titleStyle() // simpler version by extending the View protocol
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Prakhar Trivedi Studios")
            Text("My Big Blue Title")
                .largeBlueTitle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
