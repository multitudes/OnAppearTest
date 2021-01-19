# OnAppearTest


This is my code below.
(And I have the code on GitHub in case someone wants to play with it)
https://github.com/multitudes/OnAppearTest

I tried everything I could think of. Well everything which is in my conprehension of how SwiftUI works! I am really intrigued to know why this is not working.  
At the beginning I used the onAppear modifier to start the animation but it would not stop even using conditionals inside it.

I want a button which animates when a variable is true and stops animating when the variable is false.
The variable value comes from a state outside the view. In this case it comes from the result of a modal view being presented by the button. I tried to use onAppear but when I come back from my modal view onAppear is not triggered again it seems...

So,  I would be grateful if someone had an idea . This is the code!

I use @AppStorage but I tried with @State and @Binding too.

```
import SwiftUI

struct ContentView: View {
	@AppStorage("isAnimating") var isAnimating: Bool = true
	@AppStorage("animation") var animation: Double = 0.0

	@State var showModal: Bool = false

	var body: some View {
		Button {
			print("Pressed")
			showModal = true
		} label : {
			Image(systemName: "star")
		}
		.padding()
		.background(Color.blue)
		.clipShape(Circle())
		.foregroundColor(.white)
		.padding(4)
		.overlay(
			Circle()
				.stroke(Color.blue, lineWidth: 2)
				.scaleEffect(CGFloat(1+animation))
				.opacity(1-animation)
		)
		.animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
		.sheet(isPresented: $showModal) {
			ModalView()
		}
	}
}

struct ModalView: View {
	@AppStorage("isAnimating") var isAnimating: Bool = true
	@AppStorage("animation") var animation: Double = 0.0

	@Environment(\.presentationMode) var presentation

	var body: some View {
		Text("Hello, World!").onTapGesture {
			isAnimating.toggle()
			if animation == 1.0 {
				animation = 0.0
			} else {
			animation = 1.0
			}
			

			presentation.wrappedValue.dismiss()
		}
    }

}

```

Also I tried to use this in ContentView() instead of the .animation modifier :
```
.onAppear {
			if isAnimating {  withAnimation(Animation.easeOut(duration: 1)
							.repeatForever(autoreverses: false)) {
								animation = 1
			}
			}
		}
```

How is this possible. Is this a bug? Cant find anything online. It seems to me that a state dependent animation should be easier to make than this. What I am missing?
🤯 
Thanks!
