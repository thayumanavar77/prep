import Text.Parsec
import Text.Parsec.String
import Control.Applicative ((<$>))
data Expr = Val Int
          | Add Expr Expr
          | Minus Expr Expr
          | Mult  Expr Expr
          | Divi  Expr Expr
          | Uplus Expr
          | Uminus Expr
          deriving Show
interp expr = case expr of
              Val x -> x
              Add e1 e2 -> (interp e1) + (interp e2)
              Minus e1 e2 -> (interp e1) - (interp e2)
              Mult e1 e2 -> (interp e1) * (interp e2)
              Divi e1 e2 -> (interp e1) `div` (interp e2) 
              Uplus e -> interp e
              Uminus e -> (- (interp e))

-- Write parser

expr = term `chainr1` eoper   
term = factor `chainr1` toper
factor = vnum <|> uplus <|> uminus <|> parens
--uplus :: Parser (Expr->Expr)
uplus = parseOp "+" >> factor >>= (\f -> return (Uplus f))
uminus = parseOp "-" >> factor >>= (\f -> return (Uminus f))
parens = parseOp "(" >> expr >>= (\e -> parseOp ")" >> return e)
--uplus = parseOp "+" >> factor >>=(\f->return Uplus f) -- <|> (parseOp "-" >> factor >>=\f->Uminus f) 

eoper = (parseOp "+" >> return Add) <|> (parseOp "-" >> return Minus) 
toper :: Parser (Expr -> Expr -> Expr)
toper = (parseOp "*" >> return Mult) <|> (parseOp "/" >> return Divi)

parseOp s = string s >> spaces >> return ()
vnum = Val . read <$> (many1 digit)

cstrp :: Parser Expr
cstrp = spaces >> expr >>=(\e->eof >> return e)

main = do
  line <- getLine
  let 
    y = case parse cstrp "(exp)" line of
          Right x -> x 
          _ -> Val 0
  putStrLn $ show y
  putStrLn $ show $ interp $ y
 
