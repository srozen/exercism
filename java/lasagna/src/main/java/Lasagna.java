public class Lasagna {
  final int baseCookingTime = 40;
  final int preparationTimePerLayer = 2;

  public int expectedMinutesInOven() {
    return baseCookingTime;
  }

  public int remainingMinutesInOven(int actualMinutes) {
    return expectedMinutesInOven() - actualMinutes;
  }

  public int preparationTimeInMinutes(int nLayers) {
    return nLayers * preparationTimePerLayer;
  }

  public int totalTimeInMinutes(int nLayers, int actualMinutes) {
    return preparationTimeInMinutes(nLayers) + actualMinutes;
  }
}
