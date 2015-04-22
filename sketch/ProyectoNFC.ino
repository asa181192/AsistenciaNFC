#include <PN532.h>
#include <LiquidCrystal.h>

#define SCK 13
#define MOSI 11
#define SS 10
#define MISO 12

LiquidCrystal lcd(4, 5, 6, 7, 8 , 9);//Se cambiaron los pines ya que interfieren con la conexion SPI   
PN532 nfc(SCK, MISO, MOSI, SS);
int buzzer = A0; 
int ledVerde = 2;
int ledRojo = 3; 

void setup(void) {
    Serial.begin(9600);
    nfc.begin();
    nfc.SAMConfig();
    pinMode(ledVerde,OUTPUT);
    pinMode(ledRojo,OUTPUT);
    pinMode(buzzer,OUTPUT);
    lcd.begin(16, 2);
       lcd.setCursor(0,1);}

void loop(void) {
    lcd.setCursor(0,0);
    lcd.write("BIENVENIDO");
    lcd.setCursor(0,1);
    lcd.write("SISTEMA VER 1.0");
    uint32_t id;
    // look for MiFare type cards
    id = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A);
    if (id != 0) {
      lcd.clear();
      lcd.setCursor(0,1);
       lcd.print("LEYENDO...");
       delay(1000);
       lcd.clear();
       lcd.print("RETIRE SU TAG ...");
       delay(2000);
       lcd.clear();
       Serial.println(id);
          
    }


    if(Serial.available()){
     
     char led = (char)Serial.read();
     if(led=='1'){
       lcd.clear();
       digitalWrite(ledVerde,HIGH);
       lcd.setCursor(0,1);
       lcd.print("ACEPTADO");
       digitalWrite(buzzer,HIGH);
       delay(700);
        digitalWrite(buzzer,LOW);
       delay(2000);
       digitalWrite(ledVerde,LOW);
       lcd.clear();
     }
       if(led=='0'){
        lcd.clear();
       digitalWrite(ledRojo,HIGH);
       lcd.setCursor(0,1);
       lcd.write("DENEGADO");
       digitalWrite(buzzer,HIGH);
       delay(500);
       digitalWrite(buzzer,LOW);
       delay(500);
       digitalWrite(buzzer,HIGH);
       delay(500);
       digitalWrite(buzzer,LOW);
       delay(1300);
       digitalWrite(ledRojo,LOW);
       lcd.clear();
      }
    
}//fin lectura serial 
}//fin void
