len = (\x-> case x of
              [] -> 0
              (y:ys) -> 1 + len ys
      )
