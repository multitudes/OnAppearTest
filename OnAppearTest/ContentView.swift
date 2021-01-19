//
//  ContentView.swift
//  OnAppearTest
//
//  Created by Laurent B on 19/01/2021.
//

import SwiftUI

struct ContentView: View {
	@State private var isAnimating: Bool = true
	@State var showModal: Bool = false
	@State private var animation = 0.0
	
	var body: some View {
		Button {
			print("Pressed")
			showModal = true
		} label : {
			Image(systemName: "star")
		}
		.padding()
		.background(Color.blue).opacity(isAnimating ? 1 : 0.5)
		.clipShape(Circle())
		.foregroundColor(.white)
		.padding(4)
		.overlay(
			Circle()
				.stroke(Color.blue, lineWidth: 2)
				.scaleEffect(CGFloat(1+animation))
				.opacity(1-animation)
		)
		.onAppear {
			if isAnimating {  withAnimation(Animation.easeOut(duration: 1)
												.repeatForever(autoreverses: false)) {
				animation = 1
			}
			}
		}
		.sheet(isPresented: $showModal) {
			ModalView(isAnimating: $isAnimating)
		}
		
		
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
