/**
 * Defines what after rockets have to do
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 * @see Rocket
 */
public interface OnAfterRocket extends Rocket {
  /**
   * Implement here your after trigger logic
   */
  void onAfterFire();
}
