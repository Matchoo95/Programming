import java.awt.Color;

/**
 * Class Universe - a universe which contains 3 objects  
 *
 * @author Robert Topp
 * @version 2016.1.22
 */

public class Universe  
{
    private Canvas universe;
    private int leftEdge = 0;     // coordinates of the edges of the universe
    private int topEdge = 0;
    private int rightEdge;
    private int bottomEdge;

    /**
     * Create a universe with default name and size. Creates a fresh canvas to display the universe
     */
    public Universe()
    {
        universe = new Canvas("Universe Demo", 600, 500);
        rightEdge = 600;
        bottomEdge = 500;
    }
    /**
     *  Create a universe with given name and size
     *  @param name The name to give the universe
     *  @param rightEdge The maximum x coordinate
     *  @param bottomEdge The maximum y coordinate
     */
     public Universe(String name, int rightEdge, int bottomEdge)
    {
        universe = new Canvas(name, rightEdge, bottomEdge);
        this.rightEdge = rightEdge;
        this.bottomEdge = bottomEdge;
    }
    
    /**
     * Erase an object from the view of the universe
     * 
     * @param spaceObj The object to be erased
     */
    public void erase(Space_Object spaceObj)
    {
        universe.eraseCircle(spaceObj.getXPosition(), spaceObj.getYPosition(), spaceObj.getDiameter());
    }
    
     /**
     * Draw an object at its current position onto the view of the universe.
     * 
     * @param spaceObj The object to be drawn
     */
    public void draw(Space_Object spaceObj)
    {
        universe.setForegroundColor(spaceObj.getColor());
        universe.fillCircle(spaceObj.getXPosition(), spaceObj.getYPosition(), spaceObj.getDiameter());
    }
    
    /**
     * Return the y cordinate of the bottom of the universe
     */
    public int getGround()
    {
        return bottomEdge;
    }
   
    /**
     * Add three objects and make them move
     */
    public void demo()
    {
        Space_Object object = new Space_Object(500, 500, -2, -2, 25, Color.BLUE, this);
        Space_Object object2 = new Space_Object(200, 200, 2, 2, 20, Color.RED, this);
        Space_Object object3 = new Space_Object(100, 400, 2, 4, 24, Color.GREEN, this);

        boolean finished =  false; 
        while(!finished) {
            universe.wait(50);           // small delay
            object.move();
            object2.move();
            object3.move();
            // stop once a object has travelled a certain distance on x axis
            if(object.getXPosition() >= 550 || object2.getXPosition() >= 550 || object3.getXPosition() >= 550) { //do i need this? 
                finished = true;
            }
        }
    }
}
