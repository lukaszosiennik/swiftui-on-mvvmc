//
//  Created by Łukasz Osiennik on 28/07/2024.
//

extension Coordinator {
    
    @discardableResult
    func coordToRoot<RouteID: RootRouteID>(
        routeID: RouteID
    ) -> Bool {
        guard let rootRouteManager: RootRouteManager<RouteID> = provideRootRouteManager() else {
            return false
        }
        
        rootRouteManager.currentRouteID = routeID
        
        return true
    }
    
    private func provideRootRouteManager<RouteID: RootRouteID>() -> RootRouteManager<RouteID>? {
        var coordinator: Coordinator? = self
        
        while (coordinator?.parent != nil) {
            coordinator = coordinator?.parent
        }
        
        return (coordinator as? RootCoordinator)?.routeManager
    }
}
