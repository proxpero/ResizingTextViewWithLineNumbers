//
//  TextStorage.swift
//  TextSystem
//
//  Created by Todd Olsen on 12/29/15.
//  Copyright © 2015 Todd Olsen. All rights reserved.
//

import AppKit

public class TextStorage: NSTextStorage {
    
    private let backingStore = NSMutableAttributedString(string: "")
    
    private var dynamicTextNeedsUpdate = false
    
    override public var string: String { return backingStore.string }
    
    override public init() {
        super.init()
        self.setAttributedString(backingStore)
    }
    
    required public init?(pasteboardPropertyList propertyList: AnyObject, ofType type: String) {
        fatalError("init(pasteboardPropertyList:ofType:) has not been implemented")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func attributesAtIndex(location: Int, effectiveRange range: NSRangePointer) -> [String : AnyObject] {
        return backingStore.attributesAtIndex(location, effectiveRange: range)
    }
    
    override public func replaceCharactersInRange(range: NSRange, withString str: String) {
        beginEditing()
        
        backingStore.replaceCharactersInRange(range, withString: str)
        edited([.EditedAttributes, .EditedCharacters], range: range, changeInLength: str.characters.count - range.length)
        dynamicTextNeedsUpdate = true
        
        endEditing()
    }
    
    override public func setAttributes(attrs: [String : AnyObject]?, range: NSRange) {
        beginEditing()
        
        backingStore.setAttributes(attrs, range: range)
        edited([.EditedAttributes], range: range, changeInLength: 0)
        
        endEditing()
    }
    
    override public func processEditing() {
        if (dynamicTextNeedsUpdate) {
            dynamicTextNeedsUpdate = false
            performReplacementsForCharacterChangeInRange(editedRange)
        }
        super.processEditing()
    }
    
    // MARK: Custom Methods
    
    func performReplacementsForCharacterChangeInRange(changedRange: NSRange) {
        
        
    }
}