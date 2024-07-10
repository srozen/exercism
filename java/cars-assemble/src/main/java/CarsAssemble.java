public class CarsAssemble {
    final int productionPerHour = 221;

    private double successRate(int speed) {
        if (speed <= 4) return 1;
        if (speed <= 8) return 0.9;
        if (speed == 9) return 0.8;
        return 0.77;
    }

    public double productionRatePerHour(int speed) {
      return speed * productionPerHour * successRate(speed);
    }

    public int workingItemsPerMinute(int speed) {
        return (int) (productionRatePerHour(speed) / 60);
    }
}
