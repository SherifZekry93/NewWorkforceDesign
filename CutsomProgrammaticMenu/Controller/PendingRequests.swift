//
//  PendingRequests.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/30/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class PendingRequests: BaseMenuVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleView(title: "Pending Request", comparedTo:darkFillView)
    }
    fileprivate func setupPendingRequestsViews()
    {
        
    }
    
    /*
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="118" height="51" viewBox="0 0 118 51">
      <defs>
        <filter id="Rectangle_9" x="0" y="0" width="118" height="51" filterUnits="userSpaceOnUse">
          <feOffset dy="3" input="SourceAlpha"/>
          <feGaussianBlur stdDeviation="3" result="blur"/>
          <feFlood flood-opacity="0.161"/>
          <feComposite operator="in" in2="blur"/>
          <feComposite in="SourceGraphic"/>
        </filter>
      </defs>
      <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Rectangle_9)">
        <g id="Rectangle_9-2" data-name="Rectangle 9" transform="translate(9 6)" fill="#fb9622" stroke="#fb9622" stroke-width="1">
          <rect width="100" height="33" rx="16.5" stroke="none"/>
          <rect x="0.5" y="0.5" width="99" height="32" rx="16" fill="none"/>
        </g>
      </g>
    </svg>
     */
}
