import java.util.ArrayList;

/**
 * Store details of club memberships.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Club
{
    // Define any necessary fields here ...
    // An ArrayList for storing the names of the members
    private ArrayList<Membership> members;
    // An array list for archived members
    private ArrayList<Membership> archive;
    // An array list for deleted members
    private ArrayList<Membership> deleted;
    
    
    /**
     * Constructor for objects of class Club
     */
    public Club()
    {
        // Initialise any fields here ...
        // make sure the arraylist is of the right type, depending on the other classes
        members = new ArrayList<Membership>();
        archive = new ArrayList<Membership>();
        deleted = new ArrayList<Membership>();
        
    }

    /**
     * Add a new member to the club's list of members.
     * @param member The member object to be added.
     */
    public void join(Membership member)
    {
        // this adds a new membership to the arraylist
        members.add(member);
    }

    /**
     * @return The number of members (Membership objects) in
     *         the club.
     */
    public int numberOfMembers()
    {
        // returns the size of the arraylist
        return members.size();
    }
    
    /**
       * Determine the number of members who joined in the given month
       * @param month The month we are interested in.
       * @return The number of members
    */
    public int joinedMonth(int month)
    {
        // uses a conditional or to check the month is in the range of 1 to 12
        if (month < 1 || month > 12)
        {
            System.out.println("Enter a month");
            return 0;     
        }
        else
        {
            int total = 0;
            for (Membership member : members)
            {
                if (member.getMonth() == month)
                {
                    // incremembts total by 1
                    total++;
                }
            }
            return total;
    }
}

public ArrayList purge(int month, int year)
{
    for (Membership member : members)
    {
        if (member.getMonth() == month)
        {
            archive.add(member);
            deleted.add(member);
        }
    }
    for (Membership member: deleted)
    {
        members.remove(member);
    }
    return archive;
}
}



