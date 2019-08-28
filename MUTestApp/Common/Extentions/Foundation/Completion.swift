import Foundation

typealias Completion<T, E: Error> = ((Result<T, E>) -> Void)
