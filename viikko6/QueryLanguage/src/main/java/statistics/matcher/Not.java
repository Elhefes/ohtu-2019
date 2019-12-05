package statistics.matcher;

import statistics.Player;

public class Not implements Matcher {

    public Matcher matches;
    
    public Not(Matcher matches) {
        this.matches = matches;
    }

    @Override
    public boolean matches(Player p) {
        return !matches.matches(p);
    }
}
