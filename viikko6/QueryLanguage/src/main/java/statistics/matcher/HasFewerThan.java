package statistics.matcher;

import statistics.Player;

public class HasFewerThan implements Matcher {

    public int points;
    public String pointCategory;

    public HasFewerThan(int points, String pointCategory) {
        this.points = points;
        this.pointCategory = pointCategory;
    }        
    
    @Override
    public boolean matches(Player p) {
        HasAtLeast atLeast = new HasAtLeast(points, pointCategory);
        return new Not(atLeast).matches(p);
    }
    
}
