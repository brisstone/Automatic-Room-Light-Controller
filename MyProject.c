// LCD module connections
 sbit LCD_RS at RD1_bit;
 sbit LCD_EN at RD3_bit;
 sbit LCD_D4 at RD4_bit;
 sbit LCD_D5 at RD5_bit;
 sbit LCD_D6 at RD6_bit;
 sbit LCD_D7 at RD7_bit;
 sbit LCD_RS_Direction at TRISD1_bit;
 sbit LCD_EN_Direction at TRISD3_bit;
 sbit LCD_D4_Direction at TRISD4_bit;
 sbit LCD_D5_Direction at TRISD5_bit;
 sbit LCD_D6_Direction at TRISD6_bit;
 sbit LCD_D7_Direction at TRISD7_bit;
 // End LCD module connections

//__CONFIG(0x3FF1);
Clock_8MHz();

#define sA PORTB.F0
#define sB PORTB.F1
#define sL PORTA.F2


//assuming sensors are variables sA and sB, and lights switch is sL
unsigned int people = 0;              // counter for people inside the room
char AllowNextCount = 0;              // boolean indicating if allowing next count or not
int count = 0;
int on;
int off = 0;
short int InOut;
unsigned char str_people[17], str_sL[17];                    // 1 = entering; -1 = exiting

void main(void){
    // TRIS registers
    TRISA = 0b00000011;                       // RELAY AS OUTPUT
    TRISB= 0xff;               // SET PORT B AS INPUT
                // SENSORS PORT
    TRISD = 0x00;          // LCD



    // Initializing LCD
    LCD_Init();

    // Set data on display the first time
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
     Lcd_Out(1,1,"Counter^: ");
     IntToStr(count, str_people);
     Lcd_Out(1,11,str_people);
     LCD_Out(2,1,"Lights:  ");
     IntToStr(off ,str_sL);
     LCD_Out(2,11,str_sL);
     delay_ms(1000);

    while (1){

      if(sA==0)
      {

         count = count + 1;
          Delay_ms(500);

               if ( count<1)
         { on = 0; }
         else
         {    on = 1;
          }
      }

      if(sB==0)
      {

               count = count - 1;
           delay_ms(500);

                if ( count>=1)
              { on = 1; }
             else
             {    on = 0;
              }
        }

        if(count>=1)
        { sL=1;
        }
          else {
          sL=0;}

            if (count>=0) {
            

             Lcd_Out(1,1,"Counters^: ");
            IntToStr(count, str_people);
            Lcd_Out(1,11,str_people);
            LCD_Out(2,1,"Lights:  ");
            IntToStr(on ,str_sL);
            LCD_Out(2,11,str_sL);
             delay_ms(100);
               }
    }
}