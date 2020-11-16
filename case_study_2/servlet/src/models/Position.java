package models;

public class Position {
    int positionId;
    String positionName;

    public Position(int positionId, String positionName) {
        this.positionId = positionId;
        this.positionName = positionName;
    }

    public Position() {
    }

    public int getPositionId() {
        return positionId;
    }

    public Position(String positionName) {
        this.positionName = positionName;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
