# currency_freaks.cr
Web-API for [billing.currencyfreaks.com](https://currencyfreaks.com/) free Currency Conversion and Forex Exchange Rate API

## Example
```cr
require "./currency_freaks"

currency_freaks = CurrencyFreaks.new(api_key="")
latest_rates = currency_freaks.get_latest_rates()
puts latest_rates
```
