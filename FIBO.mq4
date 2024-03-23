

void OnTick() {

   ObjectDelete("Fibonacci");
   ObjectCreate("Fibonacci", OBJ_FIBO, 0, Time[90], High[90], Time[1], Low[1]);   
   
   double level_100 = ObjectGet("Fibonacci", OBJPROP_PRICE1);
   double level_0 = ObjectGet("Fibonacci", OBJPROP_PRICE2);
   double span = level_100 - level_0;  // span = oraliq 
   
   
   double level = (level_100 - level_0) * 1.618 + level_0;        // 1.618 o'rnigi luboy urvin qoyilsa shu urvin qiymatini oberadi
      
   double level_618 = span * .618 + level_0; 
   double level_236 = span * .236 + level_0;
   double level_500 = span * .500 + level_0;
   double level_382 = span * .382 + level_0;

   
   
   Print("level_100  ", level_100);
   Print("level_0  ", level_0);
   Print("span  ", span);
   
   
   Print("level_618  ", level_618);
   Print("level_236  ", level_236);
   Print("level_500  ", level_500);
   Print("level_382  ", level_382);
   Print("level  ", level);

   
   ExpertRemove();



  }
//+------------------------------------------------------------------+
