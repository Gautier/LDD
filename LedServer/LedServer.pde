#define LED1_PIN 6
#define LED2_PIN 5

void setup() {
  pinMode(LED1_PIN, OUTPUT);
  pinMode(LED2_PIN, OUTPUT);
  Serial.begin(9600);
}

byte cleanInput(int inByte) {
    switch (inByte) {
        case 'A':
        case 'B':
        case 'C':
            return inByte;
        default:
            return 0;
            break;
    }
}

void switchLedsOff() {
    digitalWrite(LED1_PIN, LOW);
    digitalWrite(LED2_PIN, LOW);
}

void blinkingTick() {
    static int blinkingLed = LED1_PIN;

    if (blinkingLed == LED1_PIN) {
        blinkingLed = LED2_PIN;
    } else {
        blinkingLed = LED1_PIN;
    }
    digitalWrite(blinkingLed, HIGH);
}

void loop() {
    static int state = 0;

    delay(100);

    if (Serial.available() > 0) {
        // get incoming byte:
        int inStatus =  cleanInput(Serial.read());
        if (inStatus != 0) {
            state = inStatus;
        }
    }

    switchLedsOff();

    switch (state) {
        case 'A':
            digitalWrite(LED1_PIN, HIGH);
            break;
        case 'B':
            digitalWrite(LED2_PIN, HIGH);
            break;
        case 'C':
            blinkingTick();
            break;
    }
}
