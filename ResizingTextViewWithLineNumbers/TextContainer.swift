//
//  TextContainer.swift
//  TextSystem
//
//  Created by Todd Olsen on 12/29/15.
//  Copyright © 2015 Todd Olsen. All rights reserved.
//

import AppKit

public class TextContainer: NSTextContainer {
    
    override public init(size: NSSize) {
        super.init(size: size)
        
        containerSize = NSMakeSize(CGFloat.max, CGFloat.max)
        widthTracksTextView = true
        heightTracksTextView = false
        
    }
        
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}