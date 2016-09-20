
public class Drink
{
   
    private int radius;
    private int height;
    private String type;
    private boolean fizzy;

   
    public Drink()
    {
        radius = 5;
        height = 25;
        type = "Coca Cola";
        fizzy = true;
    }
    
    public Drink(int drinkRadius, int drinkHeight, String drinkType, boolean drinkFizzy)
    {
        radius = drinkRadius;
        height = drinkHeight;
        type = drinkType;
        fizzy = drinkFizzy;
    }
    
    public int getRadius()
    {
        return radius;
    }
    
    public int getHeight()
    {
        return height;
    }
    
    public String getType()
    {
        return type;
    }
    
    public boolean getFizzy()
    {
        return fizzy;
    }
    
    public void contains()
    {
        System.out.println("The container can contain " + (3.141 * radius) * (radius  * height));
    }
    

    
}
