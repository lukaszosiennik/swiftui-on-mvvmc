//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationRootScreenCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype View: SwiftUI.View
    
    typealias RouteID = NavigationRootScreenNavigationRouteID
    
    func goTo(routeID: RouteID) -> View
}

final class NavigationRootScreenCoordinator: Coordinator, NavigationRootScreenCoordinatorProtocol {
    
    func goTo(routeID: RouteID) -> some View {
        Group {
            switch routeID {
            case .first, .second:
                TemplateScreenView(
                    viewModel: TemplateScreenViewModel(
                        coordinator: TemplateScreenCoordinator(parent: self)
                    ),
                    params: .init(for: routeID)
                )
            case .third:
                RootRouteIDsScreenView(
                    viewModel: RootRouteIDsScreenViewModel(
                        coordinator: RootRouteIDsScreenCoordinator(
                            parent: self
                        )
                    ),
                    params: .init(
                        excludedRouteID: .home
                    )
                )
            }
        }
    }
}
