//
//  String+Resizing.swift
//  TextSystem
//
//  Created by Todd Olsen on 12/29/15.
//  Copyright © 2015 Todd Olsen. All rights reserved.
//

import AppKit

extension NSAttributedString {
    
    func sizeForWidth(width: CGFloat, height: CGFloat) -> NSSize {
        
        if self.string.characters.count == 0 { return NSZeroSize }
        
        let size = NSMakeSize(width, height)
        let textContainer = NSTextContainer(containerSize: size)
        let textStorage = NSTextStorage(attributedString: self)
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        layoutManager.hyphenationFactor = 0.0
        layoutManager.glyphRangeForTextContainer(textContainer)
        
        var result = layoutManager.usedRectForTextContainer(textContainer).size
        let extraLineSize = layoutManager.extraLineFragmentRect.size
        if extraLineSize.height > 0 {
            result.height -= extraLineSize.height
        }
        return result
    }
    
    func heightForWidth(width: CGFloat) -> CGFloat {
        return sizeForWidth(width, height: CGFloat.max).height
    }
    
    func widthForHeight(height: CGFloat) -> CGFloat {
        return sizeForWidth(CGFloat.max, height: height).width
    }
}

extension String {
    
    func sizeForWidth(width: CGFloat, height: CGFloat, attributes: [String:AnyObject]) -> NSSize {
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        return attributedString.sizeForWidth(width, height: height)
    }
    
    func heightForWidth(width: CGFloat, attributes: [String:AnyObject]) -> CGFloat {
        return sizeForWidth(width, height: CGFloat.max, attributes: attributes).height
    }
    
    func widthForHeight(height: CGFloat, attributes: [String:AnyObject]) -> CGFloat {
        return sizeForWidth(CGFloat.max, height: height, attributes: attributes).width
    }
    
    func sizeForWidth(width: CGFloat, height: CGFloat, font: NSFont) -> NSSize {
        let attributes = [NSFontAttributeName:font]
        return sizeForWidth(width, height: height, attributes: attributes)
    }
    
    func heightForWidth(width: CGFloat, font: NSFont) -> CGFloat {
        return sizeForWidth(width, height: CGFloat.max, font: font).height
    }
    
    func widthForHeight(height: CGFloat, font: NSFont) -> CGFloat {
        return sizeForWidth(CGFloat.max, height: height, font: font).width
    }
    
    func singleLineHeightForFont(font: NSFont) -> CGFloat {
        return "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12345667890".heightForWidth(CGFloat.max, font: font)
    }
}

extension NSString {
    
    func sizeForWidth(width: CGFloat, height: CGFloat, attributes: [String:AnyObject]) -> NSSize {
        let attributedString = NSAttributedString(string: self as String, attributes: attributes)
        return attributedString.sizeForWidth(width, height: height)
    }
    
    func heightForWidth(width: CGFloat, attributes: [String:AnyObject]) -> CGFloat {
        return sizeForWidth(width, height: CGFloat.max, attributes: attributes).height
    }
    
    func widthForHeight(height: CGFloat, attributes: [String:AnyObject]) -> CGFloat {
        return sizeForWidth(CGFloat.max, height: height, attributes: attributes).width
    }
    
    func sizeForWidth(width: CGFloat, height: CGFloat, font: NSFont) -> NSSize {
        let attributes = [NSFontAttributeName:font]
        return sizeForWidth(width, height: height, attributes: attributes)
    }
    
    func heightForWidth(width: CGFloat, font: NSFont) -> CGFloat {
        return sizeForWidth(width, height: CGFloat.max, font: font).height
    }
    
    func widthForHeight(height: CGFloat, font: NSFont) -> CGFloat {
        return sizeForWidth(CGFloat.max, height: height, font: font).width
    }
}