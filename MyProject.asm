
_main:

;MyProject.c,33 :: 		void main(void){
;MyProject.c,35 :: 		TRISA = 0b00000011;                       // RELAY AS OUTPUT
	MOVLW      3
	MOVWF      TRISA+0
;MyProject.c,36 :: 		TRISB= 0xff;               // SET PORT B AS INPUT
	MOVLW      255
	MOVWF      TRISB+0
;MyProject.c,38 :: 		TRISD = 0x00;          // LCD
	CLRF       TRISD+0
;MyProject.c,43 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;MyProject.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,47 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,48 :: 		Lcd_Out(1,1,"Counter^: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,49 :: 		IntToStr(count, str_people);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _str_people+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,50 :: 		Lcd_Out(1,11,str_people);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _str_people+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,51 :: 		LCD_Out(2,1,"Lights:  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,52 :: 		IntToStr(off ,str_sL);
	MOVF       _off+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _off+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _str_sL+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,53 :: 		LCD_Out(2,11,str_sL);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _str_sL+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,54 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;MyProject.c,56 :: 		while (1){
L_main1:
;MyProject.c,58 :: 		if(sA==0)
	BTFSC      PORTB+0, 0
	GOTO       L_main3
;MyProject.c,61 :: 		count = count + 1;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;MyProject.c,62 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;MyProject.c,64 :: 		if ( count<1)
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      1
	SUBWF      _count+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,65 :: 		{ on = 0; }
	CLRF       _on+0
	CLRF       _on+1
	GOTO       L_main6
L_main5:
;MyProject.c,67 :: 		{    on = 1;
	MOVLW      1
	MOVWF      _on+0
	MOVLW      0
	MOVWF      _on+1
;MyProject.c,68 :: 		}
L_main6:
;MyProject.c,69 :: 		}
L_main3:
;MyProject.c,71 :: 		if(sB==0)
	BTFSC      PORTB+0, 1
	GOTO       L_main7
;MyProject.c,74 :: 		count = count - 1;
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;MyProject.c,75 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;MyProject.c,77 :: 		if ( count>=1)
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      1
	SUBWF      _count+0, 0
L__main17:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;MyProject.c,78 :: 		{ on = 1; }
	MOVLW      1
	MOVWF      _on+0
	MOVLW      0
	MOVWF      _on+1
	GOTO       L_main10
L_main9:
;MyProject.c,80 :: 		{    on = 0;
	CLRF       _on+0
	CLRF       _on+1
;MyProject.c,81 :: 		}
L_main10:
;MyProject.c,82 :: 		}
L_main7:
;MyProject.c,84 :: 		if(count>=1)
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      1
	SUBWF      _count+0, 0
L__main18:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
;MyProject.c,85 :: 		{ sL=1;
	BSF        PORTA+0, 2
;MyProject.c,86 :: 		}
	GOTO       L_main12
L_main11:
;MyProject.c,88 :: 		sL=0;}
	BCF        PORTA+0, 2
L_main12:
;MyProject.c,90 :: 		if (count>=0) {
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      0
	SUBWF      _count+0, 0
L__main19:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
;MyProject.c,93 :: 		Lcd_Out(1,1,"Counters^: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,94 :: 		IntToStr(count, str_people);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _str_people+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,95 :: 		Lcd_Out(1,11,str_people);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _str_people+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,96 :: 		LCD_Out(2,1,"Lights:  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,97 :: 		IntToStr(on ,str_sL);
	MOVF       _on+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _on+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _str_sL+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,98 :: 		LCD_Out(2,11,str_sL);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _str_sL+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,99 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;MyProject.c,100 :: 		}
L_main13:
;MyProject.c,101 :: 		}
	GOTO       L_main1
;MyProject.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
