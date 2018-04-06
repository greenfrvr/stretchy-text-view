//
//  StretchyTextView.swift
//  StretchyTextView
//
//  Created by Artsiom Grintsevich on 06.04.2018.
//  Copyright © 2018 Artsiom Grintsevich. All rights reserved.
//

import UIKit

public class StretchyTextView: UITextView {
    
    @IBInspectable public var lineSpacing: CGFloat = 4.0 {
        didSet {
            if lineSpacing < 0 {
                lineSpacing = 0
            }
            invalidateLayout()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutManager.delegate = self
        textStorage.delegate = self
        
        invalidateLayout()
    }
    
    override public func caretRect(for position: UITextPosition) -> CGRect {
        var rect = super.caretRect(for: position)
        rect.size.height = rect.height - lineSpacing
        return rect
    }
    
    public func invalidateLayout() {
        let loc = offset(from: beginningOfDocument, to: beginningOfDocument)
        let length = offset(from: beginningOfDocument, to: endOfDocument)
        
        let range = NSRange(location: loc, length: length)
        
        layoutManager.invalidateLayout(forCharacterRange: range, actualCharacterRange: nil)
    }
}

// ******************************* MARK: NSLayoutManagerDelegate

extension StretchyTextView: NSLayoutManagerDelegate {
    
    public func layoutManager(_ layoutManager: NSLayoutManager, lineSpacingAfterGlyphAt glyphIndex: Int, withProposedLineFragmentRect rect: CGRect) -> CGFloat {
        return lineSpacing
    }
}

// ******************************* MARK: NSTextStorageDelegate

extension StretchyTextView: NSTextStorageDelegate {
    
    override public func selectionRects(for range: UITextRange) -> [Any] {
        let originalRects = super.selectionRects(for: range)
        
        if let rects = originalRects as? [UITextSelectionRect] {
            return rects.map { OffsettedSelectionRect(originalRect: $0, offset: lineSpacing / 2) }
        }
        
        return originalRects
    }
}
