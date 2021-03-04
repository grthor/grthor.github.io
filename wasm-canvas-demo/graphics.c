const unsigned int WIDTH = 400;
const unsigned int HEIGHT = 400;
unsigned int BUFFER[WIDTH * HEIGHT];
unsigned int color; 
//unsigned int color = 255000000000; // Start color is black
//int x = 0;
//int lineWidth = 10;

int status = 1;
unsigned int alpha = 0xff000000;
unsigned int r = 0xff;
unsigned int g = 0x00;
unsigned int b = 0x00;

unsigned int t_r;
unsigned int t_g;
unsigned int t_b;


void fromRtoG () {
	if (r == 0xff && g < 0xff) {
		g++;
	} else if (r > 0x00 && g == 0xff) {
		r--;
	} else if (r == 0x00 && g == 0xff) {
		status = 2;
	}
}

void fromGtoB () {
	if (g == 0xff && b < 0xff) {
		b++;
	} else if (g > 0x00 && b == 0xff) {
		g--;
	} else if (g == 0x00 && b == 0xff) {
		status = 3;
	}
}
	
void fromBtoR () {
	if (b == 0xff && r < 0xff) {
		r++;
	} else if (b > 0x00 && r == 0xff) {
		b--;
	} else if (b == 0x00 && r == 0xff) {
		status = 1;
	}
	
}

void go() {
    for (int i = 0; i < WIDTH; i++) {
        for (int j = 0; j < HEIGHT; j++) {
            BUFFER[WIDTH * i + j] = color;
        }
    }

	if (status == 1) {
		fromRtoG();
	} else if (status == 2) {
		fromGtoB();
	} else if (status == 3) {
		fromBtoR();
	}
	
	t_r = r * 0x000001;
	t_g = g * 0x000100;
	t_b = b * 0x010000;
	
	color = alpha | t_b | t_g | t_r;
}


