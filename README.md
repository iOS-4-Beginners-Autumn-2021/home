# iOS 4 Beginners Autumn 2021

---

#### Assignments Results

Assignment results are available [_here_](https://docs.google.com/spreadsheets/d/1xI5ByRpoH4Nt5FwSOMYzMXxO8Lf5NLSZGver6llZlfU/edit?usp=sharing).

Find your data row by hashing your github username using **sha256**. Use an online [tool](http://www.sha1-online.com), or run this bash command:

```sh
printf "<github-username>" | openssl sha256
```

---

## Classes

### Class 1: Hello Swift

We were talking about the basics of Swift programming language:

- Variables and **constants** (`var` and `let` keywords)
- `String`
- `Array` and `Dictionary` data types (value types)
- Optionals (`Int?`, `String?`, `if let ...` syntax, and so on)
- Control Flow (`if`, `for` and `while` loops, `switch` statement (💪))
- Functions – defining a function with parameters in Swift (`func` keyword), return value type, calling functions, etc.
- Classes – defining a basic class, defining methods, class properties, initializers. We've also discussed inheritance in Swift, overriding methods and initializers.
- Enums!
- Structs
- Value Types vs Reference Types

To learn more, go through the [Swift](./Class1) playground.

### Class 2: SwiftUI 101

We were talking about the basics of SwiftUI:

- SwiftUI is a declarative UI framework
- `View` defines a piece of UI
- All views are build with defined in SwiftUI views (building blocks 🧱)
- `Text` & `Image` - main views for displaying content
- You can apply multiple `ViewModifiers` to View. Order of modifiers has great meaning ⚠️
- `VStack`, `HStack` and `ZStack` are basic containers to arrange multiple views
- ControlFlow - You can use `ForEach`, `if...else` and `switch` in View body
- ScrollView 📜
- GeometryReader it's one of the most powerful views in SwiftUI - use it wisely 🧙‍♂️
- Views should be simple and readable

To learn more, go through the [example project](./Class2).

### Class 3: SwiftUI 102

We talked about data flow in SwiftUI:

- Data access as a Dependency
- Data should have one source of truth
- `@State` is source of truth
- Views are a function of state
- `@Binding` to write and read without ownership
- `@ObservedObject` or `@StateObject` for reference types
- `@EnvironmentObject` to read model from view hierarchy 
- `@Environment` to read values like disabled state or locale

To learn more, go through the [example project](./Class3).

### Class 4: Intermediate Swift & MVVM

We talked about advanced topics in Swift and MVVM architecture:

- 2 types of memory management - *Stack* and *Heap*
- ARC tells when memory can be free
- *Stack* is for value types
- *Heap* is for reference type
- Reference types can cause memory leaks
- Use `weak` or `unowned` reference to avoid the leak
- It is good to use some architecture for example MVVM
- Model - defines a business logic
- View - renders UI
- ViewModel - translates user actions to business actions and prepares data for the view
- The dependency should look like this: `View` ⬅️ `ViewModel` ⬅️ `Model`

To learn more, go through the [example MVVM project](./Class4).
