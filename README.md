# Introduction to SwiftUI

This is a project of the App from  `Introduction to SwiftUI` talk from the WWDC20 with most of the steps to recreate it.

- [x] New Project, Multiplatform, Sandwiches
- [x] We have Group for iOS and MacOS
- [x] Go to ContentView
- [x] We have the preview
- [x] Selection is shown in the canvas and also changes
- [x] Create the Cell for the sandwiches
- [x] Add piece of text from the library and show what happen in different locations
- [x] They were embeded in a VStack
- [x] First Text = My Sandwich
- [x] Second Text = 3 Ingredients
- [x] CMD + Click on Stack and select embed on HStack to add an image
- [x] add an Image(systemName: "photo") on top of the Stack
- [x] CMD + Click on the VStack to change the properties with the SwiftUI Inspector, align left and see the code added
- [x] Inspect the ingredients now using the canvas (Control+Option+Click) and change the font to Subheadline and see the code. These are modifiers
- [x] Now in code set the foreground color to a .secondary color.
- [x] Now put the cel into a list. CMD + Click the HStack and "embed in List". No delegates or data sources.
- [x] Let's hook it up to some data. Drag the Model assets to the project.
- [x] The model have a few fields. I just need to make the type identifiable to use it in SwiftUI. You should have a property called id, and some test Data if you want.
- [x] Go back to the view and add a property called var sandwiches: [Sandwich] = []
- [x] Pass the test data to the ContentView in the PREVIEW and also to the Code in line 9 like: List(sandwiches) { sandwich in } and make the text show `sandwich.name` and next text show `sandwich.ingredientCount` like `Text("\(sandwich.ingredientCount) ingredients")` 
- [x] Also change the Image to be `Image(sandwich.thumbnailName)` and see how the size changes
- [x] Bring a corner radius modifier from the Library and apply it to the images with a value of 8
- [x] May also need to add `.resizable()` ` .aspectRatio(contentMode: .fit)` and `.frame(width: 50, height: 50)` if the Images have different sizes.

### Show the Detail

- [x] Wrap the List in a `NavigationView` and add the `.navigationTitle("Sandwiches")` at the Bottom of the List. The NavigationView allow us to move/push another view
- [x] To push another View when the cell is pressed we have to add a `NavigationLink(destination: Text(sandwich.name)` wraping the image and the VStack. This will update the UI automatically and you will see the detail indicators
- [x] Hit play in the preview and verify the cell behaves correctly. Check that the cell unhighlights automatically when we swipe from detail back to the list
- [x] Let's refactor the cell out to have separation of concerns. CMD + Click the NavigationLink and choose extract subview and call it SandwichCell
- [x] Add a property for the sandwich in the new SandwichCell and pass the sandwich as a parameter
- [x] Now let's add the row with the number of Sandwiches. SwiftUI let me combine data driven list with dynamic and static content. So let's  remove the `sandwiches`  parameter when creating the List and instead add a ForEach sandwiches inside the List like `ForEach(sandwiches) { sandwich in }` and inside put the SandwichCell init
- [x] Below the ForEach let's add a Text() with the Sandwiches count, a foregroundColor(.secondary) and alignment center by embeding it on a HStack and adding spacers

### Detail View

- [x] Create a new SwiftUI View Called SandwichDetail. Xcode automatically create the View Struct and the preview
- [x] Create the sandwich as an input. So a property should be added
- [x] make the preview use the testData with the Sandwich at position 0
- [x] Now to build the view, let's add an Image with the sandwich's image name: `Image(sandwich.name)`
- [x] Look in the library for a Image Rezible modifier and apply it to the image
- [x] Set the aspect ratio with another modifier, with `.fit` content mode
- [x] Now let's go back to the list to push the new DetailView. So in the NavigationLink, let's pass the SandwichDetail view with the current sandwich instead of the previews text we had and click play in the preview to test it works
- [x] I forgot to set the title in the detail. So add it next to the aspectRatio modifier like `.navigationTitle(sandwich.name)`
- [x] Make the SandwichDetail in the preview be inside a NavigationView so we can see the title

### Zoom in and out the Image

State variables and Model constitude the source of Truth

We can clasify each property as state variable or derived value. Zoom State value is a source of truth, the contentMode property of the AspectRatio view is derived from it. When a State value changes, SwiftUI knows which renderings to refresh by asking for a new body, making a new AspectRation from scratch, overriding the contentMode and any other stored properties. This is how all derivedValues are kept up-to-date in SwiftUI



|                |     Source of Truth      | Derived Value |
| -------------- | :----------------------: | :-----------: |
| **Read-only**  | Constant (Like TestData) |   Property    |
| **Read-Write** | @State/ObservableObject  |   @Binding    |

*Data Essentials in SwiftUI

SwiftUI manage the dependency that a View have to it's Data and how to keep it in sync. Many bugs are solved by collecting all the view updates into a single method. That is define a source of truth. SwiftUI was done taking into account this best practice, by making "body" the only entry point thats ever called.

- [x] create a `@State ` variable called `zoomed` and set it to false by default. States should only be accessible inside the View's implementation, so should be **private** 
- [x] Use `zoomed` in the `.aspectRatio(contentMode: zoomed ? .fill : .fit)` 
- [x] Then add a `onTapGesture` that toggle zoomed state like `zoomed.toggle()` 
- [x] Fix the bottom white space of the safe area by adding at the end of the image a modifier from the library called `Edges Ignoring Safe Area` for the `.bottom` edge.
- [x] Add an animationg to the zoom of the image by wraping the `zoomed.toggle()` inside a `withAnimation` block

### Spicy Sandwiches

- [x] Wrap the Image in a VStack, and let the more general modifiers apply to the VStack, like `.navigationTitle` and `edgesIgnoringSafeArea` 
- [x] Then add a `Label` under the image but inside the VStack, with Title = "Spicy" and systemImage: "flame.fill" 
- [x] To move the Spacy label to the bottom, add a spacer between the Image and the Label
- [x] and to center the image again, add a spacer above the Image with `minLenght: 0`  for both spacers.
- [x] Add padding to the Label by opening it's inspector and setting the padding `all` around and turn up the font size by adding the `Font` modifier and setting it to `.headline`.
- [x] Then add a background mofier to the Label of red color like `.background(Color.red)` 
- [x] To expand the label edge to edge, add an HStack and Spacers, with all other modifiers applying to the HStack an not the Label
- [x] Change the `foregroundColor(.yellow)` for the Label HStack
- [x] and modify font to use smallCaps like `font(Font.headline.smallCaps())`
- [x] Now make it appear only if the Sandwich is Spicy by adding an `if sandwich.isSpicy` statement before the Label HStack
- [x] Click the + Button in the preview to add another preview and compare between a Spicy and not spicy sandwich
- [x] Remove the Spicy banner when image is zoomed by adding the `!zoomed` condition to the `if` statement
- [x] add a transition to the end of the HStack modifiers like `.transition(.move(edge: .bottom))` to animate the Spicy banner going away

### Multiplatform Tweaks

- [ ] For iPad I have a splitView with a blank area when no Sandwich is selected. Let's add a view to the NavigationView of the ContentView file. Like `Text("Select a sandwich").font(.largeTitle)` 
- [ ] For MacOS we see the same behaviour

### Add a Store

- [ ] Let's modify the model so the sandwiches can change over time. Drag the prebuild SandwichStore
- [ ] the SandwichStore is a mutable object that contains the sandwiches and a singleton instance for testing
- [ ] Let's make this class conforms to the `ObservableObject` protocol
- [ ] Mark the properties that you want to observe with `@Published` like `@Published var sandwiches: [Sandwich]`
- [ ] In ContentView add the `@StateObject private var store = SandwichStore()` to use the new model. It will obeserve the object to update the view when it changes.
- [ ] Lets move that to the App code in SandwichesApp.swift before the body and pass it to the view code when the ContentView is created like: `ContentView(store: store)` 
- [ ] And back in the ContentView code, replace the `var sandwiches` with `var store: SandwichStore` and prepend  `@ObservedObject` 
- [ ] Update the code to take the sandwiches from the Text("\\(store.sandwiches.count) Sandwiches")
- [ ] Also update the preview to use the Store like `ContentView(store: testStore)`

### Add the Edit list feature

- [ ] Create the funds `makeSandwich()`, `moveSandwiches(from: IndexSet, to: Int)`, `deleteSandwiches(offsets: IndexSet)` 

  - [ ] `func makeSandwich() { withAnimation { store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3)) } }`
  - [ ] `func moveSandwiches(from: IndexSet, to: Int) { withAnimation { store.sandwiches.move(fromOffsets: from, toOffset: to) } }`
  - [ ] `func deleteSandwiches(offsets: IndexSet) { withAnimation { store.sandwiches.remove(atOffsets: from) } }`

- [ ] After the ForEach in line 11, add at the end (line 14 aprox) a `.onMove(perform: moveSandwiches)`

- [ ] and also `.onDelete(perform: deleteSandwiches)`

- [ ] Now we can swap to delete. This works on MacOS. Let's make it work better to iOS

- [ ] Let's add a edit button as a toolbar item in line 25 aprox after the `navigationTitle` like `.toolbar { EditButton() }` 

- [ ] Wrap it arround #if os(iOS) #endif

- [ ] Now lets add the Add button under the #endif clause like `Button("Add", action: makeSandwich)` 

- [ ] the `makeSandwich()` func should be `withAnimation { store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3)) }`

  

  ### Changing previews  Dynamic Type and Color Scheme to Dark mode

- [ ] Create a new preview and set it to be in dark mode
- [ ] Click inspect to configure the new preview, change the Dynamic Type size to be ExtraExtra and look at the code that was added to generate the preview. It sets the environment of the previews. A way you can set contextual info about your views that flows down the view hierarchy and changes aspects of any contained views at once. Great for making cascading changes to a view and its children.
- [ ] Add another preview with Dark mode for the color scheme
- [ ] set the `.environment(\.layoutDirection, .rightToLeft)` 
- [ ] set the locale `.environment(\.locale, .Locale(identifier: "ar"))`. It automatically, localize Strings and also string interpolations