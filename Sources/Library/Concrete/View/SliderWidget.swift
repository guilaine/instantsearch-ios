//
//  SliderWidget.swift
//  ecommerce
//
//  Created by Guy Daher on 08/03/2017.
//  Copyright © 2017 Guy Daher. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
@objc public class SliderWidget: UISlider, RefinementControlViewDelegate, AlgoliaWidget {
    
    public func set(value: NSNumber) {
        setValue(value.floatValue, animated: false)
    }
    
    public func setup() {
        addTarget(viewModel, action: #selector(viewModel.numericFilterValueChanged), for: .valueChanged)
        
        // We add the initial value of the slider to the Search
        viewModel.numericFilterValueChanged()
    }
    
    var viewModel: RefinementControlViewModelDelegate
    
    public override init(frame: CGRect) {
        viewModel = RefinementControlViewModel()
        super.init(frame: frame)
        viewModel.view = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        viewModel = RefinementControlViewModel()
        super.init(coder: aDecoder)
        viewModel.view = self
    }
    
    @IBInspectable public var attributeName: String = ""
    
    @IBInspectable public var operation: String = "equal"
    
    // Note: can't have optional Float because IBInspectable have to be bridgable to objc
    // and value types optional cannot be bridged.
    internal var clearValue: NSNumber = 0
    
    public func getValue() -> NSNumber {
        return NSNumber(value: value)
    }
    
    // TODO: Do something about this...
    public var inclusive: Bool = false
}
