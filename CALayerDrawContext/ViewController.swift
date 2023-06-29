//
//  ViewController.swift
//  CALayerDrawContext
//
//  Created by Honghao Zhang on 6/28/23.
//

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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor

        let testLayer = TestLayer()
        testLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        view.layer?.addSublayer(testLayer)
        testLayer.setNeedsDisplay()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

