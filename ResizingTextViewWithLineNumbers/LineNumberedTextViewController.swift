//
//  LineNumberedTextViewController.swift
//  LineNumberedTextView
//
//  Created by Todd Olsen on 1/16/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Cocoa

final class LineNumberedTextViewController: NSViewController {
    
    override func viewDidLoad() {
        textView.wantsLayer = true
        textView.layer?.backgroundColor = NSColor.controlColor().CGColor
    }
    
    @IBOutlet weak var textView: ResizingTextContainer!
    
    @IBAction func showLineNumbersAction(sender: NSButton) {
     
        textView.showLineNumbers = sender.state == 1 ? true : false
        
    }
}
