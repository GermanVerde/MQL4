//+------------------------------------------------------------------+
//|                                                BuyWithSL20XAU.mq4|
//|                                                                  |
//| Abre una orden de compra con un stop loss predefinido de 20 pips |
//+------------------------------------------------------------------+

#property script_show_inputs

extern double Lots = 0.1;               // Lotes
extern double StopLossPips = 20.0;      // Stop Loss en pips
extern int Slippage = 3;                // Slippage

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void start() {
   double Ask = MarketInfo("XAUUSD", MODE_ASK); // Precio actual de venta
   double StopLossLevel = Ask - StopLossPips * Point; // Nivel de Stop Loss

   // Abrir la orden de compra
   int ticket = OrderSend("XAUUSD", OP_BUY, Lots, Ask, Slippage, StopLossLevel, 0, "Compra con SL", 0, 0, Green);

   // Verificar si la orden se abrió correctamente
   if(ticket < 0) {
      Print("Error al abrir la orden: ", GetLastError());
   } else {
      Print("Orden de compra abierta correctamente con el ticket: ", ticket);
   }
}
//+------------------------------------------------------------------+
