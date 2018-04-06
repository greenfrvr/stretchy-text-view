//
//  OffsettedSelectionRect.swift
//  StretchyTextView
//
//  Created by Artsiom Grintsevich on 06.04.2018.
//  Copyright © 2018 Artsiom Grintsevich. All rights reserved.
//

import UIKit

internal class OffsettedSelectionRect: UITextSelectionRect {
    
    private let original: UITextSelectionRect
    private let verticalOffset: CGFloat
    
    override var rect: CGRect {
        return original.rect
            .offsetBy(dx: 0, dy: -verticalOffset)
            .insetBy(dx: 0, dy: verticalOffset)
    }
    
    override var writingDirection: UITextWritingDirection {
        return original.writingDirection
    }
    
    override var containsStart: Bool {
        return original.containsStart
    }
    
    override var containsEnd: Bool {
        return original.containsEnd
    }
    
    override var isVertical: Bool {
        return original.isVertical
    }
    
    init(originalRect original: UITextSelectionRect, offset: CGFloat) {
        self.original = original
        self.verticalOffset = offset
    }
}
