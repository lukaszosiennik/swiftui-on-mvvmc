//
//  Created by Łukasz Osiennik on 28/07/2024.
//

open class Coordinator: Coordinating {

    weak public private(set) var parent: Coordinator?

    public init(parent: Coordinator?) {
        self.parent = parent
    }
}
