import java.awt.*;


/**
 * Class Space_Object - an object that exists in a finite Universe. The object bounces off
 * the bottom edge of the universe.
 * 
 * Movement can be initiated by repeated calls to the "move" method.
 * 
 * N.B This class is incomplete and still under development. It will require updating to
 * complete the INTPROG coursework assignment.
 * 
 * @author Robert Topp
 *
 * @version 2016.01.22
 */

public class Space_Object
{
    private Color color;
    private int diameter;
    private int xPosition;
    private int yPosition;
    private final int groundPosition;     // y position of the bottom of the Universe
    private Universe universe;
    private int xSpeed;                 // current horizontal speed   (+  moving left to right, - right to left
    private int ySpeed;                // current vertical speed ( + moving down, - moving up)
    private int lifeTime;

    /**
     * Constructor for objects of class Space_Object
     *
     * @param xPos  the horizontal coordinate of the object
     * @param yPos  the vertical coordinate of the object
     * @param xVel  the horizontal speed of the object
     * @param yVel  the vertical speed of the object
     * @param objectDiameter  the diameter (in pixels) of the object
     * @param objectColor  the color of the object
     * @param theUniverse  the universe this object is in
     */
    public Space_Object(int xPos, int yPos, int xVel, int yVel, int objectDiameter, Color objectColor, Universe theUniverse)
    {
        xPosition = xPos;
        yPosition = yPos;
        xSpeed = xVel;
        ySpeed = yVel;
        color = objectColor;
        diameter = objectDiameter;
        universe = theUniverse;
        // v add these to parameters
        groundPosition = universe.getGround();
        lifeTime = 1000000;
        
    }

   
    /**
     * Move this object according to its position and speed and redraw.
     **/
    public void move()
    {
        // remove from universe at the current position
        universe.erase(this);
            
        // compute new position
       
        yPosition += ySpeed;
        xPosition += xSpeed;

        // check if it has hit the ground
        if(yPosition >= (groundPosition - diameter) && ySpeed > 0) { // check what && does
            yPosition = groundPosition - diameter;
            ySpeed = -ySpeed; 
        }

        // draw again at new position
        universe.draw(this);
    }    
    // add more return methods and get methods for testing values
    /**
     * return the horizontal position of this object
     */
    public int getXPosition()
    {
        return xPosition;
    }

    /**
     * return the vertical position of this object
     */
    public int getYPosition()
    {
        return yPosition;
    }
    
    /**
     * return the colour of this object
    */
    public Color getColor()
    {
        return color;
    }
    
    /**
     * return the diameter of this object
     */
    public int getDiameter()
    {
        return diameter;
    }
}
