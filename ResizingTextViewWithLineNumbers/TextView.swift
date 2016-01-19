//
//  TextView.swift
//  TextSystem
//
//  Created by Todd Olsen on 12/29/15.
//  Copyright © 2015 Todd Olsen. All rights reserved.
//

import AppKit

public class TextView: NSTextView, NSTextDelegate {
    
    override init(frame frameRect: NSRect, textContainer container: NSTextContainer?) {
        super.init(frame: frameRect, textContainer: container)
        configureView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        
        translatesAutoresizingMaskIntoConstraints   = false
        
        allowsUndo                          = true
        editable                            = true
        selectable                          = true
        richText                            = true
        importsGraphics                     = true
        allowsImageEditing                  = false
        automaticQuoteSubstitutionEnabled   = true
        automaticDashSubstitutionEnabled    = true
        automaticSpellingCorrectionEnabled  = true
        automaticTextReplacementEnabled     = true
        
        usesRuler                           = false
        rulerVisible                        = false
        usesInspectorBar                    = false
        
    }
    
    override public var opaque: Bool { return true }
    override public var flipped: Bool { return true }
    
}
