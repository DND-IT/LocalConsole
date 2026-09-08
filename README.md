# **LocalConsole**

Welcome to LocalConsole! This Swift Package makes on-device debugging easy with a convenient PiP-style console that can display items in the same way ```print()``` will in Xcode.

<div>
  <img src="https://github.com/duraidabdul/Demos/blob/main/Demo_Resize.gif?raw=true" width="320">
</div>

## **Setup**

1. In your Xcode project, navigate to File > Swift Packages > Add Package Dependancy...

2. Paste the following into the URL field: https://github.com/duraidabdul/LocalConsole/

3. Once the package dependancy has been added, import LocalConsole and create an easily accessible global instance of ```LCManager.shared```.
```swift
import LocalConsole

let consoleManager = LCManager.shared
```

## **Usage**
Once prepared, the consoleManager can be used throughout your project.
```swift

// Activate the console view.
consoleManager.isVisible = true

// Deactivate the console view.
consoleManager.isVisible = false
```

```swift
// Print items to the console view.
consoleManager.print("Hello, world!")

// Clear console text.
consoleManager.clear()

// Get console text.
consoleManager.text
```

```swift
// Change the console view font size.
consoleManager.fontSize = 5
```
