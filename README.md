# Problem with Button - withAnimation - onAppear  - 
## How do I stop and start a button animation from a modal view?


This is my code below again.

I tried everything I could think of. Well everything which is in my conprehension of how SwiftUI works!
At the beginning I used the onAppear modifier to start the animation but it would not stop even using conditionals inside it.

I want a button which animates when a variable is true and stops animating when the variable is false.
The variable value comes from a state outside the view. In this case it comes from the result of a modal view being presented by the button. I tried to use onAppear but when I come back from my modal view onAppear is not triggered again it seems...

So,  I would be grateful if someone had an idea . This is the code!

I use @AppStorage but I tried with @State and @Binding too.

```
struct ContentView: View {
	@State private var isAnimating: Bool = true
	@State var showModal: Bool = false
	@State private var animation = 0.0

	var body: some View {
		Button {
			print("Pressed")
			showModal = true
		} label : {
			Image(systemName: "paperplane")
		}
		.padding()
		.background(Color.red).opacity(isAnimating ? 1 : 0.5)
		.clipShape(Circle())
		.foregroundColor(.white)
		.padding(4)
		.overlay(
			Circle()
				.stroke(Color.red, lineWidth: 2)
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
```


How is this possible. Is this a bug? Cant find anything online. It seems to me that a state dependent animation should be easier to make than this. What I am missing?
🤯 
Thanks!
