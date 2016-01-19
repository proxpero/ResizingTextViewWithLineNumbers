//
//  ResizingTextContainer.swift
//  ComponentArrayViewController
//
//  Created by Todd Olsen on 1/12/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Cocoa

class ResizingTextContainer: NSView, NSTextViewDelegate {
    
    var lineCount: Int = 0
    var showLineNumbers: Bool = false {
        didSet {
            
            insetConstraint.constant =  showLineNumbers ? 40.0 : 0.0
            lineNumberField.hidden =    showLineNumbers ? false : true
            resizeTextView()
            
        }
    }
    
    private let textStorage = TextStorage()
    private var heightConstraint: NSLayoutConstraint!
    private var insetConstraint: NSLayoutConstraint!
    private var lineNumberField: NSTextField!
    
    var attributedString: NSAttributedString {
        get {
            return textStorage as NSAttributedString
        }
        
        set {
            textStorage.setAttributedString(newValue)
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        
        translatesAutoresizingMaskIntoConstraints = false

        func createTextView() -> TextView {
            
            let layoutManager = LayoutManager()
            textStorage.addLayoutManager(layoutManager)
            let textContainer = TextContainer(size: self.bounds.size)
            layoutManager.addTextContainer(textContainer)
            let textView = TextView(frame: self.bounds, textContainer: textContainer)
            textView.font = k.Text.textViewFont
            textView.delegate = self
            textView.textContainerInset = NSMakeSize(k.Text.textViewInset, k.Text.textViewInset)
            
            textView.wantsLayer = true
            textView.layer?.cornerRadius = k.Text.textViewInset
            textView.layer?.borderColor = k.Color.textViewBorder.CGColor
            textView.layer?.borderWidth = 1.0
            
            textView.backgroundColor = k.Color.textViewBackground
            
            return textView
            
        }
        
        let textView = createTextView()
        self.addSubview(textView)
        
        func createLineNumberTextField() -> NSTextField {
            
            let textField = NSTextField(frame: NSZeroRect)
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            textField.font            = NSFont.systemFontOfSize(14)
            textField.textColor       = NSColor.secondaryLabelColor()
            textField.bordered        = false
            textField.editable        = false
            textField.selectable      = false
            textField.cell?.wraps     = true
            textField.hidden          = true
            textField.alignment       = .Right
            textField.drawsBackground = false
            
            return textField
        }
        
        lineNumberField = createLineNumberTextField()
        self.addSubview(lineNumberField)
        
        insetConstraint = NSLayoutConstraint(item: textView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: 0)
        self.addConstraint(insetConstraint)
        
        self.addConstraint(NSLayoutConstraint(item: lineNumberField, attribute: .Top, relatedBy: .Equal, toItem: textView, attribute: .Top, multiplier: 1, constant: k.Text.textViewInset))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[numberField]-5-[textView]|", options: [], metrics: nil, views: ["textView": textView, "numberField": lineNumberField]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[textView]|", options: [], metrics: nil, views: ["textView": textView]))

        NSNotificationCenter.defaultCenter().addObserverForName(NSViewFrameDidChangeNotification, object: self, queue: nil) { [weak self] (note) -> Void in
            guard let s = self else { Swift.print("deallocated self"); return }
            s.resizeTextView()
        }
        
        heightConstraint = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 1)
        self.addConstraint(heightConstraint)
        
        resizeTextView()
    }
    
    func textDidChange(notification: NSNotification) {
        resizeTextView()
    }
    
    func resizeTextView() {
        
        let width   = 2.0 * k.Text.textViewInset
        let height  = 2.0 * k.Text.textViewInset
        
        let new     = (textStorage.string.isEmpty) ? singleLineHeight() + height : (textStorage.heightForWidth(bounds.size.width - width - insetConstraint.constant)) + height
        
        if new != heightConstraint.constant {
            heightConstraint.constant = new
            layoutSubtreeIfNeeded()
            lineCount = Int((new - height) / singleLineHeight())
            Swift.print("lines = \(lineCount)")

            var stringValue = ""
            for line in (1...lineCount) where line % 5 == 0 {
                stringValue += "\r\r\r\r\(line)\r"
            }
            
            lineNumberField.stringValue = stringValue
        }
    }
    
    func singleLineHeight() -> CGFloat {
        return "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12345667890".heightForWidth(CGFloat.max, font: k.Text.textViewFont)
    }
}


