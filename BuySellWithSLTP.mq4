//+------------------------------------------------------------------+
//|                                                BuySellWithSLTP.mq4|
//|                                                                  |
//| Abre una orden de compra o venta con SL y TP predefinidos        |
//+------------------------------------------------------------------+

#property script_show_inputs

extern double Lots = 0.1;               // Lotes
extern int Slippage = 3;                // Slippage
extern bool Buy = true;                 // Si es true, abrirá una orden de compra. Si es false, abrirá una orden de venta.
extern double SL_pips = 10;             // Stop Loss en pips
extern double TP_pips = 50;             // Take Profit en pips para las compras
extern double TP_pips_sell = 30;        // Take Profit en pips para las ventas

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void start() {
   double Ask = MarketInfo("XAUUSD", MODE_ASK); // Precio actual de venta
   double Bid = MarketInfo("XAUUSD", MODE_BID); // Precio actual de compra
   
   double StopLossLevel, TakeProfitLevel;

   if(Buy) { // Si es una orden de compra
      StopLossLevel = Ask - SL_pips * Point; // Nivel de Stop Loss
      TakeProfitLevel = Ask + TP_pips * Point; // Nivel de Take Profit

      // Abrir la orden de compra
      int ticket = OrderSend("XAUUSD", OP_BUY, Lots, Ask, Slippage, StopLossLevel, TakeProfitLevel, "Compra con SL y TP", 0, 0, Green);

      // Verificar si la orden se abrió correctamente
      if(ticket < 0) {
         Print("Error al abrir la orden de compra: ", GetLastError());
      } else {
         Print("Orden de compra abierta correctamente con el ticket: ", ticket);
      }
   } else { // Si es una orden de venta
      StopLossLevel = Bid + SL_pips * Point; // Nivel de Stop Loss
      TakeProfitLevel = Bid - TP_pips_sell * Point; // Nivel de Take Profit

      // Abrir la orden de venta
      int ticket = OrderSend("XAUUSD", OP_SELL, Lots, Bid, Slippage, StopLossLevel, TakeProfitLevel, "Venta con SL y TP", 0, 0, Red);

      // Verificar si la orden se abrió correctamente
      if(ticket < 0) {
         Print("Error al abrir la orden de venta: ", GetLastError());
      } else {
         Print("Orden de venta abierta correctamente con el ticket: ", ticket);
      }
   }
}
//+------------------------------------------------------------------+
