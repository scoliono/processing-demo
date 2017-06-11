int width = 640;
int height = 480;
float angle = 0.0;

// Interval for drawing lines; smaller is more precise
int precision = 25;

// Magnitude of a single keypress (radians)
float sensitivity = PI/36;

// Trippy effect: Doesn't clear the screen, allowing you to create cool patterns.
boolean trippy = false;

void setup()
{
    size(640, 480);
    background(255);
    noLoop();
}

void draw()
{
    // Clear the screen.
    if (!trippy)
    {
        background(255);
    }
  
    // Coordinates representing the origin.
    int mdptX = width/2;
    int mdptY = height/2;
    
    // Length of a unit line segment.
    int len = mdptX;
    
    // X, Y axes
    line(mdptX, mdptY, mdptX + len * cos(angle), mdptY + len * sin(angle));
    line(mdptX, -height, mdptX, height);
    
    // Lines of the Bezier curve
    for (int i = 0; i <= len; i += precision)
    {
        line(mdptX, mdptY + i - len, mdptX + i * cos(angle), mdptY + i * sin(angle));
    }
}

void keyPressed()
{
    boolean flag = false;
    if (key == CODED)
    {
        if (keyCode == LEFT)
        {
            angle += sensitivity;
            flag = true;
        }
        else if (keyCode == RIGHT)
        {
            angle -= sensitivity;
            flag = true;
        }
        else if (keyCode == DOWN)
        {
            precision += 3;
            flag = true;
        }
        else if (keyCode == UP)
        {
            if (precision - 3 > 0)
            {
                precision -= 3;
                flag = true;
            }
        }
        // Things need to be redrawn
        if (flag)
        {
            redraw();
        }
    }
}