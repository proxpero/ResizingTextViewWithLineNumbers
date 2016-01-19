//
//  Constants.swift
//  ComponentArrayViewController
//
//  Created by Todd Olsen on 1/15/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Cocoa

struct k {
    
    struct Color {
        static let componentBackground = NSColor(calibratedWhite: 0.97, alpha: 1.0)
        static let componentBackgroundItem = NSColor(calibratedWhite: 0.97, alpha: 1.0)
        static let componentDivider = NSColor(calibratedWhite: 0.80, alpha: 1.0)
        static let textViewBorder = NSColor(calibratedWhite: 0.80, alpha: 1.0)
        static let textViewBackground = NSColor(calibratedWhite: 0.97, alpha: 1.0)
        static let foregroundText = NSColor.secondaryLabelColor()
        static let labelForegroundText = NSColor.tertiaryLabelColor()
        static let textViewBorderHighlight = NSColor(calibratedRed: 151.0/255.0, green: 197.0/255.0, blue: 246.0/255.0, alpha: 1.0)
    }
    
    struct Text {
//        static let componentFontName = "HelveticaNeue"
        static let componentFontSize: CGFloat = 15.0
        static let componentContainerInset: CGFloat = 0.0
        static let componentContainerSpacing: CGFloat = 1.0
        static let componentItemContainerInset: CGFloat = 3.0
        static let componentItemContainerSpacing: CGFloat = 1.0
        static let textViewInset: CGFloat = 5.0
        static let textViewFont: NSFont = NSFont.systemFontOfSize(k.Text.componentFontSize)
    }
    
    struct Notification {
        static let TextViewHeightDidChange = "ResizingTextContainer.TextViewHeightDidChange.Notification"
    }
}
