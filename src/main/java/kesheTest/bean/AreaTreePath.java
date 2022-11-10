package kesheTest.bean;

import org.springframework.stereotype.Component;

@Component
public class AreaTreePath {
    private int id;
    //祖先id
    private int ancestor;
    //后代id
    private int descendant;
    //层级深度
    private int depth;

    public AreaTreePath() {
    }

    public AreaTreePath(int id, int ancestor, int descendant, int depth) {
        this.id = id;
        this.ancestor = ancestor;
        this.descendant = descendant;
        this.depth = depth;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAncestor() {
        return ancestor;
    }

    public void setAncestor(int ancestor) {
        this.ancestor = ancestor;
    }

    public int getDescendant() {
        return descendant;
    }

    public void setDescendant(int descendant) {
        this.descendant = descendant;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    @Override
    public String toString() {
        return "AreaTreePath{" +
                "id=" + id +
                ", ancestor=" + ancestor +
                ", descendant=" + descendant +
                ", depth=" + depth +
                '}';
    }
}
