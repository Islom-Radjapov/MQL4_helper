double CalculateLotSize(double riskPercentage, double stopLossPips) {
   // Get the contract size for the symbol
   double contractSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_CONTRACT_SIZE);
   
   // Get the tick size for the symbol
   double tickSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
   
   // Get the tick value for the symbol
   double tickValue = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
   
   // Calculate the value of a pip
   double pipValue = (tickValue / tickSize) * SymbolInfoDouble(_Symbol, SYMBOL_POINT);
   
   // Calculate the lot size
   double riskAmount = Start_balance * (riskPercentage / 100.0);
   double lotSize = riskAmount / (stopLossPips * pipValue);
   
   // Normalize the lot size to the allowed step
   double lotStep = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
   lotSize = MathFloor(lotSize / lotStep) * lotStep;
   
   // Ensure the lot size is within the allowed minimum and maximum
   double minLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double maxLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   lotSize = MathMin(MathMax(lotSize, minLot), maxLot);
   return lotSize;
}
