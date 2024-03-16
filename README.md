# CustomAlert

Customizable and reuseable Alert popup in swiftUI

## Why

This save you many lines of code. 


## Usage
### Binding Bool to isPresended param to show Alert, toggle it in dismissAction to close Alert

you can simply add a modifier on a view and pass in title and message you want show
```swift
import SwiftUI
import CustomAlert

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                showAlert.toggle()
            }
            .customAlert(isPresented: $showAlert,
                         title: "Custom Alert",
                         message: "This is a custom alert message.",
                         dismissAction: {
                             showAlert = false
                         })
        }
    }
}
```

or You can also create an Alert with custom fontsize, Box size and background clor

```swift
import SwiftUI
import CustomAlert

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                showAlert.toggle()
            }
            .customAlert(isPresented: $showAlert,
                         title: "Custom Alert",
                         message: "This is a custom alert message.",
                         messageFontSize: 20,
                         boxSize: CGSize(width: 320, height: 240),
                         boxBackgroundColor: .blue,
                         dismissAction: {
                             showAlert = false
                         })
        }
    }
}
```


## Install

### SwiftPM

```
https://github.com/feihuan1/CustomAlertLibrary.git
```

## License

See [LICENSE](LICENSE)

Copyright © 2024 Feihuan Peng
