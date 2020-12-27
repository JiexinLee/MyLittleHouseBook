//
//  DiscoveryVC.swift
//  MyLittleHouseBook
//
//  Created by Caihy on 15/12/20.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class DiscoveryVC: ButtonBarPagerTabStripViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Discover")
    }
  
}
