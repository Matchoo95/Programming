import java.util.Random;
/**
 * Write a description of class die here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Die
{
    // instance variables - replace the example below with your own
    private Random randomNumber;
    private int currentDots;
    private int finalNumber;
    
    /**
     * Constructor for objects of class die
     */
    public Die()
    {
        
        randomNumber = new Random(); 
        this.currentDots = 0;
        this.finalNumber = finalNumber;
        
    }

    /**
     * An example of a method - replace this comment with your own
     * 
     * @param  y   a sample parameter for a method
     * @return     the sum of x and y 
     */
    public void roll(Random randomNumber)
    {        
        randomNumber.nextInt(6); 
    }
    
    public int getCurrentDot(int randomNumber)
    {
        finalNumber = randomNumber;
        return finalNumber;
    }
}
