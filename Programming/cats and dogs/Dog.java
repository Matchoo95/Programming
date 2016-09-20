public class Dog
{

    private String name;
    private double weight;
    private String preferredFood;
    
    public Dog(String dogName, double dogWeight, String dogPreferredFood)
    {
        
    }
    
    public Dog(String dogName)
    {
        weight = 400;
        preferredFood = "Pedigree Chum";
        
    }
    
    // set methods
    public void setName(String dogName)
    {
        name = dogName;
    }
    public void setWeight(double dogWeight)
    {
        weight = dogWeight;
    }
    public void setPreferredFood(String dogPreferredFood)
    {
        preferredFood = dogPreferredFood;
    }
    
    // get methods
    public String getName()
    {
        return name;
    }
    public double getWeight()
    {
        return weight;
    }
    public String getPreferredFood()
    {
        return preferredFood;
    }
    
    public void bark()
    {
        System.out.println("woof woof woof");
    }
    
    public void feeding()
    {                  
        if (preferredFood.equals("Pedigree Chum")) 
        {
            System.out.println("The dog should eat " + (weight / 200) * 5);
        }
        else if (preferredFood.equals("Barkers Chicken")) 
        {
            System.out.println("The dog should eat " + (weight / 200) * 8); 
        }
        else if (preferredFood.equals("Woofers Beef")) 
        {
            System.out.println("The dog should eat " + (weight / 200) * 10);
        }
        else
        {
            System.out.println("None specified");
        }
    }

}