/**
 * Defines what before rockets have to do
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 * @see Rocket
 */
public interface OnBeforeRocket extends Rocket {
  /**
   * Implement here your before trigger logic
   */
  void onBeforeFire();
}
