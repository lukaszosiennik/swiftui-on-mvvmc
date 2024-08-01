//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationRootScreenCoordinatorProtocol: NavigationDestinationCoordinatorProtocol 
where RouteID == NavigationScreenNavigationRouteID {}

final class NavigationRootScreenCoordinator: Coordinator, NavigationRootScreenCoordinatorProtocol {
    
    let allowedRouteIDs: NavigationScreenAllowedNavigationRouteIDs = .init(
        values: .init(RouteID.allCases)
    )
}
