
public enum Token {
    case parensOpen
    case op(String)
    case number(Int)
    case parensClose
}

public struct Lexer {
    public static func tokenize(_ input: String) -> [Token] {
        return input.characters.flatMap {
            switch $0 {
            case "(": return Token.parensOpen
            case ")": return Token.parensClose
            case "s": return Token.op($0.description)
            default:
                if "0"..."9" ~= $0 {
                    return Token.number(Int($0.description)!)
                }
            }
            
            return nil
        }
    }
}

