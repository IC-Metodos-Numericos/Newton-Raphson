module Newton where

-- Método de Newton-Raphson
newton :: (Double -> Double) -> (Double -> Double) -> Double -> Int -> Double
newton f f' x0 maxIter = iterateNewton x0 maxIter
  where
    iterateNewton x 0 = x
    iterateNewton x n =
      let xNext = x - f x / f' x
      in iterateNewton xNext (n - 1)

-- Exemplo: f(x) = x^2 - 2
f :: Double -> Double
f x = x^2 - 2

f' :: Double -> Double
f' x = 2 * x


main :: IO ()
main = do
  let root  = newton f f' 1.0 10
  putStrLn $ "A raiz aproximada é: " ++ show root