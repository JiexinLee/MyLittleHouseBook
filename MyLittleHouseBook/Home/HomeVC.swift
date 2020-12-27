//
//  HomeVC.swift
//  MyLittleHouseBook
//
//  Created by Caihy on 15/12/20.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        // selected bar
        self.settings.style.selectedBarBackgroundColor = UIColor(named: "TabbarTint")!
        self.settings.style.selectedBarHeight = 3
        
        // button bar item
        self.settings.style.buttonBarItemBackgroundColor = .clear
        self.settings.style.buttonBarItemTitleColor = .label
        self.settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        self.settings.style.buttonBarItemLeftRightMargin = 0
        
        // button bar
        self.settings.style.buttonBarLeftContentInset = 86
        self.settings.style.buttonBarRightContentInset = 86
        
        super.viewDidLoad()

        // bounce setting
        self.containerView.bounces = false
        self.containerView.bouncesZoom = false
        
        // override function of indicator bar & collection cell on top bar
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label

            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
        
        // relocate the first enter page to the center page [Discover]
        DispatchQueue.main.async {
            self.moveToViewController(at: 1, animated: false)
        }
        
    }
        
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: kFollowVCID )
        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryVCID)
        let nearbyVC = storyboard!.instantiateViewController(identifier: kNearbyVCID)
        return [followVC, discoveryVC, nearbyVC]
    }

}
