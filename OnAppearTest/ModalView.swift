//
//  ModalView.swift
//  OnAppearTest
//
//  Created by Laurent B on 19/01/2021.
//

import SwiftUI

struct ModalView: View {
	@Binding var isAnimating: Bool
	@Environment(\.presentationMode) var presentation

	var body: some View {
		Text("Hello, World!").onTapGesture {
			isAnimating.toggle()
			presentation.wrappedValue.dismiss()
		}
	}
}

struct ModalView_Previews: PreviewProvider {
	static var previews: some View {
		ModalView(isAnimating: .constant(true))
	}
}
