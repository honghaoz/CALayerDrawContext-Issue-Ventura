# CALayerDrawContext-Issue-Ventura
`CALayer` invalid CGContext on Ventura `(CGBitmapContextGetWidth: invalid context 0x600003876e80)`

The following code runs well on macOS Monteray but broken on macOS Ventura (tested on `13.3.1` and `13.4.1`)

```swift
import Cocoa

class ViewController: NSViewController {

    class TestLayer: CALayer {

        override func draw(in ctx: CGContext) {
            super.draw(in: ctx)
            print("context.width: \(ctx.width))")
            print("context.width: \(ctx.height))")
            print("context: \(ctx))")
        }
    }

    private let testLayer = TestLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor

        testLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        view.layer?.addSublayer(testLayer)
    }

    override func viewDidAppear() {
        testLayer.setNeedsDisplay()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
```

The error message:
```
2023-06-28 20:47:56.423328-0700 CALayerDrawContext[68964:1640092] [demo.CALayerDrawContext.CALayerDrawContext] CGBitmapContextGetWidth: invalid context 0x6000039dea00. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
context.width: 0)
2023-06-28 20:47:56.423407-0700 CALayerDrawContext[68964:1640092] [demo.CALayerDrawContext.CALayerDrawContext] CGBitmapContextGetHeight: invalid context 0x6000039dea00. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
context.width: 0)
context: <CGContext 0x6000039dea00> (kCGContextTypeCoreAnimationAutomatic))
```
