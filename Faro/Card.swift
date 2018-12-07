import Foundation

/// A Suit for a playing card.
enum Suit: String, CustomStringConvertible {
    case spade = "♠️"
    case heart = "♥️"
    case club = "♣️"
    case diamond = "♦️"
    
    /// Returns an array of all valid suits.
    static var all: [Suit] {
        return [.spade, .heart, .club, .diamond]
    }
    
    var description: String {
        return self.rawValue
    }
}

/// A face (aka "court") playing card.
enum Face: String {
    case j = "jack"
    case q = "queen"
    case k = "king"
}

/// The rank of a playing card (A, 2, 10, J, Q, K).
enum Rank: CustomStringConvertible {
    case ace
    case face(Face)
    case numeric(Int)
    
    /// Returns the numeric value of a playing card (ace as a 1).
    var value: Int {
        switch self {
        case .ace:
            return 1
        case .numeric(let value):
            return value
        case .face(let court) where court == .j:
            return 11
        case .face(let court) where court == .q:
            return 12
        case .face(let court) where court == .k:
            return 13
        default:
            return 0
        }
    }
    
    /// Returns an array of all valid ranks.
    static var all: [Rank] {
        var allRanks = [Rank.ace]
        
        for value in 2...10 {
            allRanks.append(Rank.numeric(value))
        }
        
        allRanks += [Rank.face(.j), Rank.face(.q), Rank.face(.k)]
        
        return allRanks
    }
    
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .face(let court):
            return court.rawValue.uppercased()
        case .numeric(let value):
            return String(value)
        }
    }
}

/// A playing card with a suit and rank.
struct Card: CustomStringConvertible {
    let suit: Suit
    let rank: Rank
    
    var description: String {
        return suit.description + rank.description
    }
}
