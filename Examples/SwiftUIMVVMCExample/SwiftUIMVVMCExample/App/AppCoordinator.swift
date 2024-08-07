//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol AppCoordinating: RootCoordinating {

    associatedtype View: SwiftUI.View

    func goToCurrentRoute() -> View
}

final class AppCoordinator: TransmittingRootCoordinator<RootRouteIDManager<AppRootRouteID>>, AppCoordinating {

    init(rootRouteIDManager: RootRouteIDManager = .init(currentRouteID: .launch)) {
        super.init(parent: nil, routeIDManager: rootRouteIDManager)
    }

    func goToCurrentRoute() -> some View {
        goTo(routeID: routeIDManager.currentRouteID)
    }

    func goTo(routeID: AppRootRouteID) -> some View {
        Group {
            switch routeID {
            case .launch:
                goToLaunchScreen()
            case .rootRouteIDs:
                goToRootRouteIDsScreen()
            case .tabBar:
                goToTabBarScreen()
            case .navigationStack:
                goToNavigationScreen()
            case .modals:
                goToModalsScreen()
            }
        }
    }

    func goToLaunchScreen() -> some View {
        LaunchScreenView(
            viewModel: LaunchScreenVM(
                coordinator: LaunchScreenCoordinator(
                    parent: self
                )
            )
        )
    }

    func goToRootRouteIDsScreen() -> some View {
        RootRouteIDsScreenView(
            viewModel: RootRouteIDsScreenVM(
                coordinator: RootRouteIDsScreenCoordinator(
                    parent: self
                )
            ),
            params: .init(
                excludedRouteID: .rootRouteIDs
            )
        )
    }

    func goToTabBarScreen() -> some View {
        TabBarScreenView(
            viewModel: TabBarScreenVM(
                coordinator: TabBarScreenCoordinator(
                    parent: self
                )
            )
        )
    }

    func goToNavigationScreen() -> some View {
        NavigationScreenView(
            viewModel: NavigationScreenVM(
                coordinator: NavigationScreenCoordinator(parent: self)
            )
        )
    }

    func goToModalsScreen() -> some View {
        ModalsScreenView(
            viewModel: ModalsScreenVM(
                coordinator: ModalsScreenCoordinator(parent: self)
            )
        )
    }
}
