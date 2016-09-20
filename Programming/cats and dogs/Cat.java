public class Cat
{
    // cat name
    private String name;
    // cat age
    private int age;
    // cat fur colour
    private String furColour;
    // where true is happy and false is sad
    private boolean disposition;
    // constructors
    public Cat(String catName, int catAge, String catFurColour, boolean catDisposition)
    {
       name = catName;
       age = catAge;
       furColour = catFurColour;
       disposition = catDisposition;
    }
    public Cat(String catName)
    {
        age = 1;
        furColour = "ginger";
        disposition = true;        
    }
   
    // set methods (mutators)
    public void setName(String catName)
    {
        name = catName;
    }
    public void setAge(int catAge)
    {
        age = catAge;
    }
    public void setFurColour(String catFurColour)
    {
        furColour = catFurColour;
    }
    public void setDisposition(boolean catDisposition)
    {
        disposition = catDisposition;
    }
    
    // get methods (accessors)
    public String getName()
    {
        return name;
    }
    public int getAge()
    {
        return age;
    }
    public String getFurColour()
    {
        return furColour;
    }
    public boolean getDisposition()
    {
        return disposition;
    }
    
    // methods
    public void purr()
    {
        System.out.println("purr purr purr");
    }
    
    public void miaow()
    {
        System.out.println("miaow miaow miaow");
    }
    
    public void makeSound()
    {
        if(disposition = true) 
        {
            purr();
        }
        else
        {
            miaow();
        }
    }
    
}
