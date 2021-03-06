#property copyright "Copyright © Djefferson William da Silva - Se Quex Cash"
#property link      ""
#property version   "1.00"
#property strict
#property indicator_chart_window
#property indicator_buffers 15
#property indicator_plots   15

// M1_3
#property indicator_label1  "M1 - 3"
//#property indicator_type1   DRAW_LINE
//#property indicator_color1  clrRed
//#property indicator_style1  STYLE_DOT
//#property indicator_width1  1

// M1_8
#property indicator_label2  "M1 - 8"
//#property indicator_type1   DRAW_LINE
//#property indicator_color1  clrRed
//#property indicator_style1  STYLE_DOT
//#property indicator_width1  1

// M1_13
#property indicator_label3  "M1 - 13"
//#property indicator_type3   DRAW_LINE
//#property indicator_color3  clrRed
//#property indicator_style3  STYLE_SOLID
//#property indicator_width3  0

// M1_55
#property indicator_label4  "M1 - 55"
//#property indicator_type4   DRAW_LINE
//#property indicator_color4  clrYellow
//#property indicator_style4  STYLE_SOLID
//#property indicator_width4  0

// M1_144
#property indicator_label5  "M1 - 144"
//#property indicator_type5   DRAW_LINE
//#property indicator_color5  clrWhite
//#property indicator_style5  STYLE_SOLID
//#property indicator_width5  0

// M5_3
#property indicator_label6  "M5 - 3"
//#property indicator_type6   DRAW_LINE
//#property indicator_color6  clrWhite
//#property indicator_style6  STYLE_SOLID
//#property indicator_width6  0

// M5_8
#property indicator_label7  "M5 - 8"
//#property indicator_type7   DRAW_LINE
//#property indicator_color7  clrWhite
//#property indicator_style7  STYLE_SOLID
//#property indicator_width7  0

// M5_13
#property indicator_label8  "M5 - 13"
//#property indicator_type8   DRAW_LINE
//#property indicator_color8  clrWhite
//#property indicator_style8  STYLE_SOLID
//#property indicator_width8  0

// M5_55
#property indicator_label9  "M5 - 55"
//#property indicator_type9   DRAW_LINE
//#property indicator_color9  clrWhite
//#property indicator_style9  STYLE_SOLID
//#property indicator_width9  0

// M5_144
#property indicator_label10  "M5 - 144"
//#property indicator_type10   DRAW_LINE
//#property indicator_color10  clrWhite
//#property indicator_style10  STYLE_SOLID
//#property indicator_width10  0

// M15_55
#property indicator_label11  "M15 - 144"
//#property indicator_type11   DRAW_LINE
//#property indicator_color11  clrWhite
//#property indicator_style11  STYLE_SOLID
//#property indicator_width11  1

// M15_377
#property indicator_label12  "M15 - 377"
//#property indicator_type12   DRAW_LINE
//#property indicator_color12  clrWhite
//#property indicator_style12  STYLE_SOLID
//#property indicator_width12  1

#property indicator_label13  "Arrow UP"
#property indicator_type13   DRAW_ARROW
#property indicator_color13  clrWhite
#property indicator_style13  STYLE_SOLID
#property indicator_width13  0

#property indicator_label14  "Arrow DOWN"
#property indicator_type14   DRAW_ARROW
#property indicator_color14  clrWhite
#property indicator_style14  STYLE_SOLID
#property indicator_width14  0

const bool CREATE_SCREENSHOTS = true;
const int MAMETHOD = 2;
const int MAPRICE = 0;
const int MASHIFT = 0;

double BUFFER_M1_3[];
double BUFFER_M1_8[];
double BUFFER_M1_13[];
double BUFFER_M1_55[];
double BUFFER_M1_144[];

double BUFFER_M5_3[];
double BUFFER_M5_8[];
double BUFFER_M5_13[];
double BUFFER_M5_55[];
double BUFFER_M5_144[];

double BUFFER_M15_144[];
double BUFFER_M15_377[];

double BUFFER_ARROW_UP[];
double BUFFER_ARROW_DOWN[];

string FILE_ALTA_SUFFIX = " em tendência de alta";
string FILE_BAIXA_SUFFIX = " em tendência de baixa";
string FILE_LATERAL_SUFFIX = " lateralizado";

int OnInit(){

   SetIndexBuffer(0,BUFFER_M1_3);
   SetIndexBuffer(1,BUFFER_M1_8);
   SetIndexBuffer(2,BUFFER_M1_13);
   SetIndexBuffer(3,BUFFER_M1_55);
   SetIndexBuffer(4,BUFFER_M1_144);
   
   SetIndexBuffer(5,BUFFER_M5_3);
   SetIndexBuffer(6,BUFFER_M5_8);
   SetIndexBuffer(7,BUFFER_M5_13);
   SetIndexBuffer(8,BUFFER_M5_55);
   SetIndexBuffer(9,BUFFER_M5_144);
   SetIndexBuffer(10,BUFFER_M15_144);
   SetIndexBuffer(11,BUFFER_M15_377);
   
   SetIndexBuffer(12,BUFFER_ARROW_UP);
   SetIndexBuffer(13,BUFFER_ARROW_DOWN);
   
   SetIndexArrow(12, 233);
   SetIndexArrow(13, 234);
  
   return(INIT_SUCCEEDED);
}

void OnDeinit(int const reason){
    // ObjectsDeleteAll(); 
    
}

int OnCalculate(const int rates_total, const int prev_calculated, const datetime &time[],const double &open[],const double &high[],const double &low[],const double &close[],const long &tick_volume[],const long &volume[],const int &spread[]){

   resetChartHighlight();
   
   int countedBars = IndicatorCounted();

   if (countedBars < 0) return(-1);
   if(countedBars>0) countedBars--;

   //drawMovingAverage(countedBars, 15, 377, BUFFER_M15_377, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   //drawMovingAverage(countedBars, 15, 144, BUFFER_M15_144, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);

   drawMovingAverage(countedBars, 5, 144, BUFFER_M5_144, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 5, 55, BUFFER_M5_55, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 5, 13, BUFFER_M5_13, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 5, 8, BUFFER_M5_8, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 5, 3, BUFFER_M5_3, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   
   drawMovingAverage(countedBars, 1, 144, BUFFER_M1_144, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 1, 55, BUFFER_M1_55, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 1, 13, BUFFER_M1_13, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 1, 8, BUFFER_M1_8, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, false);
   drawMovingAverage(countedBars, 1, 3, BUFFER_M1_3, BUFFER_ARROW_UP, BUFFER_ARROW_DOWN, true);

   return(rates_total);

}

void drawMovingAverage(int countedBars, int timeframe, int maPeriod, double &buffer[],  double &bufferArrowUp[],  double &bufferArrowDown[], bool drawArrow){
   int limit;

   double timeframePeriod = (timeframe*maPeriod/Period());

   limit=Bars-1 -countedBars;
   
   for(int i=limit; i>=0; i--){

      buffer[i] = iMA( NULL, 0, timeframePeriod, MASHIFT, MAMETHOD, MAPRICE, i);

      if(drawArrow){

         double open = Open[i];
         double close = Close[i];
         double low = Low[i];
         double high = High[i];
         
         if(isBullish(i)){
            bufferArrowUp[i] = Low[i];
         }else if(isBearlish(i)){
            bufferArrowDown[i] = High[i];
         } 

         if (i == 0){
            
            deleteScreenShots();
            resetChartHighlight();
            
            bool anyPreviousIsBullish = anyPreviousIsBullish(5);
            bool anyPreviousIsBearlish = anyPreviousIsBearlish(5);

            bool thisIsBullish = isBullish(i);
            bool thisIsBearlish = isBearlish(i);

            if(anyPreviousIsBullish){
               chartHighlight(true);
               updateChartScreenShot(true);
            }
            if(anyPreviousIsBearlish){
               chartHighlight(false);
               updateChartScreenShot(false);
            }

            bufferArrowDown[i] = NULL;
            bufferArrowUp[i] = NULL;

         }

      }

   }

}

void deleteScreenShots(){
   if(CREATE_SCREENSHOTS){
      FileDelete(ChartSymbol()+FILE_LATERAL_SUFFIX+".gif", FILE_BIN);
      FileDelete(ChartSymbol()+FILE_ALTA_SUFFIX+".gif", FILE_BIN);
      FileDelete(ChartSymbol()+FILE_BAIXA_SUFFIX+".gif", FILE_BIN);
   }
}

void updateChartScreenShot(bool bullish){
   if(CREATE_SCREENSHOTS ){
      string fileName = ChartSymbol()+(bullish? FILE_ALTA_SUFFIX : FILE_BAIXA_SUFFIX)+".gif";
      ChartScreenShot(0, fileName,600,400,0);
   }
}

void updateChartScreenShotLateral(){
   if(CREATE_SCREENSHOTS ){
      string fileName = ChartSymbol()+ FILE_LATERAL_SUFFIX+".gif";
      ChartScreenShot(0, fileName,600,400,0);
   }
}

void resetChartHighlight(){
  chartHighlight(clrWhite);
}

bool anyPreviousIsBearlish(int count){
   bool anyPreviousIsBearlish = false;
   for(int j=1;j<count;j++){
      if(!anyPreviousIsBearlish){
         anyPreviousIsBearlish = isBearlish(j);
      }
   }
   return anyPreviousIsBearlish;
}

bool anyPreviousIsBullish(int count){
   bool anyPreviousIsBullish = false;
   for(int j=1;j<count;j++){
      if(!anyPreviousIsBullish){
         anyPreviousIsBullish = isBullish(j);
      }       
   }
   return anyPreviousIsBullish;
}


bool isBullish(int i){
    return closeIsGreaterThanAllMas(i) 
            && ma_m_1_3_isGreaterThanAllMAs(i) 
            && openIsGreaterThan_M_5_3(i) && isSimetricBullish(i);
}

bool isBearlish(int i){
    return closeIsLowerThanAllMas(i) 
            && ma_m_1_3_isLowerThanAllMAs(i) 
            && openIsLowerThan_M_5_3(i) && isSimetricBearlish(i);
}

void chartHighlight(color _color){

   ChartSetInteger(ChartID(), CHART_COLOR_FOREGROUND, 0, _color);
   ChartSetInteger(ChartID(), CHART_COLOR_GRID, 0, _color);

   ChartSetInteger(ChartID(), CHART_COLOR_CHART_UP, 0, _color);
   ChartSetInteger(ChartID(), CHART_COLOR_CHART_DOWN, 0, _color);

   ChartSetInteger(ChartID(), CHART_COLOR_CANDLE_BULL, 0, _color);
   ChartSetInteger(ChartID(), CHART_COLOR_CANDLE_BEAR, 0, _color);
   
}


void chartHighlight(bool bullish){
   color _color = clrRed;
   if(bullish){
      _color = clrGreen;
   }
   chartHighlight(_color);
}

bool openIsLowerThan_M_5_3(int i){
   double open = Open[i];
   return open < BUFFER_M5_3[i];
}

bool openIsGreaterThan_M_5_3(int i){
   double open = Open[i];
   return open > BUFFER_M5_3[i];
}

bool closeIsGreaterThanAllMas(int i){
   double close = Close[i];
   return close > BUFFER_M1_3[i] && 
            close > BUFFER_M1_8[i] && 
            close > BUFFER_M1_13[i] && 
            close > BUFFER_M1_55[i] &&
            close > BUFFER_M1_144[i] && 
            
            close > BUFFER_M5_3[i] && 
            close > BUFFER_M5_8[i] && 
            close > BUFFER_M5_13[i] && 
            close > BUFFER_M5_55[i] &&
            close > BUFFER_M5_144[i] /*&&

            close > BUFFER_M15_144[i] &&
            close > BUFFER_M15_377[i]*/;
}

bool isSimetricBullish(int i){
   return BUFFER_M1_3[i] > BUFFER_M1_8[i] &&
         BUFFER_M1_8[i] > BUFFER_M1_13[i] &&
         BUFFER_M1_13[i] > BUFFER_M1_55[i] /*&&
         BUFFER_M1_55[i] > BUFFER_M1_144[i] &&
         BUFFER_M1_144[i] > BUFFER_M5_55[i]*/;
}

bool isSimetricBearlish(int i){
   return BUFFER_M1_3[i] < BUFFER_M1_8[i] &&
         BUFFER_M1_8[i] < BUFFER_M1_13[i] &&
         BUFFER_M1_13[i] < BUFFER_M1_55[i]/* &&
         BUFFER_M1_55[i] < BUFFER_M1_144[i] &&
         BUFFER_M1_144[i] < BUFFER_M5_55[i]*/;
}


bool ma_m_1_3_isGreaterThanAllMAs(int i){
   double m13 = BUFFER_M1_3[i];
   return m13 > BUFFER_M1_8[i] &&
         m13 > BUFFER_M1_13[i] &&
         m13 > BUFFER_M1_55[i] &&
         m13 > BUFFER_M1_144[i] &&
         
         m13 > BUFFER_M5_3[i] &&
         m13 > BUFFER_M5_8[i] &&
         m13 > BUFFER_M5_13[i] &&
         m13 > BUFFER_M5_55[i] &&
         m13 > BUFFER_M5_144[i] /*&&

         m13 > BUFFER_M15_144[i] &&
         m13 > BUFFER_M15_377[i]*/;
}

bool closeIsLowerThanAllMas(int i){
   double close = Close[i];
   return close < BUFFER_M1_3[i] && 
            close < BUFFER_M1_8[i] && 
            close < BUFFER_M1_13[i] && 
            close < BUFFER_M1_55[i] &&
            close < BUFFER_M1_144[i] && 
            
            close < BUFFER_M5_3[i] && 
            close < BUFFER_M5_8[i] && 
            close < BUFFER_M5_13[i] && 
            close < BUFFER_M5_55[i] &&
            close < BUFFER_M5_144[i] /*&&
            close < BUFFER_M15_144[i] &&
            close < BUFFER_M15_377[i]*/;
}

bool ma_m_1_3_isLowerThanAllMAs(int i){
  double m13 = BUFFER_M1_3[i];
   return m13 < BUFFER_M1_8[i] &&
         m13 < BUFFER_M1_13[i] &&
         m13 < BUFFER_M1_55[i] &&
         m13 < BUFFER_M1_144[i] &&
         m13 < BUFFER_M5_3[i] &&
         m13 < BUFFER_M5_8[i] &&
         m13 < BUFFER_M5_13[i] &&
         m13 < BUFFER_M5_55[i] &&
         m13 < BUFFER_M5_144[i] /*&&
         m13 < BUFFER_M15_144[i] &&
         m13 < BUFFER_M15_377[i]*/;
}