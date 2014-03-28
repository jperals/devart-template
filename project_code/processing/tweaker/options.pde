public class Options {
  public float minAttraction = -1;
  public float maxAttraction = 1;
  public int exportFrameDelay, minExportFrameDelay = 1, maxExportFrameDelay = 300;
  public int maxLerpLevels = 3;
  public int minNumberOfArtifacts = 10;
  public int maxNumberOfArtifacts = 400;
  
  Options() {
    this(width, height);
  }

  Options(int w, int h) {
  }
}

